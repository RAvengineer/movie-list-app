import 'dart:typed_data';

import 'package:hive/hive.dart';

part 'movie_model.g.dart';

@HiveType(typeId: 0)
class Movie {
  @HiveField(0)
  String name = '';

  @HiveField(1)
  List<String> directors = [];

  @HiveField(2)
  bool watched = true;

  @HiveField(3)
  Uint8List posterBytes = Uint8List(0);

  Movie(
      {required this.name,
      required this.directors,
      this.watched = true,
      required this.posterBytes});
}
