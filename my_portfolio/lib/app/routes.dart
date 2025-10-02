import 'package:get/get.dart';
import 'package:my_portfolio/app/bindings.dart';
import 'package:my_portfolio/ui/pages/portfolio_page.dart';

class AppPages {
  static List<GetPage<dynamic>> pageList = [
    GetPage(
      name: '/',
      page: () => PortfolioPage(),
      binding: AppBind(),
      popGesture: false,
    ),

    // GetPage(name: '/home', page: () => const HomeView(), transition: t),
  ];

  static Transition t = Transition.cupertino;
  static Transition t2 = Transition.downToUp;
}
