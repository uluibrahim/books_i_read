import 'package:books_i_read/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class TextFieldContainer extends Container {
  late final BuildContext context;
  late final TextEditingController textController;
  late final String hintText;
  final String? Function(String?)? validator;

  TextFieldContainer({
    Key? key,
    required this.context,
    required this.textController,
    required this.hintText,
    this.validator,
  }) : super(
          key: key,
          margin: context.paddingLow,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(width: 1),
          ),
          child: TextFieldWidget(
            text: hintText,
            textController: textController,
            validatorText: validator,
          ),
        );
}

class TextFieldWidget extends TextFormField {
  late final TextEditingController textController;
  late final String text;
  final String? Function(String?)? validatorText;

  TextFieldWidget({
    Key? key,
    required this.textController,
    required this.text,
    this.validatorText,
  }) : super(
            key: key,
            controller: textController,
            decoration: InputDecoration(
              labelText: text,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: const EdgeInsets.all(10.0),
            ),
            validator: validatorText);
}
