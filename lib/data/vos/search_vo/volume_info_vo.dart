import 'package:json_annotation/json_annotation.dart';
import 'image_link_vo.dart';
part 'volume_info_vo.g.dart';
@JsonSerializable()
class VolumeInfoVO {
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'authors')
  List<String>? authors;
  @JsonKey(name: 'publishedDate')
  String? publishedDate;
  @JsonKey(name: 'printType')
  String? printType;
  @JsonKey(name: 'maturityRating')
  String? maturityRating;
  @JsonKey(name:'allowAnonLogging')
  bool? allowAnonLogging;
  @JsonKey(name: 'contentVersion')
  String? contentVersion;
  @JsonKey(name: 'language')
  String? language;
  @JsonKey(name: 'subtitle')
  String? subtitle;
  @JsonKey(name:'description')
  String? description;
  @JsonKey(name: 'imageLinks')
  ImageLinksVO? imageLinks;

  VolumeInfoVO(
      {this.title,
        this.authors,
        this.publishedDate,
        this.printType,
        this.maturityRating,
        this.allowAnonLogging,
        this.contentVersion,
        this.language,
        this.subtitle,
        this.description,
        this.imageLinks});

  factory VolumeInfoVO.fromJson(Map<String, dynamic> json) =>_$VolumeInfoVOFromJson(json);
  }
