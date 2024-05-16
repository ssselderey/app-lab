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

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Guess the animal`
  String get guessTheAnimal {
    return Intl.message(
      'Guess the animal',
      name: 'guessTheAnimal',
      desc: '',
      args: [],
    );
  }

  /// `Write who is on the image                                                `
  String get writeWhoIsOnTheImage {
    return Intl.message(
      'Write who is on the image                                                ',
      name: 'writeWhoIsOnTheImage',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Finish`
  String get finish {
    return Intl.message(
      'Finish',
      name: 'finish',
      desc: '',
      args: [],
    );
  }

  /// `Your answer`
  String get yourAnswer {
    return Intl.message(
      'Your answer',
      name: 'yourAnswer',
      desc: '',
      args: [],
    );
  }

  /// `Eh? Wrong answer :(`
  String get ehWrongAnswer {
    return Intl.message(
      'Eh? Wrong answer :(',
      name: 'ehWrongAnswer',
      desc: '',
      args: [],
    );
  }

  /// `That is racoon`
  String get thatIsRacoon {
    return Intl.message(
      'That is racoon',
      name: 'thatIsRacoon',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get tryAgain {
    return Intl.message(
      'Try again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Holy molly! That is correct!`
  String get holyMollyThatIsCorrect {
    return Intl.message(
      'Holy molly! That is correct!',
      name: 'holyMollyThatIsCorrect',
      desc: '',
      args: [],
    );
  }

  /// `Hello, $userName!`
  String get helloUsername {
    return Intl.message(
      'Hello, \$userName!',
      name: 'helloUsername',
      desc: '',
      args: [],
    );
  }

  /// `Your username`
  String get username {
    return Intl.message(
      'Your username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Hello,`
  String get hello {
    return Intl.message(
      'Hello,',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Are you ready for learning today?`
  String get areYouReadyForLearningToday {
    return Intl.message(
      'Are you ready for learning today?',
      name: 'areYouReadyForLearningToday',
      desc: '',
      args: [],
    );
  }

  /// `     Top users`
  String get topUsers {
    return Intl.message(
      '     Top users',
      name: 'topUsers',
      desc: '',
      args: [],
    );
  }

  /// `points`
  String get points {
    return Intl.message(
      'points',
      name: 'points',
      desc: '',
      args: [],
    );
  }

  /// `     Availible exercises`
  String get availibleExercises {
    return Intl.message(
      '     Availible exercises',
      name: 'availibleExercises',
      desc: '',
      args: [],
    );
  }

  /// `Word practice`
  String get wordPractice {
    return Intl.message(
      'Word practice',
      name: 'wordPractice',
      desc: '',
      args: [],
    );
  }

  /// `Audition`
  String get audition {
    return Intl.message(
      'Audition',
      name: 'audition',
      desc: '',
      args: [],
    );
  }

  /// `Game`
  String get game {
    return Intl.message(
      'Game',
      name: 'game',
      desc: '',
      args: [],
    );
  }

  /// `Not Connected`
  String get notConnected {
    return Intl.message(
      'Not Connected',
      name: 'notConnected',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Internet Connection`
  String get internetConnection {
    return Intl.message(
      'Internet Connection',
      name: 'internetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Check again`
  String get checkAgain {
    return Intl.message(
      'Check again',
      name: 'checkAgain',
      desc: '',
      args: [],
    );
  }

  /// `Name selection`
  String get nameSelection {
    return Intl.message(
      'Name selection',
      name: 'nameSelection',
      desc: '',
      args: [],
    );
  }

  /// `Change username`
  String get changeUsername {
    return Intl.message(
      'Change username',
      name: 'changeUsername',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Change language`
  String get changeLanguage {
    return Intl.message(
      'Change language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Change theme`
  String get changeTheme {
    return Intl.message(
      'Change theme',
      name: 'changeTheme',
      desc: '',
      args: [],
    );
  }

  /// `Please press this button and say this`
  String get pleasePressThisButtonAndSayThis {
    return Intl.message(
      'Please press this button and say this',
      name: 'pleasePressThisButtonAndSayThis',
      desc: '',
      args: [],
    );
  }

  /// `word. Our service will check`
  String get wordOurServiceWillCheck {
    return Intl.message(
      'word. Our service will check',
      name: 'wordOurServiceWillCheck',
      desc: '',
      args: [],
    );
  }

  /// `your pronunciation.`
  String get yourPronunciation {
    return Intl.message(
      'your pronunciation.',
      name: 'yourPronunciation',
      desc: '',
      args: [],
    );
  }

  /// `Correct!`
  String get correct {
    return Intl.message(
      'Correct!',
      name: 'correct',
      desc: '',
      args: [],
    );
  }

  /// `For free, join now and`
  String get forFreeJoinNowAnd {
    return Intl.message(
      'For free, join now and',
      name: 'forFreeJoinNowAnd',
      desc: '',
      args: [],
    );
  }

  /// `start learning!`
  String get startLearning {
    return Intl.message(
      'start learning!',
      name: 'startLearning',
      desc: '',
      args: [],
    );
  }

  /// `Your Username`
  String get yourUsername {
    return Intl.message(
      'Your Username',
      name: 'yourUsername',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Language select`
  String get languageSelect {
    return Intl.message(
      'Language select',
      name: 'languageSelect',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Russian`
  String get russian {
    return Intl.message(
      'Russian',
      name: 'russian',
      desc: '',
      args: [],
    );
  }

  /// `Listening`
  String get listening {
    return Intl.message(
      'Listening',
      name: 'listening',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
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
