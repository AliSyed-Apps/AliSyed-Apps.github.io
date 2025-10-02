import 'package:flutter/material.dart';
import 'app.dart';
import 'data/portfolio_repository.dart';

void main() {
  const PortfolioConfig config = PortfolioConfig(
    ownerName: 'Your Name',
    email: 'you@example.com',
    github: 'github.com/yourhandle',
    linkedin: 'linkedin.com/in/yourhandle',
  );

  final PortfolioRepository repository = InMemoryPortfolioRepository(
    config: config,
  );

  runApp(PortfolioApp(repository: repository));
}
