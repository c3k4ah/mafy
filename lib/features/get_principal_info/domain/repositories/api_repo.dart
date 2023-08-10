import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/citation_entity.dart';

abstract class ApiRepo {
  Future<Either<Failure, CitationEntity>> getRemoteCitation();
  Future<Either<Failure, CitationEntity>> getLastCitation();
  Future<Either<Failure, void>> cacheLastCitation(
      {required CitationEntity citationsToCache});
}
