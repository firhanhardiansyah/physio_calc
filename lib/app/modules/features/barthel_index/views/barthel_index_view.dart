import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:physio_calc/app/core/themes/texts_theme.dart';
import 'package:physio_calc/app/core/utils/helpers/popup_helper.dart';
import 'package:physio_calc/app/core/values/strings.dart';
import 'package:physio_calc/app/data/models/barthel_index/barthel_index_model.dart';
import 'package:physio_calc/app/global_screens/user_form_screen.dart';
import 'package:physio_calc/app/global_widgets/appbar_custom.dart';

import '../controllers/barthel_index_controller.dart';

class BarthelIndexView extends GetView<BarthelIndexController> {
  const BarthelIndexView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: PopupHelper.showExitPopup,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(58),
          child: AppBarCustom(
            title: Text('${controller.appBarTitle}'),
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
        body: GetBuilder(
          init: controller,
          builder: (controller) => FormBuilder(
            key: controller.formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: controller.listFields.length,
                    itemBuilder: (context, index) {
                      final listField = controller.listFields[index];
    
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
                                  flex: 4,
                                  child: Text(
                                    listField.label,
                                    style: TextsTheme.textBaseBold,
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
                                        listField.pointValue,
                                        style: TextsTheme.textSmBold
                                            .copyWith(color: Colors.indigo),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12.0),
                            FormBuilderRadioGroup<BarthelIndexScoreModel>(
                              activeColor: Colors.indigo,
                              name: listField.name,
                              options: listField.score
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
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(right: 8.0),
                              ),
                              autovalidateMode:
                                  controller.autoValidate,
                              // autovalidateMode:
                              //     AutovalidateMode.onUserInteraction,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                  errorText: 'Harap dipilih salah satu',
                                )
                              ]),
                              onChanged: (value) => controller.onChanged(
                                  index: index, value: value),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(42.0),
                    ),
                    onPressed: controller.onSubmit,
                    child: const Text('Result'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
