import 'package:hive/hive.dart';
import 'package:library_book/constant/hive_constant.dart';
import 'package:library_book/data/vos/overview_vo/shelf_vo.dart';
part 'shelf_hive_vo.g.dart';
@HiveType(typeId: kHiveTypeShelfHiveVO)
class ShelfHiveVO{
  @HiveField(0)
  String? shelfName;
  @HiveField(1)
  List<ShelfVO>? shelfVO;
  ShelfHiveVO({ required this.shelfName,required this.shelfVO});
}