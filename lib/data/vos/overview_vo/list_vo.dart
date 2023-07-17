import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:library_book/constant/hive_constant.dart';

import 'book_vo.dart';
part 'list_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: kHiveTypeList)
class ListsVO {
  @JsonKey(name: 'list_id')
  @HiveField(0)
  int? listId;
  @JsonKey(name: 'list_name')
  @HiveField(1)
  String? listName;
  @JsonKey(name: 'list_name_encoded')
  @HiveField(2)
  String? listNameEncoded;
  @JsonKey(name: 'display_name')
  @HiveField(3)
  String? displayName;
  @JsonKey(name: 'updated')
  @HiveField(4)
  String? updated;
  @JsonKey(name: 'list_image')
  @HiveField(5)
  String? listImage;
  @JsonKey(name: 'list_image_width')
  @HiveField(6)
  String? listImageWidth;
  @JsonKey(name: 'list_image_height')
  @HiveField(7)
  String? listImageHeight;
  @JsonKey(name: 'books')
  @HiveField(8)
  List<BooksVO>? books;

  ListsVO(
      {this.listId,
        this.listName,
        this.listNameEncoded,
        this.displayName,
        this.updated,
        this.listImage,
        this.listImageWidth,
        this.listImageHeight,
        this.books});

  factory ListsVO.fromJson(Map<String, dynamic> json) =>_$ListsVOFromJson(json);
  }
