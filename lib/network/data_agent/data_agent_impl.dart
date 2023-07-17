import 'package:dio/dio.dart';
import 'package:library_book/constant/api_constant.dart';
import 'package:library_book/data/vos/search_vo/item_vo.dart';
import 'package:library_book/network/api/library_api.dart';

import '../../data/vos/overview_vo/result_vo.dart';
import '../api/library_home_page_api.dart';
import 'data_agent.dart';

class LibraryDataAgentImpl extends LibraryDataAgent{
  late LibraryAPI _libraryAPI;
  late LibraryHomePageAPI _homePageAPI;
 LibraryDataAgentImpl._(){
   _libraryAPI = LibraryAPI(Dio());
   _homePageAPI = LibraryHomePageAPI(Dio());
 }
 static final LibraryDataAgentImpl _singleton = LibraryDataAgentImpl._();
 factory LibraryDataAgentImpl()=>_singleton;
///Data_Agent_For_Search
  @override
  Future<List<ItemsVO>?> getSearchResult(String key) =>_libraryAPI.getSearchResponse(key)
      .asStream()
      .map((event) => event.items)
      .first;
///Data_agent_For_Over_View
  @override
  Future<ResultsVO?> getResultData(String publishDate) =>_homePageAPI.getBookResponse(publishDate,apiKey)
      .asStream()
      .map((event) => event.results).first;

}