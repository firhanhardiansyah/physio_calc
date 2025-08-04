import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physio_calc/app/modules/splash/controllers/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return Scaffold(
      body: Container(
        color: Get.context?.theme.colorScheme.primary,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon dari assets
              Image.asset(
                'assets/icons/icon-launcher.png',
                width: 120,
                height: 120,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
