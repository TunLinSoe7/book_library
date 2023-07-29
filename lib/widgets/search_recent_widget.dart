import 'package:flutter/material.dart';
class SearchRecentWidget extends StatelessWidget {
  const SearchRecentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ListTile(leading: Icon(Icons.trending_up,),title: Text("Top Selling"),),
        ListTile(leading: Icon(Icons.new_releases),title: Text("New Release"),),
        ListTile(leading: Icon(Icons.store),title: Text("Store"),),
      ],
    );
  }
}
