import 'package:library_book/data/vos/overview_vo/detail_vo.dart';

abstract class BookDetailDAO{
  ///Detail
  void save(DetailVO detailVO);
  List<DetailVO>? getBookList();
  Stream watch();
  Stream<List<DetailVO>?> geBookListByStream();
  DetailVO? getBookByTitle(String title);
  void deleteYourBooksByTitle(String title);

}