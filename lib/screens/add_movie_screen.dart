import 'package:flutter/material.dart';
import 'package:movie_list/controllers/add_movie_form.dart';

class AddMovieScreen extends StatelessWidget {
  const AddMovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: AddMovieForm(),
    );
  }
}
