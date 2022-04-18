import 'package:books_i_read/core/init/language/locale_keys.dart';
import 'package:books_i_read/product/custom_appbar.dart';
import 'package:books_i_read/product/enum/view_state.dart';
import 'package:books_i_read/screen/create_book/viewmodel/cretate_book_viewmodel.dart';
import 'package:books_i_read/screen/home/model/book_model.dart';
import 'package:books_i_read/screen/home/viewmodel/home_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/component/button/custom_elevated_button.dart';
import '../../../core/component/date_picker/conteiner_datepicker.dart';
import '../../../core/component/loading/loading_container.dart';
import '../../../core/component/text_field/text_field_container.dart';

class CreateBookPage extends StatefulWidget {
  final HomeViewmoel viewmodel;
  final bool isCretae;
  final BookModel? bookModel;
  const CreateBookPage(
      {Key? key,
      required this.viewmodel,
      required this.isCretae,
      this.bookModel})
      : super(key: key);

  @override
  State<CreateBookPage> createState() => _CreateBookPageState();
}

class _CreateBookPageState extends State<CreateBookPage> {
  late final TextEditingController _controllerName;
  late final TextEditingController _controllerWriter;
  late final TextEditingController _controllerStartDate;
  late final TextEditingController _controllerFinishDate;
  late final TextEditingController _controllerCountPage;
  @override
  void initState() {
    super.initState();
    _controllerName = TextEditingController(
        text: widget.isCretae ? null : widget.bookModel!.name);
    _controllerWriter = TextEditingController(
        text: widget.isCretae ? null : widget.bookModel!.writer);
    _controllerStartDate = TextEditingController(
        text: widget.isCretae ? null : widget.bookModel!.startDate);
    _controllerFinishDate = TextEditingController(
        text: widget.isCretae ? null : widget.bookModel!.finishDate);
    _controllerCountPage = TextEditingController(
        text: widget.isCretae ? null : widget.bookModel!.countPage);
  }

  @override
  void dispose() {
    _controllerName.dispose();
    _controllerWriter.dispose();
    _controllerStartDate.dispose();
    _controllerFinishDate.dispose();
    _controllerCountPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final createBookViewmodel = Provider.of<CreateBookViewmodel>(context);
    return Scaffold(
      appBar: CustomAppbar(
          titletext: widget.isCretae
              ? LocaleKeys.addBook.tr()
              : LocaleKeys.updateBook.tr(),
          isHaveLeading: true,
          context: context),
      body: createBookViewmodel.state == ViewState.busy
          ? LoadingContainerIndicator(
              context: context, titleText: "Kitap ekleniyor")
          : Column(
              children: [
                TextFieldContainer(
                  context: context,
                  textController: _controllerName,
                  hintText: LocaleKeys.name.tr(),
                ),
                TextFieldContainer(
                  context: context,
                  textController: _controllerWriter,
                  hintText: LocaleKeys.writer.tr(),
                ),
                TextFieldContainer(
                  context: context,
                  textController: _controllerCountPage,
                  hintText: "Sayfa sayısı",
                ),
                ContainerDatePicker(
                  context: context,
                  controller: _controllerStartDate,
                  labelText: LocaleKeys.startDate.tr(),
                ),
                ContainerDatePicker(
                  context: context,
                  controller: _controllerFinishDate,
                  labelText: LocaleKeys.finishDate.tr(),
                ),
                buildSaveButton(createBookViewmodel),
              ],
            ),
    );
  }

  CustomElevatedButton buildSaveButton(
      CreateBookViewmodel createBookViewmodel) {
    return CustomElevatedButton(
        onPressed: () {
          if (widget.isCretae) {
            createBookViewmodel.state = ViewState.busy;
            widget.viewmodel
                .createBook(
                    name: _controllerName.text,
                    writer: _controllerWriter.text,
                    countPage: 20,
                    startDate: _controllerStartDate.text,
                    finishDate: _controllerFinishDate.text)
                .then((value) {
              if (value) {
                createBookViewmodel.state = ViewState.idle;
                widget.viewmodel.myBooks!.add(widget.viewmodel.newBook!);
              } else {
                createBookViewmodel.state = ViewState.error;
              }
            });
          } else {}
        },
        text: LocaleKeys.save.tr());
  }
}
