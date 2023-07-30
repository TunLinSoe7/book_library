import 'package:library_book/data/vos/overview_vo/shelf_hive_vo.dart';

abstract class ShelfDAO{
  void save(ShelfHiveVO shelfHiveVO);
  List<ShelfHiveVO> getShelfList();
  Stream watch();
  Stream<List<ShelfHiveVO>?> getShelfByStream();
  ShelfHiveVO ? getShelfVOByTitle(String title);
}