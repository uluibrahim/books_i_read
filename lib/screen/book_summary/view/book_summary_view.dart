import 'package:books_i_read/core/extension/context_extension.dart';
import 'package:books_i_read/screen/book_summary/viewmodel/book_summary_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../product/custom_sliver_appbar.dart';

class BookSummaryView extends StatelessWidget {
  final String title;
  const BookSummaryView({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(context),
          buildSliverToBoxAdapter(context),
        ],
      ),
    );
  }

  SliverAppBar buildSliverAppBar(BuildContext context) {
    return CustomSliverAppbar(
      color: context.watch<BookSummaryViewmodel>().dominantColor!,
      imagePath: "https://picsum.photos/200/300",
      titleText: title,
      context: context,
    );
  }

  SliverToBoxAdapter buildSliverToBoxAdapter(BuildContext context) {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        child: Padding(
          padding: context.paddingNormal,
          child: Text(
            context.watch<BookSummaryViewmodel>().bookSummaryText,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ),
    );
  }
}
