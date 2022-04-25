import 'package:books_i_read/core/extension/context_extension.dart';
import 'package:books_i_read/core/init/language/locale_keys.dart';
import 'package:books_i_read/core/init/theme/theme_notifier.dart';
import 'package:books_i_read/product/custom_action_pane.dart';
import 'package:books_i_read/product/custom_appbar.dart';
import 'package:books_i_read/product/enum/view_state.dart';
import 'package:books_i_read/screen/book_summary/view/book_summary_view.dart';
import 'package:books_i_read/screen/book_summary/viewmodel/book_summary_viewmodel.dart';
import 'package:books_i_read/screen/home/viewmodel/home_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../../../core/component/loading/loading_container.dart';
import '../../../core/component/platform_widgets/alert_dialog/error_alert_dialog.dart';
import '../../create_book/view/create_book_page.dart';
import '../../create_book/viewmodel/cretate_book_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<HomeViewmoel>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider(
                create: (context) => CreateBookViewmodel(),
                child: CreateBookPage(
                  viewmodel: viewmodel,
                  isCretae: true,
                ),
              ),
            ),
          );
        },
        child: const Icon(Icons.bookmark_add),
      ),
      appBar: CustomAppbar(
          actionsWidgets: [
            IconButton(
              onPressed: () {
                context.read<ThemeNotifier>().changeTheme();
              },
              icon: context.watch<ThemeNotifier>().currenThemeEnum !=
                      AppThemes.light
                  ? const Icon(Icons.wb_sunny)
                  : const Icon(Icons.nightlight),
            ),
          ],
          titletext: LocaleKeys.homePage.tr(),
          isHaveLeading: false,
          context: context),
      body: viewmodel.state == ViewState.busy
          ? LoadingContainerIndicator(
              context: context,
              titleText: LocaleKeys.loading.tr(),
            )
          : viewmodel.state == ViewState.idle
              ? buildListBook(viewmodel)
              : PlatformErrorAlertDialog(errorMessage: LocaleKeys.error.tr()),
    );
  }

  Column buildListBook(HomeViewmoel viewmodel) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: viewmodel.myBooks!.length,
            itemBuilder: (context, index) {
              return Slidable(
                startActionPane: buildActionPane(viewmodel, index),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangeNotifierProvider(
                            create: (context) => BookSummaryViewmodel(),
                            child: BookSummaryView(
                              title: viewmodel.myBooks![index].name ?? "",
                            ),
                          ),
                        ),
                      );
                    },
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(viewmodel.myBooks![index].name!),
                        Text(viewmodel.myBooks![index].writer!)
                      ],
                    ),
                    subtitle: Padding(
                      padding: context.paddingLow,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(LocaleKeys.startDate.tr() +
                              ":  " +
                              viewmodel.myBooks![index].startDate!.toString()),
                          Text(LocaleKeys.finishDate.tr() +
                              ":  " +
                              viewmodel.myBooks![index].finishDate!.toString()),
                          Text(LocaleKeys.countPage.tr() +
                              ":  " +
                              viewmodel.myBooks![index].countPage!.toString()),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  ActionPane buildActionPane(HomeViewmoel viewmodel, int index) {
    return CustomActionPane(
      widgets: [
        SlidableAction(
          onPressed: (context) {
            viewmodel.deleteBook(viewmodel.myBooks![index].id!).then((value) {
              if (!value) {
                const PlatformErrorAlertDialog(errorMessage: "Silinemedi")
                    .showDialogPlatform(context);
              }
            });
          },
          backgroundColor: const Color(0xFFFE4A49),
          foregroundColor: Colors.white,
          icon: Icons.delete,
        ),
        SlidableAction(
          onPressed: (context) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider(
                  create: (context) =>
                      CreateBookViewmodel(bookModel: viewmodel.myBooks![index]),
                  child: CreateBookPage(
                    viewmodel: viewmodel,
                    isCretae: false,
                    index: index,
                  ),
                ),
              ),
            );
          },
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          icon: Icons.edit,
        ),
      ],
    );
  }
}
