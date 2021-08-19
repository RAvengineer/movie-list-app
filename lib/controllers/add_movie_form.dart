import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_list/constants.dart';
import 'package:movie_list/generated/l10n.dart';

class AddMovieForm extends StatefulWidget {
  const AddMovieForm({Key? key}) : super(key: key);

  @override
  _AddMovieFormState createState() => _AddMovieFormState();
}

class _AddMovieFormState extends State<AddMovieForm> {
  final _formKey = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();
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
          // Add Movie - Form Title
          Text(
            M7tL10n.of(context).amfTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.lightBlueAccent,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          // Movie Name Input Field
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextFormField(
              controller: tcMovieName,
              autofocus: true,
              textAlign: TextAlign.center,
              maxLength: 75,
              autovalidateMode: AutovalidateMode.always,
              decoration: kTextInputDecoration.copyWith(
                labelText: M7tL10n.of(context).amfMovieNameLabel,
              ),
            ),
          ),
          // Director(s) Input Field
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextFormField(
              controller: tcDirectors,
              textAlign: TextAlign.center,
              maxLength: 100,
              decoration: kTextInputDecoration.copyWith(
                labelText: M7tL10n.of(context).amfDirectorsLabel,
                helperText: M7tL10n.of(context).amfDirectorsHelper,
              ),
            ),
          ),
          // Pick Poster - ImagePicker
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  M7tL10n.of(context).amfPoster,
                  style: TextStyle(
                    color: Colors.lightBlue[900],
                    // fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                Flexible(
                  child: IconButton(
                    onPressed: () {},
                    color: Colors.lightBlueAccent,
                    iconSize: 30.0,
                    icon: Icon(Icons.photo_library_outlined),
                  ),
                ),
                Flexible(
                  child: IconButton(
                    onPressed: () {},
                    color: Colors.lightBlueAccent,
                    iconSize: 30.0,
                    icon: Icon(Icons.add_a_photo_outlined),
                  ),
                ),
              ],
            ),
          ),
          // Is the movie watched? - Checkbox
          CheckboxListTile(
            value: isWatched,
            onChanged: (value) {
              setState(() => isWatched = value ?? false);
            },
            dense: false,
            selected: isWatched,
            title: Text(M7tL10n.of(context).amfIsWatchedTitle),
          ),
          // Add Movie - Submit Button
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ElevatedButton(
              child: Text(
                M7tL10n.of(context).amfSubmitButton,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                // ignore: todo
                // TODO: Replace print with function to save the movie in a list
                print(
                    tcMovieName.text + tcDirectors.text + isWatched.toString());
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
