import 'package:flutter/material.dart';
import 'package:flutter_shared_pref/data/local/app_shared_pref.dart';
import 'package:get/get.dart';

import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPref.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute:
          (AppSharedPref.isUserLoggedIn) ? Routes.cart : AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
