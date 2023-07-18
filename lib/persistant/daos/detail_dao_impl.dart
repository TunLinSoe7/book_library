import 'package:hive_flutter/hive_flutter.dart';
import 'package:library_book/constant/hive_constant.dart';
import 'package:library_book/data/vos/overview_vo/detail_vo.dart';
import 'package:library_book/persistant/daos/detail_dao.dart';

class BookDetailDAOImpl extends BookDetailDAO{
  BookDetailDAOImpl._();
  static final BookDetailDAOImpl _singleton = BookDetailDAOImpl._();
  factory BookDetailDAOImpl()=>_singleton;

  @override
  Stream<List<DetailVO>?> geBookListByStream() =>Stream.value(getBookList());

  @override
  void save(DetailVO detailVO) {
   _bookDAO().put(detailVO.title, detailVO);
  }
  @override
  Stream watch() =>_bookDAO().watch();

  @override
  List<DetailVO>? getBookList()=>_bookDAO().values.toList();
  Box<DetailVO> _bookDAO()=>Hive.box<DetailVO>(kBoxNameForDetail);

}