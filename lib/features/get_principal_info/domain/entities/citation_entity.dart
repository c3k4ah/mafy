import 'package:equatable/equatable.dart';

class CitationEntity extends Equatable {
  final String quote;
  final String author;
  final String h;

  const CitationEntity({
    required this.quote,
    required this.author,
    required this.h,
  });

  @override
  List<Object?> get props => [quote, author, h];
}
