import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomActionPane extends ActionPane {
  final List<Widget> widgets;

  const CustomActionPane({Key? key, required this.widgets})
      : super(
          key: key,
          motion: const StretchMotion(),
          children: widgets,
        );
}
