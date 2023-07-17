
import '../../data/vos/overview_vo/result_vo.dart';

abstract class ResultDAO{
  void save(String publishDate,ResultsVO resultsVO);
  ResultsVO? getResultDataFromDatabase(String publishDate);
  Stream watch();
  Stream<ResultsVO?> getResultDataFromStream(String publishDate);
}