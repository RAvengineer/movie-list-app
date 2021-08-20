import 'package:flutter/material.dart';
import 'package:movie_list/models/movie_model.dart';
import 'package:movie_list/screens/add_movie_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.playlist_add),
          onPressed: () => {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddMovieScreen(),
                ),
              ),
            )
          },
        ),
        body: ValueListenableBuilder(
          valueListenable: Hive.box<Movie>('movies').listenable(),
          builder: (context, Box<Movie> _movieBox, widget) => ListView.builder(
            itemCount: _movieBox.length,
            itemBuilder: (context, index) {
              final movie = _movieBox.getAt(index);
              return ListTile(
                title: Text(movie!.name),
                subtitle: Text(movie.directors.join(' | ')),
                leading: Image.memory(
                  movie.posterBytes,
                  fit: BoxFit.contain,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
