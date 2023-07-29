import 'package:flutter/material.dart';
import 'package:library_book/bloc/shelf_page_bloc.dart';
import 'package:provider/provider.dart';

import '../data/vos/overview_vo/shelf_hive_vo.dart';
class YourShelfPage extends StatelessWidget {
  const YourShelfPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:Column(
          children: [
            Expanded(child: Selector<ShelfPageBloc,ShelfHiveVO?>(
            selector: (_,bloc)=>bloc.shelfHiveVO,
            builder: (_,shelfData,__){
              return  ListView.builder(itemCount: shelfData?.shelfVO?.length,itemBuilder:(_,index){
                return ListTile(
                  leading: Image.network("${shelfData?.shelfVO?[index].image}"),
                );
              } );
            },
            ))
          ],
        ),
      ),
    );
  }
}
