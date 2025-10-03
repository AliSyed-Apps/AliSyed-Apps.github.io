import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/app/routes.dart';
import 'package:my_portfolio/app/bindings.dart';
import 'data/portfolio_repository.dart';

import 'utils/theme.dart';

class PortfolioApp extends StatelessWidget {
  final PortfolioRepository repository;

  const PortfolioApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<ThemeController>()) {
      Get.put<ThemeController>(ThemeController(), permanent: true);
    }
    return Obx(() {
      final ThemeMode mode = Get.find<ThemeController>().themeMode.value;
      return GetMaterialApp(
        title: 'Flutter Developer Portfolio',
        debugShowCheckedModeBanner: false,
        theme: buildLightTheme(),
        darkTheme: buildDarkTheme(),
        themeMode: mode,
        initialRoute: '/',
        getPages: AppPages.pageList,
        initialBinding: AppBind(repository: repository),
        // home: PortfolioPage(),
      );
    });
  }
}
