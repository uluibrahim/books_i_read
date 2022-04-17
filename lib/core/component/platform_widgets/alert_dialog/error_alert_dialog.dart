import 'dart:io';

import 'package:books_i_read/core/extension/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../platform_widgets.dart';

class PlatformErrorAlertDialog extends PlatformWidget {
  final String errorMessage;
  const PlatformErrorAlertDialog({Key? key, required this.errorMessage})
      : super(key: key);

  Future<bool?> showDialogPlatform(BuildContext context) async {
    bool? result = Platform.isIOS
        ? await showCupertinoDialog(
            context: (context),
            builder: (context) => this,
          )
        : await showDialog(
            context: (context),
            builder: (context) => this,
          );
    return result;
  }

  @override
  Widget buildAndroidWidget(BuildContext context) {
    return AlertDialog(
      title: const CircleAvatar(
        backgroundColor: Colors.red,
        child: Icon(Icons.close, color: Colors.white),
      ),
      content: _contentWidget(errorMessage, context),
    );
  }

  @override
  Widget buildIOSWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: const CircleAvatar(
        backgroundColor: Colors.red,
        child: Icon(Icons.close, color: Colors.white),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Vazgeç"))
      ],
      content: _contentWidget(errorMessage, context),
    );
  }

  Widget _contentWidget(String content, BuildContext context) {
    return Text(
      content,
      style: context.width < 600 ? null : context.textTheme.headline5,
    );
  }
}
