import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/img.dart';
import 'app.dart';
import 'data/portfolio_repository.dart';

void main() {
  PortfolioConfig config = PortfolioConfig(
    ownerName: 'Syed Ali Mehdi',
    image: AppImages.p2,
    email: 'syedalimehdi76@gmail.com',
    github: 'github.com/AliSyed-Apps',
    linkedin: 'linkedin.com/in/ali-syed-aa6990180',
    phone: '+923424425973',
  );

  final PortfolioRepository repository = InMemoryPortfolioRepository(
    config: config,
  );

  runApp(PortfolioApp(repository: repository));
}
