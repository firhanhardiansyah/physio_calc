import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:physio_calc/app/core/values/strings.dart';
import 'package:physio_calc/app/data/models/feature/feature_model.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(appName),
          actions: [
            IconButton(
                onPressed: () {
                  Get.dialog(const AlertDialog(
                    title: Text('Tentang Aplikasi'),
                    content: Text(appDescription),
                  ));
                },
                icon: const Icon(Icons.info_outline))
          ],
        ),
        body: ListView.builder(
          itemCount: controller.features.length,
          itemBuilder: (context, index) {
            FeatureModel feature = controller.features[index];
            return Padding(
                padding: EdgeInsets.symmetric(
                    vertical: feature.id == 10 ? 8.0 : 2.0, horizontal: 16.0),
                child: ElevatedButton(
                  onPressed: feature.actived
                      ? () => controller.goToPage(feature)
                      : null,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: feature.id == 10 ? 24.0 : 16.0),
                  ),
                  child: Text(
                    feature.name,
                    textAlign: TextAlign.center,
                  ),
                ));
          },
        ));
  }
}
