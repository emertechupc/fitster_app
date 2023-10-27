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
          dividerColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(0, 129, 112, 1),
            ),
          ),
          filledButtonTheme: FilledButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                    Color.fromRGBO(0, 129, 112, 1)),
                fixedSize: MaterialStatePropertyAll<Size>(Size(128, 48))),
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: Color.fromRGBO(0, 129, 112, 1),
          ),
          inputDecorationTheme: InputDecorationTheme(
            errorStyle: TextStyle(color: Colors.redAccent),
            labelStyle: TextStyle(color: Colors.grey),
            hintStyle: TextStyle(color: Colors.grey),
          ),
          textTheme: TextTheme(
            headlineSmall: TextStyle(color: Colors.black),
            bodyMedium: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
          ),
        )
      : ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFF4B64F2),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Color(0xFF4B64F2),
            ),
          ),
          dividerColor: Colors.black,
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
          ),
          filledButtonTheme: FilledButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(
                Color(0xFF4B64F2),
              ),
              fixedSize: MaterialStatePropertyAll<Size>(
                Size(128, 48),
              ),
            ),
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: Color(0xFF4B64F2),
          ),
          textTheme: TextTheme(
            headlineSmall: TextStyle(color: Colors.black),
            bodyMedium: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
          ),
        );

  bool get isDarkModeEnabled => _isDarkModeEnabled;

  void setDarkMode(bool b) {
    _isDarkModeEnabled = b;
    notifyListeners();
  }
}
