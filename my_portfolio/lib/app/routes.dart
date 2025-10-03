import 'package:get/get.dart';
import 'package:my_portfolio/view/portfolio/portfolio_page.dart';

class AppPages {
  static List<GetPage<dynamic>> pageList = [
    GetPage(name: '/', page: () => PortfolioPage(), popGesture: false),

    // GetPage(name: '/home', page: () => const HomeView(), transition: t),
  ];

  static Transition t = Transition.cupertino;
  static Transition t2 = Transition.downToUp;
}
