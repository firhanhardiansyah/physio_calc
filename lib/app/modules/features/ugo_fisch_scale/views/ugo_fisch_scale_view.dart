import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:physio_calc/app/core/themes/texts_theme.dart';
import 'package:physio_calc/app/core/values/strings.dart';
import 'package:physio_calc/app/globa_widgets/appbar_custom.dart';
import 'package:physio_calc/app/globa_widgets/field_spacer.dart';

import '../controllers/ugo_fisch_scale_controller.dart';

class UgoFischScaleView extends GetView<UgoFischScaleController> {
  const UgoFischScaleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(58),
          child: AppBarCustom(
            title: controller.appBarTitle,
            onSave: () {
              controller.onSavePdf();
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
                      const TextSpan(text: infoUgoFischScale),
                      const TextSpan(text: '\n\n'),
                      TextSpan(
                          text: infoUgoFischScaleRef,
                          style: TextsTheme.textXxs),
                    ])),
              ));
            },
          ),
        ),
        body: Obx(() => FormBuilder(
            key: controller.formKey,
            autovalidateMode: controller.autoValidate,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.listFields.length,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    final listField = controller.listFields[index];

                    return Column(
                      children: [
                        Flex(
                          direction: Axis.horizontal,
                          children: [
                            Flexible(
                              flex: 3,
                              child: FormBuilderRadioGroup<String>(
                                name: listField.name,
                                decoration:
                                    InputDecoration(labelText: listField.label),
                                onChanged: (value) =>
                                    controller.onChangeField(value, listField, index),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                      errorText: 'Harap dipilih salah satu')
                                ]),
                                options: ['0%', '30%', '70%', '100%']
                                    .map((val) => FormBuilderFieldOption(
                                          value: val,
                                          child: Text(val),
                                        ))
                                    .toList(growable: false),
                                valueTransformer: (value) {
                                  if (value == null) return value;

                                  final splitted = value.split('%');
                                  final result = int.parse(splitted[0]);
                                  return result;
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 28.0,
                            ),
                            Flexible(
                              flex: 1,
                              child: FormBuilderTextField(
                                name: listField.pointName,
                                readOnly: true,
                                initialValue: '-',
                                decoration: const InputDecoration(
                                  labelText: 'Point',
                                ),
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                valueTransformer: (value) {
                                  if (value == null || value == '-') {
                                    return value;
                                  }

                                  final result = int.parse(value);
                                  return result;
                                },
                              ),
                            ),
                          ],
                        ),
                        const FieldSpacer(),
                      ],
                    );
                  },
                ),
                ElevatedButton(
                    onPressed: controller.onSubmit,
                    child: const Text('Result')),
                const FieldSpacer()
              ],
            ))));
  }
}
