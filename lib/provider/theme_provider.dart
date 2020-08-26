import 'dart:ui';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/config/appcolors.dart';
import 'package:app/config/styles.dart';
import 'package:app/config/constants.dart';


class ThemeProvider extends ChangeNotifier {

  static const Map<ThemeMode, String> themes = {
    ThemeMode.dark: 'Dark', ThemeMode.light : 'Light', ThemeMode.system : 'System'
  };

  void syncTheme() {
    String theme = SpUtil.getString(Constants.theme);
    if (theme.isNotEmpty && theme != themes[ThemeMode.system]) {
      notifyListeners();
    }
  }

  void setTheme(ThemeMode themeMode) {
    SpUtil.putString(Constants.theme, themes[themeMode]);
    notifyListeners();
  }

  ThemeMode getThemeMode(){
    String theme = SpUtil.getString(Constants.theme);
    switch(theme) {
      case 'Dark':
        return ThemeMode.dark;
      case 'Light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  getTheme({bool isDarkMode: false}) {
    return ThemeData(
      errorColor: isDarkMode ? AppColors.dark_red : AppColors.red,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      primaryColor: isDarkMode ? AppColors.dark_app_main : AppColors.app_main,
      accentColor: isDarkMode ? AppColors.dark_app_main : AppColors.app_main,
      // Tab指示器颜色
      indicatorColor: isDarkMode ? AppColors.dark_app_main : AppColors.app_main,
      // 页面背景色
      scaffoldBackgroundColor: isDarkMode ? AppColors.dark_bg_color : Colors.white,
      // 主要用于Material背景色
      canvasColor: isDarkMode ? AppColors.dark_material_bg : Colors.white,
      // 文字选择色（输入框复制粘贴菜单）
      textSelectionColor: AppColors.app_main.withAlpha(70),
      textSelectionHandleColor: AppColors.app_main,
      textTheme: TextTheme(
        // TextField输入文字颜色
        subhead: isDarkMode ? TextStyles.textDark : TextStyles.text,
        // Text文字样式
        body1: isDarkMode ? TextStyles.textDark : TextStyles.text,
        subtitle: isDarkMode ? TextStyles.textDarkGray12 : TextStyles.textGray12,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: isDarkMode ? TextStyles.textHint14 : TextStyles.textDarkGray14,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        color: isDarkMode ? AppColors.dark_bg_color : Colors.white,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
      ),
      dividerTheme: DividerThemeData(
        color: isDarkMode ? AppColors.dark_line : AppColors.line,
        space: 0.6,
        thickness: 0.6
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
      )
    );
  }

}