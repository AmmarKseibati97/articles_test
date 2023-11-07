import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../core/error/failure.dart';
import '../entities/news_entity.dart';

abstract class BaseNewsRepository {
  Future<Either<Failure, RxList<News>>> getArticles(String seaechedText);
}
