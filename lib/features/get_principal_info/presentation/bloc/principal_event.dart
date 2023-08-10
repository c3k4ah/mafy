// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'principal_bloc.dart';

abstract class PrincipalInfoEvent extends Equatable {}

class PrincipalInfoInitialize extends PrincipalInfoEvent {
  @override
  List<Object?> get props => [];
}

class GetCurrentCitationEvent extends PrincipalInfoEvent {
  @override
  List<Object?> get props => [];
}

class SaveCitationEvent extends PrincipalInfoEvent {
  final CitationEntity lastCitation;
  SaveCitationEvent({
    required this.lastCitation,
  });

  @override
  List<Object?> get props => [lastCitation];
}
