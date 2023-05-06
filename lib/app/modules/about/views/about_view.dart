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
          const Divider(),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Konsultasi Lebih Lanjut', style: TextsTheme.textXlBold)
                    .paddingOnly(bottom: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Rahma Alfina', style: TextsTheme.textSmBold),
                    const SizedBox(height: 8.0),
                    GestureDetector(
                      onTap: () => controller.mailTo(
                          email: 'j120200032@student.ums.ac.id'),
                      child: RichText(
                        text: TextSpan(
                            text: 'Email : ',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: TextsTheme.sizeTextXs),
                            children: [
                              TextSpan(
                                text: 'j120200032@student.ums.ac.id',
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
                          children: const [
                            TextSpan(text: '+62 812 3802 3491')
                          ]),
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Adnan Faris Naufal', style: TextsTheme.textSmBold),
                    const SizedBox(height: 8.0),
                    GestureDetector(
                      onTap: () => controller.mailTo(email: 'afn778@ums.ac.id'),
                      child: RichText(
                        text: TextSpan(
                            text: 'Email : ',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: TextsTheme.sizeTextXs),
                            children: [
                              TextSpan(
                                text: 'afn778@ums.ac.id',
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
                          children: const [
                            TextSpan(text: '+62 812 2868 6790')
                          ]),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Kontak Developer', style: TextsTheme.textXlBold)
                    .paddingOnly(bottom: 8.0),
                GestureDetector(
                  onTap: () => controller.mailTo(
                      email: 'firhanhardiansyah.dev@gmail.com'),
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
      bottomNavigationBar: SizedBox(
        height: 32.0,
        child: Center(
          child: Column(
            children: [
              GetBuilder(
                init: controller,
                builder: (controller) {
                  return RichText(
                    text: TextSpan(text: '${controller.appName}, Version : ${controller.version}', style: TextsTheme.textXs.copyWith(color: Colors.black87)));
                }
              ),
              RichText(
                text: TextSpan(text: '© Copyright 2023. All Rights Reserved', style: TextsTheme.textXsBold.copyWith(color: Colors.black87))),
            ],
          ),
        ),
      ),
    );
  }
}
