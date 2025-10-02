import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/models.dart';
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

  final GlobalKey homeKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey educationKey = GlobalKey();
  final GlobalKey certificationsKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  Map<String, GlobalKey> get keys => {
    'Home': homeKey,
    'About': aboutKey,
    'Skills': skillsKey,
    'Experience': experienceKey,
    'Education': educationKey,
    'Certifications': certificationsKey,
    'Projects': projectsKey,
    'Contact': contactKey,
  };
  // navigation to the section
  Future<void> scrollTo(GlobalKey key) async {
    final BuildContext? ctx = key.currentContext;
    if (ctx == null) return;
    await Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeInOutCubic,
      alignment: 0.05,
    );
  }
}
