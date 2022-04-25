import 'package:flutter/material.dart';

class CustomAppbar extends AppBar {
  final bool isHaveLeading;
  final String titletext;
  final BuildContext context;
  final List<Widget>? actionsWidgets;
  CustomAppbar({
    Key? key,
    required this.titletext,
    required this.isHaveLeading,
    required this.context,
    this.actionsWidgets,
  }) : super(
          key: key,
          actions: actionsWidgets,
          title: Text(titletext),
          leading: isHaveLeading
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back))
              : null,
        );
}
