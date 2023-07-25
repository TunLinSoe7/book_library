import 'package:flutter/material.dart';
import 'package:library_book/data/vos/overview_vo/detail_vo.dart';
import 'package:library_book/data/vos/overview_vo/shelf_vo.dart';
import 'package:library_book/widgets/shelf_list_tilewidget.dart';
import 'package:provider/provider.dart';
import '../bloc/shelf_page_bloc.dart';

class AddToShelfPage extends StatefulWidget {
  const AddToShelfPage({super.key});

  @override
  State<AddToShelfPage> createState() => _AddToShelfPageState();
}

class _AddToShelfPageState extends State<AddToShelfPage> {
   TextEditingController _controller =TextEditingController();
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  void dispose() {
   _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Selector<ShelfPageBloc,List<ShelfVO>?>(
      selector: (_,bloc)=>bloc.shelfVO,
      builder: (_,shelfVO,__){
        return Selector<ShelfPageBloc,DetailVO?>(
          selector: (_,bloc){
            return bloc.detailVO;
          },
          builder: (_,detail,__){
            return Scaffold(
              floatingActionButton: FloatingActionButton.extended(onPressed: (){
                   _showDialog(context, _controller);
              }, label: const Icon(Icons.edit)),
              body: SizedBox(
                child: ShelfListTileWidget(shelfVO: shelfVO ?? [], onTap: (shelfVO){
                  ShelfPageBloc bloc = context.read<ShelfPageBloc>();
                  bloc.saveShelfVoInShelfDatabaseDetailVO(shelfVO.shelfName.toString(), detail);
                }),
              ),
            );
          },
        );
      },
    );
  }

  void _showDialog(BuildContext context,TextEditingController controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Selector<ShelfPageBloc,ShelfVO?>(
          selector: (_,bloc)=>bloc.shelf,
          builder: (_,shelf,__){
            return
              Form(
                key: _globalKey,
                child: AlertDialog(
                title: const Text("Dialog Title"),
                content: TextFormField(
                  validator: (value){
                    if(value==null || value==""){
                        return "Write Your Shelf Name";
                    }
                  },
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: "shelf Name",
                  ),

                ),
                actions: <Widget>[
                  OutlinedButton(
                    child: const Text("Summit"),
                    onPressed: () {
                     ShelfVO shelfVO = ShelfVO(shelfName:controller.text ,detailVO: []);
                       saveShelfVO(_globalKey, shelfVO);
                    },
                  ),
                ],
            ),
              );
          },
        );
      },
    );
  }
  void saveShelfVO(GlobalKey<FormState> formKey,ShelfVO shelfVO){
    if(formKey.currentState!.validate()){
      context.read<ShelfPageBloc>().saveShelf(shelfVO);
      Navigator.of(context).pop();
    }
  }
}
