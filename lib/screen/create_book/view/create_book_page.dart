import 'package:books_i_read/core/init/language/locale_keys.dart';
import 'package:books_i_read/product/custom_appbar.dart';
import 'package:books_i_read/screen/home/model/book_model.dart';
import 'package:books_i_read/screen/home/viewmodel/home_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/component/button/custom_elevated_button.dart';
import '../../../core/component/date_picker/conteiner_datepicker.dart';
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
  }

  @override
  void dispose() {
    _controllerName.dispose();
    _controllerWriter.dispose();
    _controllerStartDate.dispose();
    _controllerFinishDate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
          titletext: widget.isCretae
              ? LocaleKeys.addBook.tr()
              : LocaleKeys.updateBook.tr(),
          isHaveLeading: true,
          context: context),
      body: Column(
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
          buildSaveButton,
        ],
      ),
    );
  }

  CustomElevatedButton get buildSaveButton {
    return CustomElevatedButton(
        onPressed: () {
          if (widget.isCretae) {
          } else {}
        },
        text: LocaleKeys.save.tr());
  }
}
