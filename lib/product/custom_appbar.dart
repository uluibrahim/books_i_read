import 'package:flutter/material.dart';

class CustomAppbar extends AppBar {
  final bool isHaveLeading;
  final String titletext;
  final BuildContext context;
  final Color color;
  final Color iconColor;
  CustomAppbar({
    Key? key,
    required this.titletext,
    required this.isHaveLeading,
    required this.context,
    this.color = Colors.transparent,
    this.iconColor = Colors.black54,
  }) : super(
          key: key,
          title: Text(
            titletext,
            style: TextStyle(color: iconColor),
          ),
          elevation: 0,
          backgroundColor: color,
          leading: isHaveLeading
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, color: iconColor))
              : null,
        );
}
