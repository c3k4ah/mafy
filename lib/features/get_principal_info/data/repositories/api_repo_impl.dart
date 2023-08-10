import 'package:dartz/dartz.dart';

import 'package:mafy/core/error/failure.dart';

import '../../domain/domain.dart';
import '../data.dart';

class ApiRepoImpl extends ApiRepo {
  final ApiLocalDataSource localDataSource;
  final ApiRemoteDataSource remoteDataSource;

  ApiRepoImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, void>> cacheLastCitation(
      {required CitationEntity citationsToCache}) async {
    try {
      final citation = citationsToCache as CitationModel;
      final result =
          localDataSource.cacheLastCitation(citationsToCache: citation);
      return Right(result);
    } on CacheFailure {
      return const Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, CitationEntity>> getLastCitation() async {
    try {
      final lastCitation = localDataSource.getLastCitation();
      final citation = lastCitation as CitationEntity;
      return Right(citation);
    } on CacheFailure {
      return const Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, CitationEntity>> getRemoteCitation() async {
    try {
      final remoteCitation = await remoteDataSource.getRemoteCitation();
      localDataSource.cacheLastCitation(citationsToCache: remoteCitation);
      return Right(remoteCitation);
    } on ServerFailure {
      return const Left(ServerFailure());
    } on CacheFailure {
      return const Left(CacheFailure());
    }
  }
}
