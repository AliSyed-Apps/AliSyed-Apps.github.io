import 'package:get/get.dart';
import 'package:my_portfolio/controllers/portfolio_controller.dart';
import 'package:my_portfolio/data/portfolio_repository.dart';

class AppBind extends Bindings {
  @override
  void dependencies() {
    // Get.put<PortfolioRepository>(repository, permanent: true);
    Get.put<PortfolioController>(
      PortfolioController(repository: Get.find<PortfolioRepository>()),
      permanent: true,
    );

    // BindingsBuilder(() {
    //   if (!Get.isRegistered<ThemeController>()) {
    //     Get.put<ThemeController>(themeController, permanent: true);
    //   }
    // });
    // Get.lazyPut<Controller>(() => Controller());
  }
}
