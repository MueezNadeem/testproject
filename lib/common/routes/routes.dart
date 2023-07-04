import 'package:get/get.dart';
import 'package:testproject/main.dart';

class Routes {
  static String home = "/";

  static String getHomeRoute() {
    return home;
  }

  static List<GetPage> routes = [
    GetPage(
        name: home,
        page: () {
          return const MyApp();
        })
  ];
}
