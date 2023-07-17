import 'package:flutter/material.dart';
import 'package:library_book/pages/your_books_page.dart';
class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Tab> libraryTags = [
      const Tab(text: 'Your Books',),
      const Tab(text: 'Your Shelf',)
    ];
    return  DefaultTabController(length: libraryTags.length, child: Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TabBar(
          dividerColor: Colors.transparent,
            tabs: libraryTags),
      ),
      Expanded(
        child: SizedBox(
          child: TabBarView(children: [
            const YourBookPage(),
            Container(),
          ],),
        ),
      ),
    ],),);
  }
}
