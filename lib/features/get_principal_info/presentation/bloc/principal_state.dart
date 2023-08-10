// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'principal_bloc.dart';

enum PrincipalInfoStatus { init, loading, failure, done }

class PrincipalInfoState extends Equatable {
  final PrincipalInfoStatus status;
  final CitationEntity currentCitation;
  final String error;
  const PrincipalInfoState({
    required this.status,
    required this.currentCitation,
    required this.error,
  });
  PrincipalInfoState copyWith({
    PrincipalInfoStatus? status,
    CitationEntity? currentCitation,
    String? error,
  }) {
    return PrincipalInfoState(
      status: status ?? this.status,
      currentCitation: currentCitation ?? this.currentCitation,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, currentCitation, error];
}
