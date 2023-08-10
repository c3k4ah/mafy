import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafy/core/usecase/usecase.dart';

import '../../domain/domain.dart';

part 'principal_event.dart';
part 'principal_state.dart';

class PrincipalInfoBloc extends Bloc<PrincipalInfoEvent, PrincipalInfoState> {
  final CacheLastCitationUsecase cacheLastCitation;
  final GetLocalCitationUsecase getLocalCitation;
  final GetRemoteCitationUsecase getRemoteCitation;

  PrincipalInfoBloc({
    required this.cacheLastCitation,
    required this.getLocalCitation,
    required this.getRemoteCitation,
  }) : super(const PrincipalInfoState(
          status: PrincipalInfoStatus.init,
          currentCitation: CitationEntity(
            author: 'C',
            h: '',
            quote: 'Ex nihilo nihil fit',
          ),
          error: '',
        )) {
    on<PrincipalInfoInitialize>(_onPrincipalInfoInitialize);
    on<GetCurrentCitationEvent>(_onGetCurrentCitationEvent);
    on<SaveCitationEvent>(_onSaveCitationEvent);
  }

  FutureOr<void> _onPrincipalInfoInitialize(
      PrincipalInfoInitialize event, Emitter<PrincipalInfoState> emit) async {
    emit(state.copyWith(status: PrincipalInfoStatus.loading));
    add(GetCurrentCitationEvent());
  }

  FutureOr<void> _onGetCurrentCitationEvent(
      GetCurrentCitationEvent event, Emitter<PrincipalInfoState> emit) async {
    emit(state.copyWith(status: PrincipalInfoStatus.loading));
    final localCitation = await getRemoteCitation(NoParams());
    localCitation.fold((failure) {
      emit(state.copyWith(
        status: PrincipalInfoStatus.failure,
        error: failure.toString(),
      ));
    }, (citation) async {
      emit(state.copyWith(
        status: PrincipalInfoStatus.done,
        currentCitation: citation,
      ));
      add(SaveCitationEvent(lastCitation: citation));
    });
  }

  FutureOr<void> _onSaveCitationEvent(
      SaveCitationEvent event, Emitter<PrincipalInfoState> emit) async {
    emit(state.copyWith(status: PrincipalInfoStatus.loading));
    final localCitation = await cacheLastCitation(event.lastCitation);
    localCitation.fold((failure) {
      emit(state.copyWith(
        status: PrincipalInfoStatus.failure,
        error: failure.toString(),
      ));
    }, (citation) {
      emit(
        state.copyWith(
          status: PrincipalInfoStatus.done,
        ),
      );
    });
  }
}
