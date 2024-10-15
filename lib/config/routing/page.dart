import 'package:get/get.dart';
import 'package:task_management/config/routing/route.dart';
import 'package:task_management/feature/home/presentation/view/home_view.dart';

class PageConfig {
  static List<GetPage> pages = [
    // home
    GetPage(name: RouteConfig.home, page: HomeView.new),
  ];
}
