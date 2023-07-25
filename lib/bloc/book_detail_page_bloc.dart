import 'package:flutter/material.dart';
import 'package:library_book/data/vos/overview_vo/detail_vo.dart';

import '../data/model/library_model.dart';
import '../data/model/library_model_impl.dart';

class BookDetailPageBloc extends ChangeNotifier{
  DetailVO? detailVO;
  final LibraryModel _libraryModel = LibraryModelImpl();
  BookDetailPageBloc(String title){
         _libraryModel.getBookByTitle(title)?.then((value) {
           detailVO = value;
           notifyListeners();
         });
  }
}