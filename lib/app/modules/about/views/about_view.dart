import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:physio_calc/app/core/themes/texts_theme.dart';
import 'package:physio_calc/app/core/values/strings.dart';

import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Aplikasi'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          const SizedBox(height: 8.0),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tentang Aplikasi', style: TextsTheme.textXlBold)
                    .paddingOnly(bottom: 8.0),
                Text(
                  appDescription,
                  style: TextsTheme.textSm,
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Kontak Developer', style: TextsTheme.textXlBold)
                    .paddingOnly(bottom: 8.0),
                GestureDetector(
                  onTap: () => controller.mailToDeveloper(),
                  child: RichText(
                    text: TextSpan(
                        text: 'Email : ',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: TextsTheme.sizeTextXs),
                        children: [
                          TextSpan(
                            text: 'firhanhardiansyah.dev@gmail.com',
                            style: TextStyle(color: Colors.blue.shade900),
                          )
                        ]),
                  ),
                ),
                const SizedBox(height: 8.0),
                RichText(
                  text: TextSpan(
                      text: 'Phone : ',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: TextsTheme.sizeTextXs),
                      children: const [TextSpan(text: '+62 851 5623 6732')]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
