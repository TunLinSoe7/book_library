import 'package:json_annotation/json_annotation.dart';
import 'package:library_book/data/vos/search_vo/item_vo.dart';
part 'search_response.g.dart';
@JsonSerializable()
class SearchResponse {
  @JsonKey(name: 'kind')
  String? kind;
  @JsonKey(name: 'totalItems')
  int? totalItems;
  @JsonKey(name: 'items')
  List<ItemsVO>? items;

  SearchResponse({this.kind, this.totalItems, this.items});

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>_$SearchResponseFromJson(json);
  }