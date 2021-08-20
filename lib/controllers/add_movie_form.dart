import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_list/constants.dart';
import 'package:movie_list/generated/l10n.dart';
import 'package:movie_list/models/movie_model.dart';

class AddMovieForm extends StatefulWidget {
  final int boxIdx;
  const AddMovieForm({Key? key, this.boxIdx = -1}) : super(key: key);

  @override
  _AddMovieFormState createState() => _AddMovieFormState();
}

class _AddMovieFormState extends State<AddMovieForm> {
  final _formKey = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();
  final tcMovieName = TextEditingController();
  final tcDirectors = TextEditingController();
  bool isWatched = true;
  Image? poster;
  Uint8List imgBytes = Uint8List(0);

  final _moviesBox = Hive.box<Movie>('movies');
  // Since XFile.path creates issues when passed to File, it is recommended
  // to use the XFile.readAsBytes() method & extract an image file or
  // a normal file from the returned Uint8List
  void convert2Image(XFile pickedImage) async {
    imgBytes = await pickedImage.readAsBytes();
    setState(() {
      poster = Image.memory(
        imgBytes,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.boxIdx == -1) return;
    Movie? movie = _moviesBox.getAt(widget.boxIdx) ?? null;
    if (movie != null) {
      setState(() {
        tcMovieName.text = movie.name;
        tcDirectors.text = movie.directors.join(", ");
        isWatched = movie.watched;
        imgBytes = movie.posterBytes;
        if (imgBytes.length > 0) poster = Image.memory(imgBytes);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
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
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Please Enter the movie name';
                  return null;
                },
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
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Please Enter the name of the director(s)';
                  return null;
                },
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
                  // Label
                  Text(
                    M7tL10n.of(context).amfPoster,
                    style: TextStyle(
                      color: Colors.lightBlue[900],
                      fontSize: 20.0,
                    ),
                  ),
                  // Gallery Image Picker
                  IconButton(
                    onPressed: () async {
                      final XFile? image =
                          await _picker.pickImage(source: ImageSource.gallery);
                      if (image != null) convert2Image(image);
                    },
                    color: Colors.lightBlueAccent,
                    iconSize: 30.0,
                    icon: Icon(Icons.photo_library_outlined),
                  ),
                  // Camera Image Picker
                  kIsWeb
                      ? SizedBox()
                      : IconButton(
                          onPressed: () async {
                            final XFile? image = await _picker.pickImage(
                                source: ImageSource.camera);
                            if (image != null) convert2Image(image);
                          },
                          color: Colors.lightBlueAccent,
                          iconSize: 30.0,
                          icon: Icon(Icons.add_a_photo_outlined),
                        ),
                ],
              ),
            ),
            poster != null
                ? Container(
                    height: 256.0,
                    child: ClipRRect(
                      child: poster,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  )
                : SizedBox(),
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
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text(M7tL10n.of(context).amfValidationSuccess)));

                    // Debugging
                    /*print(tcMovieName.text);
                    print(
                        tcDirectors.text.split(",").map((e) => e.trim()).toList());
                    print(isWatched.toString());
                    print(imgBytes.length);*/
                    final String movieName = tcMovieName.text;
                    final List<String> movieDirectors = tcDirectors.text
                        .split(",")
                        .map((e) => e.trim())
                        .toList();
                    if (movieName == '' || tcDirectors.text == '') return;

                    final Movie newMovie = Movie(
                      name: movieName,
                      directors: movieDirectors,
                      watched: isWatched,
                      posterBytes: imgBytes,
                    );
                    if (widget.boxIdx == -1)
                      _moviesBox.add(newMovie);
                    else
                      _moviesBox.putAt(widget.boxIdx, newMovie);

                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(M7tL10n.of(context).amfValidationFailure),
                      backgroundColor: Colors.redAccent,
                    ));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
