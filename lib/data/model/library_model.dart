import 'package:library_book/data/vos/overview_vo/shelf_vo.dart';
import 'package:library_book/data/vos/search_vo/item_vo.dart';
import '../vos/overview_vo/detail_vo.dart';
import '../vos/overview_vo/result_vo.dart';
import '../vos/overview_vo/shelf_hive_vo.dart';

abstract class LibraryModel{
  Future<ResultsVO?> getResultDataFromNetwork(String publishDate);
  Stream<ResultsVO?> getResultDataFromDatabase(String publishDate);
  Future<List<ItemsVO>?> getSearchResult(String key);

  ///Details

  Stream<List<DetailVO>?> getBookByStream();
  void save(DetailVO detailVO);
  Future<DetailVO>? getBookByTitle(String title);
  void deleteYourBooksByTitle(String title);

 ///For Shelf
 void saveShelf(ShelfHiveVO shelfHiveVO);
 List<ShelfHiveVO>? getShelfList();
 Stream<List<ShelfHiveVO>?> getShelfByStream();
 ShelfHiveVO? getShelfVO(String title);
}