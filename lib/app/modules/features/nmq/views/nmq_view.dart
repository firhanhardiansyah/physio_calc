import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:physio_calc/app/core/themes/texts_theme.dart';
import 'package:physio_calc/app/core/values/strings.dart';
import 'package:physio_calc/app/data/models/form_field_model/form_field_model.dart';
import 'package:physio_calc/app/global_screens/user_form_screen.dart';
import 'package:physio_calc/app/global_widgets/appbar_custom.dart';
import 'package:physio_calc/app/global_widgets/form_builder_custom.dart';
import 'package:physio_calc/app/global_widgets/my_handle_drag.dart';

import '../controllers/nmq_controller.dart';

class NmqView extends GetView<NmqController> {
  const NmqView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(58),
        child: AppBarCustom(
          title: Text(
            '${controller.appBarTitle}',
            maxLines: 2,
            style: TextsTheme.textBase,
          ),
          onSave: () {
            // if (!controller.formKey.currentState!.isValid) {
            //   Get.dialog(
            //     AlertDialog(
            //       title: const Text('Info'),
            //       content: RichText(
            //         text: const TextSpan(
            //           style: TextStyle(color: Colors.black),
            //           children: [
            //             TextSpan(
            //                 text: 'Harap lengkapi formulir terlebih dahulu!'),
            //           ],
            //         ),
            //       ),
            //       actions: [
            //         ElevatedButton(
            //           onPressed: Get.back,
            //           child: const Text('Ok'),
            //         )
            //       ],
            //     ),
            //   );
            //   return;
            // }

            Get.dialog(
              GestureDetector(
                onTap: () {
                  Get.focusScope?.unfocus();
                },
                child: AlertDialog(
                  title: Text(
                    'User Information',
                    style: TextsTheme.textLg,
                  ),
                  content: UserFormScreen(
                    callback: controller.onSavePdf,
                    fields: [
                      FormBuilderTextField(
                        name: 'weight',
                        initialValue: '170',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          label: Text('Berat Badan'),
                        ),
                        validator: FormBuilderValidators.required(
                            errorText: 'Tidak boleh kosong'),
                      ),
                      FormBuilderTextField(
                        name: 'job',
                        initialValue: 'Programmer',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          label: Text('Pekerjaan'),
                        ),
                        validator: FormBuilderValidators.required(
                            errorText: 'Tidak boleh kosong'),
                      ),
                      FormBuilderTextField(
                        name: 'length_of_work',
                        initialValue: '5 Tahun',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          label: Text('Lama Bekerja'),
                        ),
                        validator: FormBuilderValidators.required(
                            errorText: 'Tidak boleh kosong'),
                      ),
                      FormBuilderTextField(
                        name: 'working_time',
                        initialValue: '8 Jam',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          label: Text('Waktu Bekerja'),
                        ),
                        validator: FormBuilderValidators.required(
                            errorText: 'Tidak boleh kosong'),
                      ),
                    ],
                  ),
                ),
              ),
            );
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
                      const TextSpan(text: infoNmq),
                      const TextSpan(text: '\n\n'),
                      TextSpan(
                        text: infoNmqRef,
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
      body: Stack(
        children: [
          GetBuilder(
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
                                flex: 4,
                                child: Text(
                                  '${formField.fieldId - 1} : ${formField.fieldLabel}',
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
                                .toList(growable: false),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(right: 8.0),
                            ),
                            autovalidateMode: controller.autoValidate,
                            validator: FormBuilderValidators.required(
                              errorText: 'Harap dipilih salah satu',
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
              btnSubmitPadding: const EdgeInsets.only(bottom: 90.0),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: .1,
            minChildSize: .1,
            maxChildSize: .9,
            snap: false,
            builder: (context, scrollCtrl) => Container(
              decoration: BoxDecoration(
                color: Get.theme.colorScheme.onPrimary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 1,
                    blurRadius: 5,
                  )
                ],
              ),
              child: SingleChildScrollView(
                controller: scrollCtrl,
                child: Column(
                  children: [
                    const MyDragHandle(),
                    Text(
                      'Body Map',
                      style: TextsTheme.textXlBold,
                    ),
                    const SizedBox(height: 12),
                    Image.asset(
                      'assets/images/body_map.png',
                      height: 516,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
