import 'package:library_book/data/vos/search_vo/item_vo.dart';
import '../vos/overview_vo/detail_vo.dart';
import '../vos/overview_vo/result_vo.dart';

abstract class LibraryModel{
  Future<ResultsVO?> getResultDataFromNetwork(String publishDate);
  Stream<ResultsVO?> getResultDataFromDatabase(String publishDate);
  Future<List<ItemsVO>?> getSearchResult(String key);
  ///Details
  Stream<List<DetailVO>?> getBookByStream();
  void save(DetailVO detailVO);
}