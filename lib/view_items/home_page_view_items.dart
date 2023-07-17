import 'package:flutter/material.dart';

import '../constant/strings.dart';
class ListTileSearchView extends StatelessWidget {
  const ListTileSearchView({super.key, required this.onTapFunction});
   final   GestureTapCallback onTapFunction;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: Colors.black38,
          ),
        ),
        child:  ListTile(
          onTap: onTapFunction,
          leading: const Icon(Icons.search),title: const Text(kSearchText,style: TextStyle(color: Colors.grey),),
          trailing: const Icon(Icons.person),),
      ),
    );
  }
}
