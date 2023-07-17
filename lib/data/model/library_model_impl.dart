import 'package:library_book/data/model/library_model.dart';
import 'package:library_book/data/vos/search_vo/item_vo.dart';
import 'package:library_book/persistant/daos/result_dao.dart';
import 'package:library_book/persistant/daos/result_dao_impl.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../network/data_agent/data_agent.dart';
import '../../network/data_agent/data_agent_impl.dart';
import '../vos/overview_vo/result_vo.dart';

class LibraryModelImpl extends LibraryModel{
  LibraryModelImpl._();
  static final LibraryModelImpl _singleton = LibraryModelImpl._();
  factory LibraryModelImpl()=>_singleton;
 final LibraryDataAgent _libraryDataAgent = LibraryDataAgentImpl();
final  ResultDAO _resultDAO = ResultDAOImpl();
  @override
  Future<List<ItemsVO>?> getSearchResult(String key) =>_libraryDataAgent.getSearchResult(key);
///Fetch OverView data from network
  @override
  Future<ResultsVO?> getResultDataFromNetwork(String publishDate) =>_libraryDataAgent.getResultData(publishDate).then((value) {

      _resultDAO.save(publishDate, value ?? ResultsVO());
    return value;
  });
///Fetch OverView data from database
  @override
  Stream<ResultsVO?> getResultDataFromDatabase(String publishDate) {
    getResultDataFromNetwork(publishDate);
   return _resultDAO
        .watch()
        .startWith(_resultDAO.getResultDataFromStream(publishDate))
        .map((event) => _resultDAO.getResultDataFromDatabase(publishDate));
  }
}