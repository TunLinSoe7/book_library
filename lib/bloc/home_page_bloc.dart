import 'package:flutter/material.dart';
import 'package:library_book/data/vos/overview_vo/book_vo.dart';
import 'package:library_book/data/vos/overview_vo/detail_vo.dart';
import 'package:library_book/data/vos/overview_vo/shelf_vo.dart';
import '../data/model/library_model.dart';
import '../data/model/library_model_impl.dart';
import '../data/vos/overview_vo/result_vo.dart';

class HomePageBloc extends ChangeNotifier{
  bool isVisible = false;
  String imageBaseUrl = "https://storage.googleapis.com/du-prd/books/images/";
  int _selectedIndex = 0;
  ResultsVO? resultsVO;
  List<DetailVO>? detailVO;
  int get selectedIndex => _selectedIndex;
  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
   final LibraryModel _libraryModel = LibraryModelImpl();
  /// Save Book detail data to detail
  saveBookDataInDetail(BooksVO? booksVO){
    DateTime dateTime = DateTime.now();
    String month = (dateTime.month.toString().length)==2? dateTime.month.toString():"0${dateTime.month}";
    String day = (dateTime.day.toString().length)==2? dateTime.day.toString():"0${dateTime.day}";
    String publishDate = "${dateTime.year}-$month-$day";
    final books = DetailVO(
      title: booksVO?.title,
      bookImage: booksVO?.bookImage,
      dateTime: publishDate
    );
    _libraryModel.save(books);
    print("date==========>${books.dateTime}");
  }
  saveBookDataInDetailVOByDetail(BooksVO booksVO){
    DateTime dateTime = DateTime.now();
    String month = (dateTime.month.toString().length)==2? dateTime.month.toString():"0${dateTime.month}";
    String day = (dateTime.day.toString().length)==2? dateTime.day.toString():"0${dateTime.day}";
    String publishDate = "${dateTime.year}-$month-$day";
   final detailVO = DetailVO(dateTime: publishDate,
     bookImage: booksVO.bookImage,
     title: booksVO.title,
   );
   return detailVO;
  }




  HomePageBloc(){
    DateTime dateTime = DateTime.now();
    String month = (dateTime.month.toString().length)==2? dateTime.month.toString():"0${dateTime.month}";
    String day = (dateTime.day.toString().length)==2? dateTime.day.toString():"0${dateTime.day}";

    String publishDate = "${dateTime.year}-$month-$day";
      _libraryModel.getResultDataFromNetwork(publishDate);
      _libraryModel.getResultDataFromDatabase(publishDate).listen((value) {
        resultsVO =value;
        notifyListeners();
      });
      ///For CarouselSlider
      _libraryModel.getBookByStream().listen((event) {
        if(event!=null){
          detailVO = event;
          notifyListeners();
        }
      });
  }
  void deleteYourBook(String title){
    _libraryModel.deleteYourBooksByTitle(title);
    notifyListeners();
  }
}