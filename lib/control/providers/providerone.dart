import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_tts/flutter_tts.dart';

class ProviderOne with ChangeNotifier {
  bool _isPlaying = false;

  int _selectedIndex = 0;
  final List<String> _items = [
    'English',
    'हिंदी',
    'മലയാളം',
  ];

  int get selectedIndex => _selectedIndex;

  List<String> get items => _items;

  void setSelectedIndex(int index, BuildContext context) {
    _selectedIndex = index;
    if (_items[index] == _items[0]) {
      context.setLocale(Locale('en', 'US'));
    } else if (_items[index] == _items[1]) {
      context.setLocale(Locale('hi', 'IN'));
    } else if (_items[index] == _items[2]) {
      context.setLocale(Locale('ml', 'IN'));
    }
    notifyListeners();
  }

  // bool _isPlaying = false;

  bool get isPlaying => _isPlaying;

  void setIsPlaying(bool value) {
    _isPlaying = value;
    notifyListeners();
  }


  // bool isPlaying = false;
  // FlutterTts flutterTts = FlutterTts();
  //
  // Future<void> playAll(BuildContext context) async {
  //   // isPlaying = true;
  //   notifyListeners();
  //
  //   try {
  //     // Wait for each TTS message to complete before playing the next one
  //     await speak('textcalling'.tr().toString(), 1.5, context);
  //     if (!isPlaying) return;
  //     await Future.delayed(Duration(seconds: 3));
  //     if (!isPlaying) return;
  //     await speak('textdelivery'.tr().toString(), 1.5, context);
  //     if (!isPlaying) return;
  //     await Future.delayed(Duration(seconds: 3));
  //     if (!isPlaying) return;
  //     await speak('texttiger'.tr().toString(), 1.5, context);
  //   } finally {
  //     // isPlaying = false;
  //     notifyListeners();
  //   }
  // }
  //
  // Future<void> speak(String message, double rate, BuildContext context) async {
  //   await flutterTts.setLanguage(getCurrentLanguageCode(context));
  //   await flutterTts.setSpeechRate(rate);
  //   await flutterTts.speak(message);
  // }
  //
  // String getCurrentLanguageCode(BuildContext context) {
  //   Locale currentLocale = context.locale;
  //   return currentLocale.languageCode;
  // }
}
