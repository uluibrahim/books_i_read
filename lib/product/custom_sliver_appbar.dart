import 'package:books_i_read/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class CustomSliverAppbar extends SliverAppBar {
  final BuildContext context;
  final Color color;
  final String imagePath;
  final String titleText;
  CustomSliverAppbar({
    Key? key,
    required this.context,
    required this.color,
    required this.imagePath,
    required this.titleText,
  }) : super(
          key: key,
          backgroundColor: color,
          expandedHeight: context.height * 0.2,
          centerTitle: true,
          floating: true,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              imagePath,
              fit: BoxFit.fill,
            ),
          ),
          title: Padding(
            padding: context.paddingNormal,
            child: Text(
              titleText,
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: Colors.white),
            ),
          ),
          iconTheme: context.theme.iconTheme.copyWith(color: Colors.white),
        );
}
