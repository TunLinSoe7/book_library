import 'package:flutter/material.dart';
import 'package:library_book/bloc/shelf_page_bloc.dart';
import 'package:library_book/data/vos/overview_vo/shelf_vo.dart';
import 'package:provider/provider.dart';
class YourShelfPage extends StatelessWidget {
  const YourShelfPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:Column(
          children: [
            Expanded(child: Selector<ShelfPageBloc,List<ShelfVO>?>(
            selector: (_,bloc)=>bloc.shelfVO,
            builder: (_,shelfData,__){
              return  ListView.builder(itemCount: shelfData?.length,itemBuilder:(_,index){
                return ListTile(
                  leading: Image.network("${shelfData?[index].detailVO?.first.bookImage}"),
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
