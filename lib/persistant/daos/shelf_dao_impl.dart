import 'package:library_book/constant/hive_constant.dart';
import 'package:library_book/data/vos/overview_vo/shelf_hive_vo.dart';
import 'package:library_book/data/vos/overview_vo/shelf_vo.dart';
import 'package:library_book/persistant/daos/shelf_dao.dart';
import 'package:hive_flutter/hive_flutter.dart';
class ShelfDAOImpl extends ShelfDAO{
  ShelfDAOImpl._();
  static final ShelfDAOImpl _singleton = ShelfDAOImpl._();
  factory ShelfDAOImpl()=>_singleton;

  @override
  Stream<ShelfHiveVO?> getShelfByStream(String title) =>Stream.value(getShelfListByTitle(title));


  @override
  void save(ShelfHiveVO shelfHiveVO) =>_shelfBox().put(shelfHiveVO.shelfName, shelfHiveVO);

  @override
  Stream watch() =>_shelfBox().watch();
  Box<ShelfHiveVO> _shelfBox()=>Hive.box<ShelfHiveVO>(kBoxNameForShelfHiveVO);

  @override
  ShelfHiveVO? getShelfListByTitle(String title) =>_shelfBox().get(title);
}