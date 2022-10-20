import 'package:downloader/homepage_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePageScreens(),
    );
  }
}
