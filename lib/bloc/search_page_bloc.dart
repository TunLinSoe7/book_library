import 'package:flutter/material.dart';
import 'package:library_book/data/model/library_model_impl.dart';

import '../data/model/library_model.dart';
import '../data/vos/search_vo/item_vo.dart';

class SearchPageBloc extends ChangeNotifier{
  final TextEditingController _controller =TextEditingController();
  LibraryModel libraryModel = LibraryModelImpl();
  final bool _visible = false;
  final bool _recent = true;
  bool isLoading = false;
  get getVisible => _visible;
  get getRecentVisible => _recent;
  get getController=>_controller;
  List<ItemsVO>? itemSearch;
   void searchResult(String key){
     libraryModel.getSearchResult(key).then((value) {
       var temp = value;
       temp?.map((e) => e.saleInfo?.isEbook??false?"E Book":"Audio Book");
         itemSearch = temp;
       notifyListeners();
       return temp;
     });
}
@override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}