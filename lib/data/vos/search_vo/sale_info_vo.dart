import 'package:json_annotation/json_annotation.dart';
part 'sale_info_vo.g.dart';
@JsonSerializable()
class SaleInfoVO {
  @JsonKey(name: 'country')
  String? country;
  @JsonKey(name: 'saleability')
  String? saleability;
  @JsonKey(name: 'isEbook')
  bool? isEbook;
  @JsonKey(name:'buyLink')
  String? buyLink;

  SaleInfoVO(
      {this.country,
        this.saleability,
        this.isEbook,
        this.buyLink,
        });

 factory SaleInfoVO.fromJson(Map<String, dynamic> json) =>_$SaleInfoVOFromJson(json);
  }
