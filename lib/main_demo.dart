// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:physio_calc/app/core/themes/app_theme.dart';

import 'app/routes/app_pages.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_flavor/flutter_flavor.dart';

void main() {
  FlavorConfig(
    name: "DEMO",
    color: Colors.red,
    location: BannerLocation.bottomStart,
    variables: {
      "counter": 5,
      "baseUrl": "https://www.example.com",
    },
  );

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
        systemNavigationBarDividerColor: Colors.black,
      ),
      child: FlavorBanner(
        color: Colors.red,
        location: BannerLocation.topStart,
        child: GetMaterialApp(
          title: "Physio Calc Demo",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          theme: AppTheme.lightThemeData,
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child!,
          ),
          supportedLocales: const [
            Locale('id'),
            Locale('en'),
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
        ),
      ),
    );
  }
}
