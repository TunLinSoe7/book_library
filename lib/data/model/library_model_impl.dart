import 'package:library_book/data/model/library_model.dart';
import 'package:library_book/data/vos/overview_vo/detail_vo.dart';
import 'package:library_book/data/vos/overview_vo/shelf_vo.dart';
import 'package:library_book/data/vos/search_vo/item_vo.dart';
import 'package:library_book/persistant/daos/detail_dao.dart';
import 'package:library_book/persistant/daos/detail_dao_impl.dart';
import 'package:library_book/persistant/daos/result_dao.dart';
import 'package:library_book/persistant/daos/result_dao_impl.dart';
import 'package:library_book/persistant/daos/shelf_dao.dart';
import 'package:library_book/persistant/daos/shelf_dao_impl.dart';

import 'package:stream_transform/stream_transform.dart';

import '../../network/data_agent/data_agent.dart';
import '../../network/data_agent/data_agent_impl.dart';
import '../vos/overview_vo/result_vo.dart';

class LibraryModelImpl extends LibraryModel{
   String? baseUrl = "https://storage.googleapis.com/du-prd/books/images/";
  LibraryModelImpl._();
  static final LibraryModelImpl _singleton = LibraryModelImpl._();
  factory LibraryModelImpl()=>_singleton;
  final LibraryDataAgent _libraryDataAgent = LibraryDataAgentImpl();
  final  ResultDAO _resultDAO = ResultDAOImpl();
  final BookDetailDAO _bookDetailDAO = BookDetailDAOImpl();
  final ShelfDAO _shelfDAO = ShelfDAOImpl();
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
  ///Detail
  @override
  Stream<List<DetailVO>?> getBookByStream()=>_bookDetailDAO.watch().startWith(_bookDetailDAO.geBookListByStream()).map((event) => _bookDetailDAO.getBookList());


  @override
  void save(DetailVO detailVO) =>_bookDetailDAO.save(detailVO);

  @override
  Future<DetailVO>? getBookByTitle(String title) =>Future.value(_bookDetailDAO.getBookByTitle(title));

  @override
  void deleteYourBooksByTitle(String title) =>_bookDetailDAO.deleteYourBooksByTitle(title);
  ///For shelf
  @override
  ShelfVO? getShelfBookByTitle(String title) =>_shelfDAO.getShelfByTitle(title);

  @override
  List<ShelfVO>? getShelfBookList()=>_shelfDAO.getShelfList();

  @override
  Stream<List<ShelfVO>?> getShelfByStream() =>_shelfDAO.watch().startWith(_shelfDAO.getShelfByStream()).map((event) => _shelfDAO.getShelfList());
  @override
  void saveShelf(ShelfVO shelfVO) =>_shelfDAO.save(shelfVO);
}