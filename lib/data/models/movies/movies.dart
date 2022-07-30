import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'movies.g.dart';

@JsonSerializable()
class Movies {
  final int? page;
  final List<Result>? results;
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  @JsonKey(name: 'total_results')
  final int? totalResults;

  const Movies({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  @override
  String toString() {
    return 'Movies(page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults)';
  }

  factory Movies.fromJson(Map<String, dynamic> json) {
    return _$MoviesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MoviesToJson(this);

  Movies copyWith({
    int? page,
    List<Result>? results,
    int? totalPages,
    int? totalResults,
  }) {
    return Movies(
      page: page ?? this.page,
      results: results ?? this.results,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Movies) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      page.hashCode ^
      results.hashCode ^
      totalPages.hashCode ^
      totalResults.hashCode;
}
