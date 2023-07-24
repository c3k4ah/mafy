// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:mafy/core/error/failure.dart';
import 'package:mafy/features/get_daily_citations/domain/entities/citation_entity.dart';

import '../../../../core/usecase/usecase.dart';
import '../repositories/api_repo.dart';

class GetRemoteCitationUsecase implements Usecase<CitationEntity, NoParams> {
  final ApiRepo apiRepo;
  GetRemoteCitationUsecase({
    required this.apiRepo,
  });

  @override
  Future<Either<Failure, CitationEntity?>> call(NoParams params) {
    return apiRepo.getRemoteCitation();
  }
}
