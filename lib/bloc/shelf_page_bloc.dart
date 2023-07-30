import 'package:flutter/material.dart';
import '../data/model/library_model.dart';
import '../data/model/library_model_impl.dart';
import '../data/vos/overview_vo/shelf_hive_vo.dart';
import '../data/vos/overview_vo/shelf_vo.dart';

class ShelfPageBloc extends ChangeNotifier{
  final TextEditingController _controller =TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  ShelfVO? shelfVO;
  List<ShelfHiveVO>? shelfHiveVO;
  get getController=>_controller;
  final LibraryModel _libraryModel = LibraryModelImpl();
  void saveShelf(ShelfHiveVO shelfHiveVO){
    _libraryModel.saveShelf(shelfHiveVO);
  }
  void saveShelfVoInShelfDatabase(String title,ShelfVO? shelfVO){
    if(shelfVO!=null){
      ShelfHiveVO ? shelveVO=_libraryModel.getShelfVO(title);
      List<ShelfVO>? shelf =shelveVO?.shelfVO;
      shelf?.add(shelfVO);
      shelveVO?.shelfVO=shelf;
      saveShelf(shelveVO!);
    }
  }
  ShelfPageBloc(){
    _libraryModel.getShelfByStream().listen((event) {
      shelfHiveVO = event;
      notifyListeners();
    });
  }
  Future showDialogBox(BuildContext context){
    return showDialog(context: context, builder: (context){
      return  Form(
        key: _globalKey,
        child: AlertDialog(
          title: const Text("Add Shelf Name"),
          content: TextFormField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: "Shelf Name",
            ),
          ),
          actions: [
            ElevatedButton(onPressed: (){
              ShelfHiveVO shelf = ShelfHiveVO(shelfName:_controller.text, shelfVO:[] );
              if(_globalKey.currentState!.validate()){
                _libraryModel.saveShelf(shelf);
              }
            }, child: const Icon(Icons.add)),
          ],
        ),
      );
    });
  }
@override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}