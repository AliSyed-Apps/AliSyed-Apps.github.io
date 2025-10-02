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
      themeMode.value = ThemeMode.system;
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
    scaffoldBackgroundColor: const Color(0xFFF7F7FB),
    cardColor: Colors.white,
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
    cardColor: const Color(0xFF1A1B22),
  );
}
