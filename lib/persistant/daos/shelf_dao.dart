import '../../data/vos/overview_vo/shelf_vo.dart';

abstract class ShelfDAO{
  void save(ShelfVO shelfVO);
  List<ShelfVO>? getShelfList();
  Stream watch();
  Stream<List<ShelfVO>?> getShelfByStream();
  ShelfVO? getShelfByTitle(String title);
}