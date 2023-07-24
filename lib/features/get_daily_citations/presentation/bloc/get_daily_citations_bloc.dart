import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafy/core/usecase/usecase.dart';

import '../../domain/domain.dart';

part 'get_daily_citations_event.dart';
part 'get_daily_citations_state.dart';

class DailyCitationsBloc
    extends Bloc<DailyCitationsEvent, DailyCitationsState> {
  final CacheLastCitationUsecase cacheLastCitation;
  final GetLocalCitationUsecase getLocalCitation;
  final GetRemoteCitationUsecase getRemoteCitation;

  DailyCitationsBloc({
    required this.cacheLastCitation,
    required this.getLocalCitation,
    required this.getRemoteCitation,
  }) : super(DailyCitationsState(
          status: DailyCitationStatus.init,
          citation: CitationEntity(),
          error: '',
        )) {
    add(DailyCitationInitialize());
    add(GetCurrentCitationEvent(currentCitation: CitationEntity()));
    add(SaveCitationEvent(lastCitation: CitationEntity()));
  }

  FutureOr<void> onDailyCitationInitialize(
      DailyCitationInitialize event, Emitter<DailyCitationsState> emit) async {
    emit(state.copyWith(status: DailyCitationStatus.loading));
    final localCitation = await getLocalCitation(NoParams());

    localCitation.fold((failure) {
      emit(state.copyWith(
        status: DailyCitationStatus.failure,
        error: failure.toString(),
      ));
    }, (citation) {
      emit(state.copyWith(
        status: DailyCitationStatus.done,
        citation: citation,
      ));
    });
  }

  FutureOr<void> onGetCurrentCitationEvent(
      GetCurrentCitationEvent event, Emitter<DailyCitationsState> emit) async {
    emit(state.copyWith(status: DailyCitationStatus.loading));
    final localCitation = await getLocalCitation(NoParams());
    localCitation.fold((failure) {
      emit(state.copyWith(
        status: DailyCitationStatus.failure,
        error: failure.toString(),
      ));
    }, (citation) async {
      await cacheLastCitation(citation);
      emit(state.copyWith(
        status: DailyCitationStatus.done,
        citation: citation,
      ));
    });
  }
}
