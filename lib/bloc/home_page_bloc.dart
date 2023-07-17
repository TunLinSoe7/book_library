import 'package:flutter/material.dart';

import '../constant/api_constant.dart';
import '../data/model/library_model.dart';
import '../data/model/library_model_impl.dart';
import '../data/vos/overview_vo/result_vo.dart';

class HomePageBloc extends ChangeNotifier{
  int _selectedIndex = 0;
  ResultsVO? resultsVO;
  int get selectedIndex => _selectedIndex;

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
   final LibraryModel _libraryModel = LibraryModelImpl();
  HomePageBloc(){
    DateTime dateTime = DateTime.now();
    String monthFormat = (dateTime.month.toString().length) == 2
        ? dateTime.month.toString()
        : '0${dateTime.month.toString()}';
    String dayFormat = (dateTime.day.toString().length) == 2
        ? dateTime.day.toString()
        : '0${dateTime.day.toString()}';
    String publishDate = '${dateTime.year}-$monthFormat-$dayFormat';
      _libraryModel.getResultDataFromNetwork(publishDate);
      _libraryModel.getResultDataFromDatabase(publishDate).listen((value) {
        value?.lists?.forEach((element) {
          element.books?.forEach((element) {
            print("title==========>${element.title}");
          });
        });
        print("length=======>${value?.lists?.length}");
        if(value!=null){
          resultsVO = value;
        }
        notifyListeners();
      });
  }
}