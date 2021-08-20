import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:movie_list/models/movie_model.dart';
import 'package:movie_list/screens/home_screen.dart';
import 'generated/l10n.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    final applicatonDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(applicatonDocumentDir.path);
  }
  Hive.registerAdapter(MovieAdapter());

  // Open Hive Box for 'movies'
  await Hive.openBox<Movie>('movies');

  // Hive.box<Movie>('movies').clear();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie List',
      localizationsDelegates: [
        M7tL10n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: M7tL10n.delegate.supportedLocales,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        HomeScreen.route: (context) => HomeScreen(),
      },
    );
  }
}
