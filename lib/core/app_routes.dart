import 'package:get/get.dart';
import 'package:haul_way/presentation/bottom_bar/bottom_bar.dart';
import 'package:haul_way/presentation/splash/splash.dart';

class AppRoutes {
  static const initialR = '/';
  static const bottomBar = '/bottom_bar';

  static List<GetPage> routes = [
    GetPage(
      name: bottomBar,
      page: () => const AppBottomBar(),
      transition: Transition.fade,
      transitionDuration: 700.milliseconds,
    ),
    GetPage(
      name: initialR,
      page: () => const Splash(),
      transition: Transition.fade,
    ),
  ];
}
