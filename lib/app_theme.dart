import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static final ThemeData lightTheme= ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.white70,
        iconTheme: IconThemeData(color: Colors.black, opacity: 0.9),
        systemOverlayStyle: SystemUiOverlayStyle.dark, toolbarTextStyle: TextTheme(
      titleMedium: TextStyle(
        color: Colors.grey.shade900,
      ),
    ).bodyMedium,
        titleTextStyle: TextTheme(
          titleMedium: TextStyle(
            color: Colors.grey.shade900,
          ),
        ).titleLarge
    ),
      //scaffoldBackgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black, opacity: 0.9),
      primaryColor: Colors.black,
    primaryColorDark: Colors.grey.shade200,
    primaryColorLight: Colors.white,
    primaryIconTheme: IconThemeData(color: Colors.blueGrey.shade600, opacity: 0.9),
    brightness: Brightness.light,
      dividerColor: Colors.grey.shade300,
      textTheme: TextTheme(
        titleSmall: TextStyle(
          color: Colors.grey.shade700,
        ),
        titleMedium: TextStyle(
          color: Colors.grey.shade900,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white70,
          selectedItemColor:Colors.lightBlue,
          unselectedItemColor: Colors.grey
      ),
      //colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(background: Color(0xFFE5E5E5))
  );


  static final ThemeData darkTheme= ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.white, opacity: 0.9),
        systemOverlayStyle: SystemUiOverlayStyle.light, toolbarTextStyle: TextTheme(
        titleMedium: TextStyle(
          color: Colors.grey.shade50,
        ),
      ).bodyMedium,
        titleTextStyle: TextTheme(
        titleMedium: TextStyle(
          color: Colors.grey.shade50,
        ),
      ).titleLarge
    ),
    scaffoldBackgroundColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.white, opacity: 0.9),
      primaryColor: Colors.white,
      primaryColorDark: Colors.grey.shade900,
      primaryColorLight: Colors.grey.shade800,
      primaryIconTheme: IconThemeData(color: Colors.white70, opacity: 0.9),
      brightness: Brightness.dark,
      dividerColor: Colors.white70,
      textTheme: TextTheme(
        titleSmall: TextStyle(
        color: Colors.white,
      ),
        titleMedium: TextStyle(
          color: Colors.grey.shade50,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor:Colors.white,
          unselectedItemColor: Colors.grey
      ),
      //colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith (background: Colors.black)
  );
}
