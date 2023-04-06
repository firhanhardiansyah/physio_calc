import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:physio_calc/app/data/models/form_field_model/form_field_model.dart';

abstract class QuestionnaireController {
  void onSavePdf(GlobalKey<FormBuilderState> callback) {}
  void onReset() {}
  void onChanged({required int index, FormFieldScoreModel? value}) {}
  void onSubmit(GlobalKey<FormBuilderState> callback) {}
  void finalResult() {}
}
