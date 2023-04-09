import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:physio_calc/app/data/models/form_field_model/form_field_model.dart';

abstract class QuestionnaireController {
  void onSavePdf(GlobalKey<FormBuilderState> callback) async {}
  void onReset() {}
  void onChanged({required int index, FormFieldScoreModel? value}) async {}
  void onSubmit(GlobalKey<FormBuilderState> callback) {}
  void finalResult() {}
}

abstract class QuestionnairesController {
  void onSavePdf(GlobalKey<FormBuilderState> callback) async {}
  void onReset() {}
  void onChanged({
    required int questionIndex,
    required int subQuestionIndex,
    FormFieldScoreModel? score,
  }) async {}
  void onSubmit(GlobalKey<FormBuilderState> callback) {}
  void finalResult() {}
}
