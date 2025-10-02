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
          'Mobile Developer with 3+ years of experience building high-quality cross-platform applications using Flutter. Successfully published 5+ apps to the App Store and Google Play, collectively exceeding 50,000 users. My main focus is on mobile applications.',
      skills: <Skill>[
        const Skill(name: 'Flutter (Dart)', proficiency: 0.95),
        const Skill(name: 'Node.js', proficiency: 0.8),
        const Skill(name: 'PHP (Laravel)', proficiency: 0.7),
        const Skill(name: 'Python', proficiency: 0.8),
        const Skill(name: 'Socket.io', proficiency: 0.75),
        const Skill(name: 'REST APIs', proficiency: 0.85),
        const Skill(name: 'Communication', proficiency: 0.9),
        const Skill(name: 'Firebase Auth', proficiency: 0.8),
        const Skill(name: 'Firebase Services', proficiency: 0.8),
      ],
      highlights: const <String>[
        'Clean Architecture',
        'Stacked',
        'GetX',
        'Provider',
        'Bloc',
        'Animations',
        'REST/GraphQL',
        'Firebase',
        'CI/CD',
      ],
      projects: const <Project>[
        Project(
          title: 'Shop - Go',
          description:
              'Comprehensive Flutter app integrating courier service websites to provide secure, convenient shipping. Laravel PHP backend handles data management and auth. Includes in-app web view, real-time tracking, secure payments, and user profiles for a seamless courier experience.',
          link: null,
        ),
        Project(
          title: 'Christian Business Finder',
          description:
              'Flutter app connecting users with businesses. Implemented secure PHP (Laravel) backend to protect data and restrict unauthorized access. Features detailed business info, user registration, and church-centric discovery for a seamless, privacy-focused platform.',
          link: null,
        ),
        Project(
          title: 'Black Game',
          description:
              'Flutter-based 2D word guessing game inspired by Wordle Blitz with complex functionality. Real-time websockets enable dynamic, fast-paced challenges. Scoring rewards speed and accuracy, with bonuses for swift corrections. Elegant design plus advanced features deliver a competitive experience.',
          link: null,
        ),
        Project(
          title: 'ShoVerse',
          description:
              'Innovative Flutter app for virtual shoe fitting using TensorFlow Lite for foot recognition and Firebase backend. Provides personalized fitting, easy ordering, and admin panel for managing and tracking processed product requests from fitting to delivery.',
          link: null,
        ),
        Project(
          title: 'Music Player',
          description:
              'Sleek Flutter music app syncing phone audio (excluding calls/WhatsApp voice). Standout: download YouTube video as MP3 and integrate into the app. Users can edit track details for a personalized library and enjoy a focused listening experience.',
          link: null,
        ),
        Project(
          title: 'Tracking App',
          description:
              'Flutter app with advanced OCR and seamless background tracking for supplier management. Digitizes supplier documents and monitors locations in real time, boosting operational efficiency with actionable insights and robust features.',
          link: null,
        ),
        Project(
          title: 'Customer Relationship Management (CRM) App',
          description:
              'Flutter app to streamline customer interactions: manage contacts, track sales, and analyze data in real time. Improves communication and growth with a user-friendly interface and seamless cross-device experience.',
          link: null,
        ),
        Project(
          title: 'Quranism',
          description:
              'Comprehensive spiritual companion in Flutter: duas with references, full Quran with multiple reciters, English/Urdu translations, background audio. Includes daily prayer timings with Adhan notifications and dynamic Qibla direction based on user location.',
          link: null,
        ),
        Project(
          title: 'TempDify',
          description:
              'IoT-based monitoring system using Flutter and Firebase to track temperature and humidity for valuable equipment/storage. Real-time visualizations, historical analysis, and alerting create an effective, user-friendly environmental monitoring solution.',
          link: null,
        ),
        Project(
          title: 'Khusa Mart',
          description:
              'Desktop application for streamlined sales management. Features sales receipt generation, local database integration, backup functionality, responsive UI, and comprehensive sales history for efficient tracking and data security.',
          link: null,
        ),
        Project(
          title: 'InTaker',
          description:
              'Flutter hydration reminder app with personalized goals, flexible reminders, and engaging visualizations. Gamification elements motivate consistent water intake and deliver a positive user experience.',
          link: null,
        ),
      ],
      experiences: <Experience>[
        Experience(
          company: 'RizV Tech Pvt. Ltd.',
          locationType: 'On-site & Remote',
          period: 'Mar 2022 – Present',
          roles: const <Role>[
            Role(
              title: 'Flutter Developer – Remote',
              period: 'Mar 2022 – Aug 2023',
              bullets: <String>[
                'Developed and deployed mobile applications on both iOS and Android platforms.',
                'Implementation of deep-linking.',
                'Worked with architectures including MVVM, MVP, and MVC.',
                'Implemented scalable state management solutions for complex applications.',
                'Integrated Firebase services: authentication, Firestore, Cloud Functions, push notifications.',
                'Managed user authentication and authorization securely.',
                'Proficient in using Git for version control.',
              ],
            ),
            Role(
              title: 'Flutter Developer – On-site',
              period: 'Aug 2023 – Present',
              bullets: <String>[
                'Worked with Node.js and Socket.io.',
                'Proficiency in consuming RESTful APIs.',
                'Built backends using PHP (Laravel) and created RESTful APIs.',
                'Implemented payment gateways: PayPal, Stripe, Google Pay, and Apple Pay.',
                'Used multiple threads for different operations where appropriate.',
              ],
            ),
          ],
        ),
      ],
      education: const <Education>[
        Education(
          institution: 'Muhammad Ali Jinnah University',
          degree: 'Bachelors in Computer Science',
          period: '2019 - 2023',
        ),
      ],
      certifications: const <Certification>[
        Certification(
          title: 'Graphic Designing Workshop',
          issuer: 'ACM - MAJU',
          period: 'Oct - 2022',
        ),
        Certification(
          title: 'Flutter Workshop',
          issuer: 'ACM - MAJU',
          period: 'Mar - 2022',
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
