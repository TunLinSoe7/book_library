import 'package:flutter/material.dart';
import 'package:library_book/constant/dimens.dart';
import 'package:library_book/data/vos/overview_vo/shelf_vo.dart';
import 'package:library_book/extensions/extension.dart';
import 'package:library_book/pages/your_books_page.dart';
import 'package:library_book/pages/add_to_shelf_page.dart';
import 'package:library_book/pages/your_shelf_page.dart';
class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(length: LibraryTab.values.length, child: Column(children: [
      Padding(
        padding: const EdgeInsets.all(kSP8X),
        child: TabBar(
          dividerColor: Colors.transparent,
            tabs: LibraryTab.values.map((e) => e.tabTitle).toList()),
      ),
      const Expanded(
        child: SizedBox(
          child: TabBarView(children: [
            YourBookPage(),
            //AddToShelfPage(),
          ],),
        ),
      ),
    ],),);
  }
}
