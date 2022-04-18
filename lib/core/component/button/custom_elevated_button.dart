import 'package:books_i_read/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle? style;
  const CustomElevatedButton(
      {Key? key, required this.text, required this.onPressed, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(const Color(0xFF050532)),
        minimumSize: MaterialStateProperty.all(const Size.fromRadius(20.0)),
        fixedSize:
            MaterialStateProperty.all(Size.fromWidth(context.width * 0.95)),
      ),
      child: Padding(
        padding: context.paddingLow,
        child: Text(
          text,
          style: TextStyle(fontSize: context.shortestSide < 600 ? null : 22),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
