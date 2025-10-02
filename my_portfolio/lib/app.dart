import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/app/routes.dart';
import 'data/portfolio_repository.dart';

import 'controllers/portfolio_controller.dart';
import 'utils/theme.dart';

class PortfolioApp extends StatelessWidget {
  final PortfolioRepository repository;

  const PortfolioApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      init: ThemeController(),
      global: false,
      builder: (ThemeController themeController) {
        return GetMaterialApp(
          title: 'Flutter Developer Portfolio',
          debugShowCheckedModeBanner: false,
          theme: buildLightTheme(),
          darkTheme: buildDarkTheme(),
          themeMode: themeController.themeMode.value,
          initialRoute: '/',
          getPages: AppPages.pageList,
          initialBinding: BindingsBuilder(() {
            Get.put<PortfolioRepository>(repository, permanent: true);
            Get.put<PortfolioController>(
              PortfolioController(repository: Get.find<PortfolioRepository>()),
              permanent: true,
            );
            if (!Get.isRegistered<ThemeController>()) {
              Get.put<ThemeController>(themeController, permanent: true);
            }
          }),
          // home: PortfolioPage(),
        );
      },
    );
  }
}
