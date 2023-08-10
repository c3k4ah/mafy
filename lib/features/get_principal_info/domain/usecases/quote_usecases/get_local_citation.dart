// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:mafy/core/error/failure.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../entities/citation_entity.dart';
import '../../repositories/api_repo.dart';

class GetLocalCitationUsecase implements Usecase<CitationEntity, NoParams> {
  final ApiRepo apiRepo;
  GetLocalCitationUsecase({
    required this.apiRepo,
  });

  @override
  Future<Either<Failure, CitationEntity>> call(NoParams params) {
    return apiRepo.getLastCitation();
  }
}
