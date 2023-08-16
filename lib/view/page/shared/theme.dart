import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static final lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.white,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
        shadowColor: Colors.transparent,
        elevation: 0,
      ),
      switchTheme: const SwitchThemeData(
          thumbColor: MaterialStatePropertyAll(Colors.black)),
      primaryColorLight: Colors.black, // text
      iconTheme: const IconThemeData(color: Colors.black),
      primaryTextTheme:
          const TextTheme(bodyLarge: TextStyle(color: Colors.black))

      // Các thuộc tính khác cho chế độ sáng
      );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color.fromARGB(255, 40, 40, 40),
    // canvasColor: const Color(0xff270118),
    // scaffoldBackgroundColor: const Color(0xff270118),
    // primaryColor: Color(0xff991181),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 40, 40, 40),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      shadowColor: Colors.white10,
      elevation: 0,
    ),
    switchTheme: const SwitchThemeData(
        thumbColor: MaterialStatePropertyAll(Colors.white)),
    primaryColorLight: Colors.white,
    iconTheme: const IconThemeData(color: Colors.white),
    primaryTextTheme:
        const TextTheme(bodyLarge: TextStyle(color: Colors.white)),

    // Các thuộc tính khác cho chế độ tối
  );
}
