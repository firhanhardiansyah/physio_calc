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

import '../controllers/mmse_controller.dart';

class MmseView extends GetView<MmseController> {
  const MmseView({Key? key}) : super(key: key);
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
                        const TextSpan(text: infoMmse),
                        const TextSpan(text: '\n\n'),
                        TextSpan(
                          text: infoMmseRef,
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
    
                  List<Widget> subQuestion = [];
    
                  for (var fieldIndex = 0;
                      fieldIndex < question.fields.length;
                      fieldIndex++) {
                    FormFieldModel field = question.fields[fieldIndex];
    
                    subQuestion.add(
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Column(
                          children: [
                            Flex(
                              direction: Axis.horizontal,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 4,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        field.fieldLabel,
                                        style: TextsTheme.textBase,
                                      ),
                                      if (field.fieldImageAssets != null) ...{
                                        Image.asset('${field.fieldImageAssets}')
                                      }
                                    ],
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Score : ',
                                        style: TextsTheme.textSmBold
                                            .copyWith(color: Colors.indigo),
                                      ),
                                      Text(
                                        field.fieldPointValue.toString(),
                                        style: TextsTheme.textSmBold
                                            .copyWith(color: Colors.indigo),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            FormBuilderCheckboxGroup<FormFieldScoreModel>(
                              name: field.fieldName,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(right: 8.0),
                              ),
                              activeColor: Colors.indigo,
                              autovalidateMode: controller.autoValidate,
                              options: field.fieldScores
                                  .map(
                                    (val) => FormBuilderFieldOption(
                                      value: val,
                                      child: Flex(
                                        direction: Axis.horizontal,
                                        children: [
                                          Flexible(
                                            child: Text(val.scoreName),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(growable: false),
                              onChanged: (scores) => controller.onChanged(
                                questionIndex: index,
                                subQuestionIndex: fieldIndex,
                                scores: scores,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
    
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        question.questionName,
                        style: TextsTheme.textXlBold,
                      ),
                      const SizedBox(height: 8.0),
                      Column(children: subQuestion),
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
