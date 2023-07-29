import 'package:hive/hive.dart';
import 'package:library_book/constant/hive_constant.dart';
part 'shelf_vo.g.dart';

@HiveType(typeId: kHiveTypeShelf)
class ShelfVO{
  @HiveField(0)
  String? image;
  @HiveField(1)
  String? title;
  ShelfVO({required this.image,required this.title});
}