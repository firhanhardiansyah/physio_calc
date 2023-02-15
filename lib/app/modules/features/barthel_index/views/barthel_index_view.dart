import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:physio_calc/app/core/themes/texts_theme.dart';
import 'package:physio_calc/app/core/values/strings.dart';
import 'package:physio_calc/app/global_widgets/appbar_custom.dart';

import '../controllers/barthel_index_controller.dart';

class BarthelIndexView extends GetView<BarthelIndexController> {
  const BarthelIndexView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(58),
        child: AppBarCustom(
          title: controller.appBarTitle,
          onSave: () {},
          onReset: () {},
          onInfo: () {
            Get.dialog(AlertDialog(
              title: const Text('Info'),
              content: RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: [
                    const TextSpan(text: infoBarthelIndex),
                    const TextSpan(text: '\n\n'),
                    TextSpan(
                      text: infoBarthelIndexRef,
                      style: TextsTheme.textXxs,
                    ),
                  ],
                ),
              ),
            ));
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: FormBuilderRadioGroup<String>(
                name: 'name',
                options: ['a', 'b']
                    .map(
                      (lang) => FormBuilderFieldOption(
                        value: lang,
                        child: Text(lang),
                      ),
                    )
                    .toList(growable: false),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(42.0),
              ),
              onPressed: () {},
              child: const Text('Result'),
            ),
          ],
        ),
      ),
    );
  }
}
