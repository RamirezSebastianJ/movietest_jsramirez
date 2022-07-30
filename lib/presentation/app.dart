import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movietest/app/config/app_routes.dart';
import 'package:movietest/presentation/controllers/splash/splash_binding.dart';

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      getPages: appRoutes(),
      initialBinding: SplashBinding(),
    );
  }
}
