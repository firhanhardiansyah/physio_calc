import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:physio_calc/app/global_widgets/field_spacer.dart';

import '../controllers/user_identity_controller.dart';

class UserIdentityView extends GetView<UserIdentityController> {
  const UserIdentityView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: FormBuilder(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FormBuilderTextField(
                name: 'user_name',
                decoration: const InputDecoration(
                  label: Text('Nama Lengkap'),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: controller.errorText),
                ]),
                textInputAction: TextInputAction.next,
              ),
              const FieldSpacer(),
              FormBuilderTextField(
                name: 'user_age',
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  label: Text('Usia'),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: controller.errorText),
                  FormBuilderValidators.numeric(),
                  FormBuilderValidators.max(200),
                ]),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                textInputAction: TextInputAction.next,
              ),
              const FieldSpacer(),
              FormBuilderDropdown(
                name: 'user_gender',
                decoration: const InputDecoration(
                  label: Text('Jenis Kelamin'),
                ),
                items: ['Laki - Laki', 'Perempuan']
                    .map((gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
              ),
              const FieldSpacer(),
              FormBuilderDateTimePicker(
                name: 'user_date',
                initialEntryMode: DatePickerEntryMode.calendar,
                initialValue: DateTime.now(),
                decoration: const InputDecoration(
                  label: Text('Tanggal Pemeriksaan'),
                ),
                initialTime: const TimeOfDay(hour: 8, minute: 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
