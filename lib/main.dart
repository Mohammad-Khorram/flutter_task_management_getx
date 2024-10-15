import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_management/config/boilerplate/binding_boilerplate.dart';
import 'package:task_management/config/boilerplate/resource_boilerplate.dart';
import 'package:task_management/config/routing/page.dart';
import 'package:task_management/config/routing/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  runApp(const Sabzineh());
}

class Sabzineh extends StatelessWidget {
  const Sabzineh({super.key});

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
    builder: (context, child) => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Management',
      theme: ThemeConfig.themeData,
      themeMode: ThemeMode.light,
      initialBinding: MainBinding(),
      initialRoute: RouteConfig.home,
      getPages: PageConfig.pages,
    ),
  );
}