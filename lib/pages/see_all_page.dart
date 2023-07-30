import 'package:flutter/material.dart';
import '../data/vos/overview_vo/shelf_hive_vo.dart';
class SeeAllPage extends StatelessWidget {
  const SeeAllPage({super.key, required this.shelf});
  final ShelfHiveVO shelf;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(Icons.search),
          Icon(Icons.more_vert_outlined),
        ],
      ),
      body:Column(
        children: [
          Column(
            children: shelf.shelfVO?.map((e){
              String bookCount = "Empty";
               int bookLength = shelf.shelfVO?.length ?? 0;
               if(bookLength>1){
                 bookCount = "$bookLength books";
               }else{
                 bookCount = "$bookLength book";
               }
              return Column(
                children: [
                  Text("${shelf.shelfName}"),
                  Text(bookCount),
                  SizedBox(
                    height:300,
                      child: ListView.builder(itemCount:shelf.shelfVO?.length ,itemBuilder: (context,index){
                          return ListTile(
                            leading: Image.network("${shelf.shelfVO?[index].image}"),
                            title: Text("${shelf.shelfVO?[index].title}"),
                          );
                      } )),
                ],
              );
            }).toList() ?? []
          ),
        ],
      )
    );
  }
}
