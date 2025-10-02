import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'data/portfolio_repository.dart';
import 'ui/pages/portfolio_page.dart';
import 'controllers/portfolio_controller.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key, required this.repository});

  final PortfolioRepository repository;

  @override
  Widget build(BuildContext context) {
    final ThemeData baseTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6750A4)),
      useMaterial3: true,
    );

    return GetMaterialApp(
      title: 'Flutter Developer Portfolio',
      debugShowCheckedModeBanner: false,
      theme: baseTheme.copyWith(
        textTheme: baseTheme.textTheme.apply(
          bodyColor: const Color(0xFF1C1B1F),
          displayColor: const Color(0xFF1C1B1F),
        ),
      ),
      initialBinding: BindingsBuilder(() {
        Get.put<PortfolioRepository>(repository, permanent: true);
        Get.put<PortfolioController>(
          PortfolioController(repository: Get.find<PortfolioRepository>()),
          permanent: true,
        );
      }),
      home: const PortfolioPage(),
    );
  }
}
