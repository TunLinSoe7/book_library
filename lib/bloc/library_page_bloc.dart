import 'package:flutter/material.dart';

import '../data/model/library_model.dart';
import '../data/model/library_model_impl.dart';
import '../data/vos/overview_vo/detail_vo.dart';

class LibraryPageBloc extends ChangeNotifier{
  List<DetailVO>? _detailVO;
  /// Getter
  get getDetailData=>_detailVO;

  final LibraryModel _libraryModel = LibraryModelImpl();
  LibraryPageBloc(){
    _libraryModel.getBookByStream().listen((event) {
      if(event!=null){
        _detailVO = event;
      }
      notifyListeners();
    });
  }
}