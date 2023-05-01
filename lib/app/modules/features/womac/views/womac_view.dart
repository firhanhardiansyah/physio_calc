import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:physio_calc/app/core/themes/texts_theme.dart';
import 'package:physio_calc/app/core/utils/helpers/popup_helper.dart';
import 'package:physio_calc/app/core/values/strings.dart';
import 'package:physio_calc/app/data/models/form_field_model/form_field_model.dart';
import 'package:physio_calc/app/global_screens/user_form_screen.dart';
import 'package:physio_calc/app/global_widgets/appbar_custom.dart';
import 'package:physio_calc/app/global_widgets/form_builder_custom.dart';

import '../controllers/womac_controller.dart';

class WomacView extends GetView<WomacController> {
  const WomacView({Key? key}) : super(key: key);
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
              style: TextsTheme.textSm,
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
                        const TextSpan(text: infoWomac),
                        const TextSpan(text: '\n\n'),
                        TextSpan(
                          text: infoWomacRef,
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
                itemCount: controller.questions.length,
                itemBuilder: (context, index) {
                  final question = controller.questions[index];
    
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        question.questionName,
                        style: TextsTheme.textBaseBold,
                      ),
                      const SizedBox(height: 8.0),
                      Column(
                          children: question.fields.asMap().entries.map((entry) {
                        int subIndex = entry.key;
                        FormFieldModel field = entry.value;
    
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Column(
                            children: [
                              Flex(
                                direction: Axis.horizontal,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${subIndex + 1} - ${field.fieldLabel}',
                                          style: TextsTheme.textSm,
                                        ),
                                        if (field.fieldImageAssets != null) ...{
                                          Image.asset('${field.fieldImageAssets}')
                                        }
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    flex: 0,
                                    child: Text(
                                      'Score : ${field.fieldPointValue.toString()}',
                                      style: TextsTheme.textSmBold
                                          .copyWith(color: Colors.indigo),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8.0),
                              FormBuilderRadioGroup<FormFieldScoreModel>(
                                name: field.fieldName,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.only(right: 8.0),
                                ),
                                activeColor: Colors.indigo,
                                autovalidateMode: controller.autoValidate,
                                validator: FormBuilderValidators.required(
                                  errorText: 'Harap dipilih salah satu',
                                ),
                                options: field.fieldScores
                                    .map(
                                      (val) => FormBuilderFieldOption(
                                        value: val,
                                        child: Text(val.scoreName),
                                      ),
                                    )
                                    .toList(growable: false),
                                onChanged: (score) => controller.onChanged(
                                  questionIndex: index,
                                  subQuestionIndex: subIndex,
                                  score: score,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList()),
                      const Divider(thickness: .2, height: 0),
                      const SizedBox(height: 8.0),
                    ],
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
