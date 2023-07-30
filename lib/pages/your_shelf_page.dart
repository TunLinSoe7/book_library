import 'package:flutter/material.dart';
import 'package:library_book/bloc/shelf_page_bloc.dart';
import 'package:library_book/data/vos/overview_vo/shelf_vo.dart';
import 'package:library_book/pages/see_all_page.dart';
import 'package:provider/provider.dart';
import '../data/vos/overview_vo/shelf_hive_vo.dart';
import '../widgets/shelf_list_tilewidget.dart';
class YourShelfPage extends StatelessWidget {
  const YourShelfPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        context.read<ShelfPageBloc>().showDialogBox(context);
      }, label:const Icon(Icons.edit)),
      body:Selector<ShelfPageBloc,List<ShelfHiveVO>?>(
        selector: (_,bloc)=>bloc.shelfHiveVO,
        builder: (_,shelfHiveVO,__){
          return Selector<ShelfPageBloc,ShelfVO?>(builder: (_,shelf,__){
            return ShelveListWidget(onTap: (shelfHiveVO ) {
              ShelfPageBloc shelfPageBloc = context.read<ShelfPageBloc>();
                   shelfPageBloc.saveShelfVoInShelfDatabase(shelfHiveVO.shelfName.toString(), shelf);
                   Navigator.of(context).pop();
            }, shelves: shelfHiveVO,
            );
          }, selector: (_,bloc)=>bloc.shelfVO);
        },
      )
    );
  }
}
