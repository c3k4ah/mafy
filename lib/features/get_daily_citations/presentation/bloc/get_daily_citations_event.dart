// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_daily_citations_bloc.dart';

abstract class DailyCitationsEvent extends Equatable {}

class DailyCitationInitialize extends DailyCitationsEvent {
  @override
  List<Object?> get props => [];
}

class GetCurrentCitationEvent extends DailyCitationsEvent {
  final CitationEntity currentCitation;

  GetCurrentCitationEvent({
    required this.currentCitation,
  });

  @override
  List<Object?> get props => [currentCitation];
}

class SaveCitationEvent extends DailyCitationsEvent {
  final CitationEntity lastCitation;
  SaveCitationEvent({
    required this.lastCitation,
  });

  @override
  List<Object?> get props => [lastCitation];
}
