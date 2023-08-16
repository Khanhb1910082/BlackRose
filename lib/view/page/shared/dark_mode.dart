import 'package:blackrose/view/page/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;

  // ThemeMode currentTheme() {
  //   return isDarkMode ? ThemeMode.dark : ThemeMode.light;
  // }

  // void toggleTheme() {
  //   isDarkMode = !isDarkMode;
  //   notifyListeners();
  // }

  ThemeData _themeData;

  ThemeProvider(this._themeData);

  ThemeData getTheme() => _themeData;

  void setTheme(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    if (themeProvider.getTheme().brightness == Brightness.light) {
      themeProvider.setTheme(AppTheme.darkTheme); // Chế độ tối
      isDarkMode = true;
    } else {
      themeProvider.setTheme(AppTheme.lightTheme); // Chế độ sáng
      isDarkMode = false;
    }
  }
}
