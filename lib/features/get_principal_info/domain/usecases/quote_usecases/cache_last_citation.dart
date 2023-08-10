// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:mafy/core/error/failure.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../entities/citation_entity.dart';
import '../../repositories/api_repo.dart';

class CacheLastCitationUsecase extends Usecase<void, CitationEntity> {
  final ApiRepo apiRepo;
  CacheLastCitationUsecase({
    required this.apiRepo,
  });
  @override
  Future<Either<Failure, void>> call(CitationEntity params) {
    return apiRepo.cacheLastCitation(citationsToCache: params);
  }
}
