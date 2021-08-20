import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_list/models/movie_model.dart';
import 'package:movie_list/widgets/movie_tile.dart';

class MovieListView extends StatelessWidget {
  const MovieListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<Movie>('movies').listenable(),
      builder: (context, Box<Movie> _movieBox, widget) => ListView.builder(
        itemCount: _movieBox.length,
        itemBuilder: (context, index) {
          final movie = _movieBox.getAt(index) ??
              Movie(
                name: 'Not Found',
                directors: ['NA'],
                posterBytes: Uint8List(0),
              );
          return MovieTile(movie: movie);
        },
      ),
    );
  }
}
