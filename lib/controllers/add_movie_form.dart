import 'package:flutter/material.dart';
import 'package:movie_list/constants.dart';
import 'package:movie_list/generated/l10n.dart';

class AddMovieForm extends StatefulWidget {
  const AddMovieForm({Key? key}) : super(key: key);

  @override
  _AddMovieFormState createState() => _AddMovieFormState();
}

class _AddMovieFormState extends State<AddMovieForm> {
  final _formKey = GlobalKey<FormState>();
  final tcMovieName = TextEditingController();
  final tcDirectors = TextEditingController();
  bool isWatched = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            M7tL10n.of(context).amfTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.lightBlueAccent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextFormField(
              autofocus: true,
              textAlign: TextAlign.center,
              maxLength: 25,
              autovalidateMode: AutovalidateMode.always,
              decoration: kTextInputDecoration.copyWith(
                labelText: M7tL10n.of(context).amfMovieNameLabel,
              ),
            ),
          ),
          TextFormField(
            autofocus: true,
            textAlign: TextAlign.center,
            decoration: kTextInputDecoration.copyWith(
              labelText: M7tL10n.of(context).amfDirectorsLabel,
            ),
          ),
          CheckboxListTile(
            autofocus: true,
            value: isWatched,
            onChanged: (value) {
              setState(() => isWatched = value ?? false);
            },
            dense: false,
            selected: isWatched,
            title: Text(M7tL10n.of(context).amfIsWatchedTitle),
          ),
          ElevatedButton(
            child: Text(
              M7tL10n.of(context).amfSubmitButton,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
