import 'package:downloader/homepage_screen.dart';
import 'package:downloader/view/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constant/app_theme.dart';
import 'constant/init_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ThemeData().colorScheme.copyWith(primary: AppTheme.appPrimaryColor),
        primaryColor: AppTheme.appPrimaryColor,
      ),
      home: const HomePageScreen(),
    );
  }
}
