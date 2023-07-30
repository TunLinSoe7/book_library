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
  Stream<List<ShelfHiveVO>?> getShelfByStream() =>Stream.value(getShelfList());

  @override
  List<ShelfHiveVO> getShelfList() =>_box().values.toList();

  @override
  void save(ShelfHiveVO shelfHiveVO) =>_box().put(shelfHiveVO.shelfName,shelfHiveVO);

  @override
  Stream watch() =>_box().watch();
  Box<ShelfHiveVO> _box()=>Hive.box<ShelfHiveVO>(kBoxNameForShelfHiveVO);

  @override
  ShelfHiveVO? getShelfVOByTitle(String title) =>_box().get(title);
}