import 'package:flutter/material.dart';
import 'package:library_book/data/vos/overview_vo/detail_vo.dart';
import '../data/model/library_model.dart';
import '../data/model/library_model_impl.dart';
import '../data/vos/overview_vo/shelf_vo.dart';

class ShelfPageBloc extends ChangeNotifier{
  TextEditingController _controller =TextEditingController();
  DetailVO? detailVO;
  List<DetailVO>? detail;
  List<ShelfVO>? shelfVO;
  ShelfVO? shelf;
  final LibraryModel _libraryModel = LibraryModelImpl();

  void saveShelf(ShelfVO shelfVO){
    _libraryModel.saveShelf(shelfVO);
  }
    get getController=>_controller;
  void getShelfVO(String title){
    ShelfVO? shelfVO = _libraryModel.getShelfBookByTitle(title);
      shelf = shelfVO;
      notifyListeners();
  }

  void saveShelfVoInShelfDatabaseDetailVO(String title,DetailVO? detailsVO){
    if(detailsVO!=null){
      ShelfVO? _shelveVO=_libraryModel.getShelfBookByTitle(title);
      List<DetailVO>? detail =_shelveVO?.detailVO;
      detail?.add(detailsVO);
      _shelveVO?.detailVO=detail;
      saveShelf(_shelveVO!);
    }
  }
  ShelfPageBloc(){
    _libraryModel.getShelfByStream().listen((event) {
      shelfVO = event;
      notifyListeners();
    });
  }
}