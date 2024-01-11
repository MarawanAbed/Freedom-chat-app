
import 'package:flutter/material.dart';
import 'package:freedom_chat_app/core/themes/app_colors.dart';

class Themes{
  static ThemeData lightThemeData(BuildContext context) {
    return ThemeData.light().copyWith(
      primaryColor: AppColors.kPrimaryColor,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor:AppColors.kPrimaryColor,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        actionsIconTheme: IconThemeData(color: Colors.white),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.kPrimaryColor,
        unselectedItemColor: AppColors.kUnselectedColor,
        type: BottomNavigationBarType.fixed,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  static ThemeData darkThemeData(BuildContext context) {
    return ThemeData.dark().copyWith(
      primaryColor: AppColors.kContentColorDarkTheme,
      scaffoldBackgroundColor: AppColors.kContentColorDarkTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor:AppColors.kPrimaryColor,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        actionsIconTheme: IconThemeData(color: Colors.white),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.kContentColorDarkTheme,
        selectedItemColor: AppColors.kPrimaryColor,
        elevation: 30,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
