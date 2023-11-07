import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../core/error/exceptios.dart';
import '../../core/error/failure.dart';
import '../../domain/entities/news_entity.dart';
import '../../domain/repository/base_news_repository.dart';
import '../datasource/news_remote_data_source.dart';

class NewsRepository extends BaseNewsRepository {
  final BaseNewsRemoteDataSource baseNewsRemoteDataSource;

  NewsRepository(this.baseNewsRemoteDataSource);
  @override
  Future<Either<Failure, RxList<News>>> getArticles(String seaechedText) async {
    try {
      final result = await baseNewsRemoteDataSource.getArticles(seaechedText);

      return Right(result);
    } on ServerException catch (failuar) {
      return Left(ServerFailure(failuar.errorMessageModel.message));
    }
  }
}
