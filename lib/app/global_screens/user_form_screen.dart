// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:physio_calc/app/core/utils/helpers/datetime_helper.dart';
import 'package:physio_calc/app/global_widgets/field_spacer.dart';

import 'package:intl/intl.dart';

class UserFormScreen extends StatelessWidget {
  const UserFormScreen({
    super.key,
    required this.callback,
  });

  final String errorText = 'Tidak boleh kosong';
  final Function(GlobalKey<FormBuilderState>) callback;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: FormBuilder(
          key: formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'fullname',
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  label: Text('Nama Lengkap'),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: errorText),
                ]),
                textInputAction: TextInputAction.next,
                initialValue: 'John Doe',
              ),
              const FieldSpacer(),
              FormBuilderTextField(
                name: 'age',
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  label: Text('Usia'),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: errorText),
                  FormBuilderValidators.numeric(),
                  FormBuilderValidators.max(200),
                ]),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                textInputAction: TextInputAction.next,
                initialValue: '23',
              ),
              const FieldSpacer(),
              FormBuilderDropdown(
                name: 'gender',
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  label: Text('Jenis Kelamin'),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: errorText),
                ]),
                items: ['Laki - Laki', 'Perempuan']
                    .map((gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
                initialValue: 'Laki - Laki',
              ),
              const FieldSpacer(),
              FormBuilderDateTimePicker(
                name: 'examination_date',
                autovalidateMode: AutovalidateMode.onUserInteraction,
                initialEntryMode: DatePickerEntryMode.calendarOnly,
                initialValue: DateTime.now(),
                inputType: InputType.both,
                decoration:
                    const InputDecoration(label: Text('Tanggal Pemeriksaan')),
                locale: const Locale('id'),
                format: DateFormat('dd MMMM yyyy, HH:mm', 'id'),
                valueTransformer: (value) => DateTimeHelper.formattedDateTime(
                    value, 'dd MMMM yyyy, HH:mm'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: errorText),
                ]),
              ),
              const FieldSpacer(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState?.saveAndValidate() ?? false) {
                    callback(formKey);
                  }
                },
                child: const Text('Save'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
