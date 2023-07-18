import 'package:hive/hive.dart';
import 'package:library_book/constant/hive_constant.dart';

part 'detail_vo.g.dart';
@HiveType(typeId: kHiveTypeDetail)
class DetailVO{
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? bookImage;
  DetailVO({this.title,this.bookImage});
}