import 'package:flutter/material.dart';
import 'package:movie_list/controllers/add_movie_form.dart';

class AddMovieScreen extends StatelessWidget {
  const AddMovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: AddMovieForm(),
      ),
    );
  }
}
