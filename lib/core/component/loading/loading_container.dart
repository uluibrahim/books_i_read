import 'package:books_i_read/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class LoadingContainerIndicator extends Opacity {
  final BuildContext context;
  final String titleText;

  LoadingContainerIndicator(
      {Key? key, required this.context, required this.titleText})
      : super(
          key: key,
          opacity: 0.8,
          child: Container(
            color: Colors.white,
            height: context.height,
            child: AlertDialog(
              title: Text(titleText),
              content: const LinearProgressIndicator(),
            ),
          ),
        );
}
