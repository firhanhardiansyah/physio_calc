import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';
import 'package:physio_calc/app/core/themes/texts_theme.dart';
import 'package:physio_calc/app/core/utils/helpers/popup_helper.dart';
import 'package:physio_calc/app/core/values/strings.dart';
import 'package:physio_calc/app/data/models/form_field_model/form_field_model.dart';
import 'package:physio_calc/app/global_screens/user_form_screen.dart';
import 'package:physio_calc/app/global_widgets/appbar_custom.dart';
import 'package:physio_calc/app/global_widgets/form_builder_custom.dart';

import '../controllers/odi_controller.dart';

class OdiView extends GetView<OdiController> {
  const OdiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: PopupHelper.showExitPopup,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(58),
          child: AppBarCustom(
            title: Text(
              '${controller.appBarTitle}',
              maxLines: 2,
              style: TextsTheme.textBase,
            ),
            onSave: () {
              if (controller.formKey.currentState?.isValid == false) {
                Get.dialog(
                  AlertDialog(
                    title: const Text('Info'),
                    content: RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                              text: 'Harap lengkapi formulir terlebih dahulu!'),
                        ],
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: Get.back,
                        child: const Text('Ok'),
                      )
                    ],
                  ),
                );
                return;
              }
    
              Get.dialog(AlertDialog(
                title: Text(
                  'User Information',
                  style: TextsTheme.textLg,
                ),
                content: UserFormScreen(callback: controller.onSavePdf),
              ));
            },
            onReset: () {
              controller.onReset();
            },
            onInfo: () {
              Get.dialog(AlertDialog(
                title: const Text('Info'),
                content: SingleChildScrollView(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black),
                      children: [
                        const TextSpan(text: infoOdi),
                        const TextSpan(text: '\n\n'),
                        TextSpan(
                          text: infoOdiRef,
                          style: TextsTheme.textXxs,
                        ),
                      ],
                    ),
                  ),
                ),
              ));
            },
          ),
        ),
        body: GetBuilder(
          init: controller,
          builder: (controller) => FormBuilderCustom(
            formKey: controller.formKey,
            fields: [
              ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: controller.formFieldsModel.length,
                itemBuilder: (context, index) {
                  final formField = controller.formFieldsModel[index];
    
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Column(
                      children: [
                        Flex(
                          direction: Axis.horizontal,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 3,
                              child: Text(
                                '${formField.fieldId} - ${formField.fieldLabel}',
                                style: TextsTheme.textBaseBold,
                              ),
                            ),
                            Flexible(
                              flex: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Score : ',
                                    style: TextsTheme.textSmBold
                                        .copyWith(color: Colors.indigo),
                                  ),
                                  Text(
                                    formField.fieldPointValue,
                                    style: TextsTheme.textSmBold
                                        .copyWith(color: Colors.indigo),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12.0),
                        FormBuilderRadioGroup<FormFieldScoreModel>(
                          activeColor: Colors.indigo,
                          name: formField.fieldName,
                          orientation: OptionsOrientation.vertical,
                          options: formField.fieldScores
                              .map(
                                (val) => FormBuilderFieldOption(
                                  value: val,
                                  child: Text(val.scoreName),
                                ),
                              )
                              .toList(),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(right: 8.0),
                          ),
                          onChanged: (value) => controller.onChanged(
                            index: index,
                            value: value,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
            onSubmit: controller.onSubmit,
            textSubmit: 'Result',
          ),
        ),
      ),
    );
  }
}
