import 'package:dio/dio.dart';
import 'package:library_book/constant/api_constant.dart';
import 'package:retrofit/retrofit.dart';
import '../response/search_response.dart';
part 'library_api.g.dart';
@RestApi(baseUrl: kSearchBaseUrl)
abstract class LibraryAPI {
 factory LibraryAPI(Dio dio) => _LibraryAPI(dio);

 @GET(kGetSearchEndPoint)
  Future<SearchResponse> getSearchResponse(
     @Query(kSearchQueryParams) String key
     );
}