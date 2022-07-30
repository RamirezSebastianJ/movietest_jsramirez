import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'genre.dart';

part 'genres.g.dart';

@JsonSerializable()
class Genres {
  final List<Genre>? genres;

  const Genres({this.genres});

  @override
  String toString() => 'Genres(genres: $genres)';

  factory Genres.fromJson(Map<String, dynamic> json) {
    return _$GenresFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GenresToJson(this);

  Genres copyWith({
    List<Genre>? genres,
  }) {
    return Genres(
      genres: genres ?? this.genres,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Genres) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => genres.hashCode;
}
