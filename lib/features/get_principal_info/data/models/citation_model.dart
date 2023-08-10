import '../../domain/entities/citation_entity.dart';

class CitationModel extends CitationEntity {
  const CitationModel({
    required String quote,
    required String author,
    required String h,
  }) : super(
          quote: quote,
          author: author,
          h: h,
        );

  factory CitationModel.fromJson(Map<String, dynamic> json) {
    return CitationModel(
      quote: json['q'] as String,
      author: json['a'] as String,
      h: json['h'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'q': quote,
      'a': author,
      'h': h,
    };
  }

  //copyWith method
  CitationModel copyWith({
    String? quote,
    String? author,
    String? h,
  }) {
    return CitationModel(
      quote: quote ?? this.quote,
      author: author ?? this.author,
      h: h ?? this.h,
    );
  }
}
