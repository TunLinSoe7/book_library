import 'package:library_book/data/vos/overview_vo/shelf_hive_vo.dart';

abstract class ShelfDAO{
  void save(ShelfHiveVO shelfHiveVO);
  ShelfHiveVO? getShelfListByTitle(String title);
  Stream watch();
  Stream<ShelfHiveVO?> getShelfByStream(String title);
}