import 'package:get/get.dart';
import 'package:my_portfolio/controllers/portfolio_controller.dart';
import 'package:my_portfolio/data/portfolio_repository.dart';
import 'package:my_portfolio/utils/theme.dart';

class AppBind extends Bindings {
  final PortfolioRepository repository;
  AppBind({required this.repository});

  @override
  void dependencies() {
    if (!Get.isRegistered<PortfolioRepository>()) {
      Get.put<PortfolioRepository>(repository, permanent: true);
    }
    if (!Get.isRegistered<ThemeController>()) {
      Get.put<ThemeController>(ThemeController(), permanent: true);
    }
    if (!Get.isRegistered<PortfolioController>()) {
      Get.put<PortfolioController>(
        PortfolioController(repository: Get.find<PortfolioRepository>()),
        permanent: true,
      );
    }
  }
}
