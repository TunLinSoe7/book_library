import 'package:library_book/data/vos/search_vo/item_vo.dart';

import '../../data/vos/overview_vo/result_vo.dart';

abstract class LibraryDataAgent{
  Future<ResultsVO?> getResultData(String publishDate);
  Future<List<ItemsVO>?> getSearchResult(String key);
}