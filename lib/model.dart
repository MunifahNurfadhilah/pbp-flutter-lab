// To parse this JSON data, do
//
//     final toDo = toDoFromJson(jsonString);

import 'dart:convert';

List<ToDo> toDoFromJson(String str) => List<ToDo>.from(json.decode(str).map((x) => ToDo.fromJson(x)));

String toDoToJson(List<ToDo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ToDo {
  ToDo({
    required this.model,
    required this.pk,
    required this.fields,
  });

  Model? model;
  int pk;
  Fields fields;

  factory ToDo.fromJson(Map<String, dynamic> json) => ToDo(
    model: modelValues.map[json["model"]],
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "model": modelValues.reverse[model],
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class Fields {
  Fields({
    required this.watchedFilm,
    required this.titleFilm,
    required this.ratingFilm,
    required this.releaseDate,
    required this.reviewFilm,
  });

  WatchedFilm? watchedFilm;
  String titleFilm;
  String ratingFilm;
  String releaseDate;
  String reviewFilm;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    watchedFilm: watchedFilmValues.map[json["watched_film"]],
    titleFilm: json["title_film"],
    ratingFilm: json["rating_film"],
    releaseDate: json["release_date"],
    reviewFilm: json["review_film"],
  );

  Map<String, dynamic> toJson() => {
    "watched_film": watchedFilmValues.reverse[watchedFilm],
    "title_film": titleFilm,
    "rating_film": ratingFilm,
    "release_date": releaseDate,
    "review_film": reviewFilm,
  };
}

enum WatchedFilm { SUDAH }

final watchedFilmValues = EnumValues({
  "Sudah": WatchedFilm.SUDAH
});

enum Model { MYWATCHLIST_MYWATCHLIST }

final modelValues = EnumValues({
  "mywatchlist.mywatchlist": Model.MYWATCHLIST_MYWATCHLIST
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
