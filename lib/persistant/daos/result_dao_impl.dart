import 'package:hive/hive.dart';
import 'package:library_book/constant/hive_constant.dart';
import 'package:library_book/persistant/daos/result_dao.dart';

import '../../data/vos/overview_vo/result_vo.dart';

class ResultDAOImpl extends ResultDAO{
  ResultDAOImpl._();
  static final ResultDAOImpl _singleton= ResultDAOImpl._();
  factory ResultDAOImpl()=>_singleton;

  @override
  ResultsVO? getResultDataFromDatabase(String publishDate) =>_resultBox().get(publishDate);

  @override
  Stream<ResultsVO?> getResultDataFromStream(String publishDate) =>Stream.value(getResultDataFromDatabase(publishDate));

  @override
  void save(String publishDate,ResultsVO resultsVO) =>_resultBox().put(publishDate, resultsVO);

  @override
  Stream watch()=>_resultBox().watch();
Box<ResultsVO> _resultBox()=>Hive.box(kBoxNameForResult);
}