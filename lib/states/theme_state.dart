import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeState with ChangeNotifier {
  bool _isDarkModeEnabled = false;

  ThemeData get currentTheme => _isDarkModeEnabled
      ? ThemeData.dark().copyWith(
          appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.black,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(0, 129, 112, 1),
            ),
          ),
        )
      : ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFF4B64F2),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Color(0xFF4B64F2),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF4B64F2),
            ),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
          ),
          colorScheme: ColorScheme.light().copyWith(
            background: Color(0xFF4B64F2),
          )
        );

  bool get isDarkModeEnabled => _isDarkModeEnabled;

  void setDarkMode(bool b) {
    _isDarkModeEnabled = b;
    notifyListeners();
  }
}
