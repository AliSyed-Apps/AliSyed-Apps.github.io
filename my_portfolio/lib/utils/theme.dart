import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  final Rx<ThemeMode> themeMode = ThemeMode.system.obs;

  @override
  void onInit() {
    themeMode.value = ThemeMode.dark;
    super.onInit();
  }

  void toggleTheme() {
    if (themeMode.value == ThemeMode.dark) {
      themeMode.value = ThemeMode.light;
    } else {
      themeMode.value = ThemeMode.dark;
    }
    update();
  }
}

ThemeData buildLightTheme() {
  final ThemeData base = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6750A4)),
    useMaterial3: true,
    brightness: Brightness.light,
  );
  return base.copyWith(
    textTheme: base.textTheme.apply(
      bodyColor: const Color(0xFF1C1B1F),
      displayColor: const Color(0xFF1C1B1F),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.white)),
    ),
    scaffoldBackgroundColor: const Color(0xFFF7F7FB),
    cardTheme: CardThemeData(color: Color(0xFF6750A4).withAlpha(23)),
    dividerTheme: DividerThemeData(color: Colors.black12),
    highlightColor: Colors.black45,
  );
}

ThemeData buildDarkTheme() {
  final ThemeData base = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF6750A4),
      brightness: Brightness.dark,
    ),

    useMaterial3: true,
    brightness: Brightness.dark,
  );

  return base.copyWith(
    textTheme: base.textTheme.apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),

    scaffoldBackgroundColor: const Color(0xFF121218),
    cardTheme: CardThemeData(color: Color(0xFF6750A4).withAlpha(23)),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.white10),
      ),
    ),
    dividerTheme: DividerThemeData(color: Colors.white12),
    highlightColor: Colors.white,
  );
}
