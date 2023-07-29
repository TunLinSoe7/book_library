import 'package:flutter/material.dart';
import 'package:library_book/data/vos/overview_vo/book_vo.dart';
import 'package:library_book/data/vos/overview_vo/detail_vo.dart';
import '../data/model/library_model.dart';
import '../data/model/library_model_impl.dart';
import '../data/vos/overview_vo/shelf_hive_vo.dart';
import '../data/vos/overview_vo/shelf_vo.dart';

class ShelfPageBloc extends ChangeNotifier{
  final TextEditingController _controller =TextEditingController();
  List<DetailVO>? detail;
  ShelfVO? shelfVO;
  ShelfHiveVO? shelfHiveVO;
  final LibraryModel _libraryModel = LibraryModelImpl();
  void save(List<ShelfVO> shelfVO){
    ShelfHiveVO shelfHiveVO = ShelfHiveVO(
      shelfName: "Mag",
      shelfVO: shelfVO,
    );
    saveShelf(shelfHiveVO);
    notifyListeners();
  }
  void saveShelf(ShelfHiveVO shelfHiveVO){
    _libraryModel.saveShelf(shelfHiveVO);
  }
  ShelfPageBloc(){
    _libraryModel.getShelfByStream(shelfVO?.title ?? '').listen((event) {
      print("answer===========>${event?.shelfVO?.length}");
      shelfHiveVO = event;
      notifyListeners();
    });
  }
}