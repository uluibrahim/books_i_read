import 'package:books_i_read/core/component/platform_widgets/alert_dialog/error_alert_dialog.dart';
import 'package:books_i_read/core/init/language/locale_keys.dart';
import 'package:books_i_read/product/custom_appbar.dart';
import 'package:books_i_read/product/enum/view_state.dart';
import 'package:books_i_read/product/validation.dart';
import 'package:books_i_read/screen/create_book/viewmodel/cretate_book_viewmodel.dart';
import 'package:books_i_read/screen/home/viewmodel/home_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/component/button/custom_elevated_button.dart';
import '../../../core/component/date_picker/container_datepicker.dart';
import '../../../core/component/loading/loading_container.dart';
import '../../../core/component/text_field/text_field_container.dart';

class CreateBookPage extends StatefulWidget {
  final HomeViewmoel viewmodel;
  final bool isCretae;
  final int? index;
  const CreateBookPage(
      {Key? key, required this.viewmodel, required this.isCretae, this.index})
      : super(key: key);

  @override
  State<CreateBookPage> createState() => _CreateBookPageState();
}

class _CreateBookPageState extends State<CreateBookPage> {
  final _formKey = GlobalKey<FormState>();

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
              context: context,
              titleText: widget.isCretae
                  ? LocaleKeys.addingBook.tr()
                  : LocaleKeys.updatingTheBook.tr())
          : SingleChildScrollView(
              child: Form(
                key: _formKey,
                autovalidateMode: createBookViewmodel.autovalidateMode,
                child: Column(
                  children: [
                    TextFieldContainer(
                      context: context,
                      textController: createBookViewmodel.controllerName,
                      hintText: LocaleKeys.name.tr(),
                      validator: (value) =>
                          Validation.validationNullCheck(value),
                    ),
                    TextFieldContainer(
                      context: context,
                      textController: createBookViewmodel.controllerWriter,
                      hintText: LocaleKeys.writer.tr(),
                      validator: (value) =>
                          Validation.validationNullCheck(value),
                    ),
                    TextFieldContainer(
                      context: context,
                      textController: createBookViewmodel.controllerCountPage,
                      hintText: LocaleKeys.countPage.tr(),
                      validator: (value) =>
                          Validation.validationNumberIsEmpty(value),
                    ),
                    const SizedBox(height: 10),
                    ContainerDatePicker(
                      context: context,
                      controller: createBookViewmodel.controllerStartDate,
                      labelText: LocaleKeys.startDate.tr(),
                    ),
                    const SizedBox(height: 10),
                    ContainerDatePicker(
                      context: context,
                      controller: createBookViewmodel.controllerFinishDate,
                      labelText: LocaleKeys.finishDate.tr(),
                    ),
                    buildSaveButton(createBookViewmodel),
                  ],
                ),
              ),
            ),
    );
  }

  CustomElevatedButton buildSaveButton(
      CreateBookViewmodel createBookViewmodel) {
    return CustomElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();

            if (createBookViewmodel.controllerStartDate.text.isEmpty ||
                createBookViewmodel.controllerFinishDate.text.isEmpty) {
              PlatformErrorAlertDialog(
                      errorMessage:
                          LocaleKeys.pleaseMakeSureYouEnterTheDate.tr())
                  .showDialogPlatform(context);
            } else {
              if (widget.isCretae) {
                createBookViewmodel
                    .createBook(
                        name: createBookViewmodel.controllerName.text,
                        writer: createBookViewmodel.controllerWriter.text,
                        countPage: createBookViewmodel.controllerCountPage.text,
                        startDate: createBookViewmodel.controllerStartDate.text,
                        finishDate:
                            createBookViewmodel.controllerFinishDate.text,
                        viewmodel: widget.viewmodel)
                    .then((value) {
                  value
                      ? Navigator.pop(context)
                      : PlatformErrorAlertDialog(
                              errorMessage: LocaleKeys.error.tr())
                          .showDialogPlatform(context);
                });
              } else {
                createBookViewmodel
                    .updateBook(
                        id: createBookViewmodel.bookModel!.id!,
                        name: createBookViewmodel.controllerName.text,
                        writer: createBookViewmodel.controllerWriter.text,
                        countPage: createBookViewmodel.controllerCountPage.text,
                        startDate: createBookViewmodel.controllerStartDate.text,
                        finishDate:
                            createBookViewmodel.controllerFinishDate.text,
                        index: widget.index!,
                        viewmodel: widget.viewmodel)
                    .then((value) {
                  value
                      ? Navigator.pop(context)
                      : PlatformErrorAlertDialog(
                              errorMessage: LocaleKeys.error.tr())
                          .showDialogPlatform(context);
                });
              }
            }
          }
        },
        text: LocaleKeys.save.tr());
  }
}
