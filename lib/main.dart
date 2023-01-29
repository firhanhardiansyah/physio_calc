import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:physio_calc/app/core/themes/app_theme.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarDividerColor: Colors.black),
      child: GetMaterialApp(
        title: "Physio Calc",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: AppTheme.lightThemeData,
      ),
    );
  }
}
