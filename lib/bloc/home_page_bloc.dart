import 'package:flutter/material.dart';
import 'package:library_book/data/vos/overview_vo/book_vo.dart';
import 'package:library_book/data/vos/overview_vo/detail_vo.dart';
import 'package:library_book/data/vos/overview_vo/list_vo.dart';
import '../data/model/library_model.dart';
import '../data/model/library_model_impl.dart';
import '../data/vos/overview_vo/result_vo.dart';

class HomePageBloc extends ChangeNotifier{
  String imageBaseUrl = "https://storage.googleapis.com/du-prd/books/images/";
  int _selectedIndex = 0;
  ResultsVO? resultsVO;
  int get selectedIndex => _selectedIndex;

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
   final LibraryModel _libraryModel = LibraryModelImpl();
  /// Save Book detail data to detail
  saveBookDataInDetail(BooksVO? booksVO){
    final books = DetailVO(
      title: booksVO?.title,
      bookImage: booksVO?.bookImage,
    );
    _libraryModel.save(books);
    print("title============>${books.title}");
  }
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
        resultsVO =value;
        notifyListeners();
      });
  }
}