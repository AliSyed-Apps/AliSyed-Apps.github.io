import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'data/portfolio_repository.dart';
import 'ui/pages/portfolio_page.dart';
import 'controllers/portfolio_controller.dart';
import 'utils/theme.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key, required this.repository});

  final PortfolioRepository repository;

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
          home: const PortfolioPage(),
        );
      },
    );
  }
}
