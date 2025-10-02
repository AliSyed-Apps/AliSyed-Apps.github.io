import 'package:get/get.dart';
import '../domain/models.dart';
import '../data/portfolio_repository.dart';

class PortfolioController extends GetxController {
  PortfolioController({required this.repository});

  final PortfolioRepository repository;

  late final PortfolioData data;

  @override
  void onInit() {
    super.onInit();
    data = repository.getPortfolio();
  }
}
