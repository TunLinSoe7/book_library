import 'package:hive/hive.dart';
import 'package:library_book/constant/hive_constant.dart';
part 'detail_vo.g.dart';

@HiveType(typeId: kHiveTypeDetail)
class DetailVO{
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? bookImage;
  @HiveField(2)
  String? dateTime;
  DetailVO({this.title,this.bookImage,required this.dateTime});
}