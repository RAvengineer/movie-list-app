// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class M7tL10n {
  M7tL10n();

  static M7tL10n? _current;

  static M7tL10n get current {
    assert(_current != null,
        'No instance of M7tL10n was loaded. Try to initialize the M7tL10n delegate before accessing M7tL10n.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<M7tL10n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = M7tL10n();
      M7tL10n._current = instance;

      return instance;
    });
  }

  static M7tL10n of(BuildContext context) {
    final instance = M7tL10n.maybeOf(context);
    assert(instance != null,
        'No instance of M7tL10n present in the widget tree. Did you add M7tL10n.delegate in localizationsDelegates?');
    return instance!;
  }

  static M7tL10n? maybeOf(BuildContext context) {
    return Localizations.of<M7tL10n>(context, M7tL10n);
  }

  /// `Movie Name`
  String get amfMovieNameLabel {
    return Intl.message(
      'Movie Name',
      name: 'amfMovieNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Director(s)`
  String get amfDirectorsLabel {
    return Intl.message(
      'Director(s)',
      name: 'amfDirectorsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Seperate the names by comma (,)`
  String get amfDirectorsHelper {
    return Intl.message(
      'Seperate the names by comma (,)',
      name: 'amfDirectorsHelper',
      desc: '',
      args: [],
    );
  }

  /// `Watched`
  String get amfIsWatchedTitle {
    return Intl.message(
      'Watched',
      name: 'amfIsWatchedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get amfSubmitButton {
    return Intl.message(
      'Add',
      name: 'amfSubmitButton',
      desc: '',
      args: [],
    );
  }

  /// `Add Movie`
  String get amfTitle {
    return Intl.message(
      'Add Movie',
      name: 'amfTitle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<M7tL10n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<M7tL10n> load(Locale locale) => M7tL10n.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
