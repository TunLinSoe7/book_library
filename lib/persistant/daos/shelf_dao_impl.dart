import 'package:library_book/constant/hive_constant.dart';
import 'package:library_book/data/vos/overview_vo/shelf_vo.dart';
import 'package:library_book/persistant/daos/shelf_dao.dart';
import 'package:hive_flutter/hive_flutter.dart';
class ShelfDAOImpl extends ShelfDAO{
  ShelfDAOImpl._();
  static final ShelfDAOImpl _singleton = ShelfDAOImpl._();
  factory ShelfDAOImpl()=>_singleton;

  @override
  Stream<List<ShelfVO>?> getShelfByStream() =>Stream.value(getShelfList());

  @override
  ShelfVO? getShelfByTitle(String title)=>_shelfBox().get(title);

  @override
  List<ShelfVO>? getShelfList() =>_shelfBox().values.toList();

  @override
  void save(ShelfVO shelfVO) =>_shelfBox().put(shelfVO.shelfName, shelfVO);

  @override
  Stream watch() =>_shelfBox().watch();
  Box<ShelfVO> _shelfBox()=>Hive.box<ShelfVO>(kBoxNameForShelf);
}