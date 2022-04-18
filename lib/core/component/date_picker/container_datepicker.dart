import 'package:books_i_read/core/extension/context_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ContainerDatePicker extends Container {
  late final BuildContext context;
  late final TextEditingController controller;
  late final String labelText;
  
  ContainerDatePicker({
    Key? key,
    required this.context,
    required this.controller,
    required this.labelText,
  }) : super(
          key: key,
          padding: context.paddingLowHorizontalAndVertical,
          child: Row(
            children: [
              Expanded(
                  flex: 80,
                  child: buildDatePicker(context, controller, labelText)),
              Expanded(
                flex: 20,
                child: IconButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime(1999),
                      firstDate: DateTime(1990),
                      lastDate: DateTime.now(),
                    ).then((value) {
                      if (value != null) {
                        controller.text =
                            DateFormat("dd.MM.yyyy").format(value);
                      }
                    });
                  },
                  icon: const Icon(Icons.date_range),
                ),
              ),
            ],
          ),
        );
}

TextFormField buildDatePicker(
    BuildContext context, TextEditingController controller, String labelText) {
  return TextFormField(
    controller: controller,
    enabled: false,
    style: TextStyle(fontSize: context.width < 600 ? null : 22),
    strutStyle: StrutStyle(fontSize: context.width < 600 ? null : 30),
    decoration: InputDecoration(
      border: const OutlineInputBorder(gapPadding: 5),
      contentPadding: const EdgeInsets.all(10),
      labelText: labelText,
      labelStyle: TextStyle(fontSize: context.width < 600 ? null : 22),
    ),
  );
}
