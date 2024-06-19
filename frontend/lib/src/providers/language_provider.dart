import 'package:flutter/cupertino.dart';

class LanguageChangeProvider extends ChangeNotifier {
  Locale _currentLocale;
  int _languageIndex;

  LanguageChangeProvider(this._currentLocale, this._languageIndex);

  Locale get currentLocale => _currentLocale;
  int get languageIndex => _languageIndex;

  void setTheme(int index) {
    switch (index) {
      case 0:
        _currentLocale = const Locale('fr', '');
      case 1:
        _currentLocale = const Locale('en', '');
      default:
        _currentLocale = const Locale('fr', '');
    }
    _languageIndex = index;
    notifyListeners();
  }

  void changeLanguage() {
    int nextIndex = (_languageIndex + 1) % 2;
    setTheme(nextIndex);
  }
}
