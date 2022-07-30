import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movietest/presentation/controllers/splash/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.start();
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Image(
            image: AssetImage("assets/images/tv.png"),
          ),
        ),
      ),
    );
  }
}
