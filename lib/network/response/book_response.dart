import 'package:json_annotation/json_annotation.dart';

import '../../data/vos/overview_vo/result_vo.dart';
part 'book_response.g.dart';
@JsonSerializable()
class BookResponse {
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'copyright')
  String? copyright;
  @JsonKey(name: 'num_results')
  int? numResults;
  @JsonKey(name: 'results')
  ResultsVO? results;

  BookResponse({this.status, this.copyright, this.numResults, this.results});

  factory BookResponse.fromJson(Map<String, dynamic> json) =>_$BookResponseFromJson(json);
  }