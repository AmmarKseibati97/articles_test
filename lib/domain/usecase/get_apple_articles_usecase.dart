import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../core/error/failure.dart';
import '../entities/news_entity.dart';
import '../repository/base_news_repository.dart';

class GetArticlesUseCase {
  final BaseNewsRepository repository;

  GetArticlesUseCase(this.repository);
  Future<Either<Failure, RxList<News>>> call(String seaechedText) async {
    return await repository.getArticles(seaechedText);
  }
}
