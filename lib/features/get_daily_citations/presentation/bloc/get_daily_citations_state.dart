// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_daily_citations_bloc.dart';

enum DailyCitationStatus { init, loading, failure, done }

class DailyCitationsState extends Equatable {
  final DailyCitationStatus status;
  final CitationEntity citation;
  final String error;
  const DailyCitationsState({
    required this.status,
    required this.citation,
    required this.error,
  });
  DailyCitationsState copyWith({
    DailyCitationStatus? status,
    CitationEntity? citation,
    String? error,
  }) {
    return DailyCitationsState(
      status: status ?? this.status,
      citation: citation ?? this.citation,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, citation, error];
}
