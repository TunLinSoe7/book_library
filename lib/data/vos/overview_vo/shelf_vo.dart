import 'package:hive/hive.dart';
import 'package:library_book/constant/hive_constant.dart';
import 'detail_vo.dart';
part 'shelf_vo.g.dart';

@HiveType(typeId: kHiveTypeShelf)
class ShelfVO{
  @HiveField(0)
  String? shelfName;
  @HiveField(1)
  List<DetailVO>? detailVO;
  ShelfVO({required this.shelfName,required this.detailVO});
}