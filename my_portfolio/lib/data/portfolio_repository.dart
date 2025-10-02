import '../domain/models.dart';

abstract class PortfolioRepository {
  PortfolioData getPortfolio();
}

class InMemoryPortfolioRepository implements PortfolioRepository {
  InMemoryPortfolioRepository({required this.config});

  final PortfolioConfig config;

  @override
  PortfolioData getPortfolio() {
    return PortfolioData(
      ownerName: config.ownerName,
      title: 'Flutter Developer',
      summary:
          'I build high-quality cross-platform apps with Flutter. I\'m passionate about beautiful UIs, clean architecture, and pixel-perfect interactions.',
      skills: <Skill>[
        const Skill(name: 'Flutter', proficiency: 0.95),
        const Skill(name: 'Dart', proficiency: 0.9),
        const Skill(name: 'State Management', proficiency: 0.9),
        const Skill(name: 'Testing', proficiency: 0.8),
        const Skill(name: 'Backend/REST', proficiency: 0.75),
      ],
      highlights: const <String>[
        'Clean Architecture',
        'Bloc/Provider/Riverpod',
        'Animations',
        'REST/GraphQL',
        'Firebase',
        'CI/CD',
      ],
      projects: const <Project>[
        Project(
          title: 'Finance Tracker',
          description:
              'Cross-platform budget app with charts, sync, and offline-first architecture.',
          link: null,
        ),
        Project(
          title: 'Fitness Coach',
          description:
              'Workout planner with animations, timers, and cloud backup.',
          link: null,
        ),
        Project(
          title: 'E-Commerce Demo',
          description:
              'Modern store UI, product catalog, cart, checkout, and Firebase backend.',
          link: null,
        ),
      ],
      contacts: Contacts(
        email: config.email,
        github: config.github,
        linkedin: config.linkedin,
      ),
    );
  }
}

class PortfolioConfig {
  const PortfolioConfig({
    required this.ownerName,
    required this.email,
    required this.github,
    required this.linkedin,
  });

  final String ownerName;
  final String email;
  final String github;
  final String linkedin;
}
