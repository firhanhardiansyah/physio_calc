import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:physio_calc/app/core/themes/texts_theme.dart';
import 'package:physio_calc/app/core/values/questions/mmse_question.dart';
import 'package:physio_calc/app/core/values/strings.dart';
import 'package:physio_calc/app/data/models/form_field_model/form_field_model.dart';

import 'package:flutter/services.dart';

import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class MmseController extends GetxController {
  final appBarTitle = ''.obs;
  final formKey = GlobalKey<FormBuilderState>();

  List<QuestionModel> questions = [];

  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  int totalScore = 0;
  String gradeLevel = '-';

  @override
  void onInit() {
    super.onInit();

    appBarTitle(Get.parameters['name']);
    questions.addAll(QuestionModel.listFromJson(mmseQuestions));
  }

  void onSavePdf(GlobalKey<FormBuilderState> userInformationFormKey) async {
    _finalResult();

    final Map<String, dynamic>? userInformation =
        userInformationFormKey.currentState?.value;
    final pdf = pw.Document();

    Uint8List headerImage =
        (await rootBundle.load('assets/images/physio_calc.png'))
            .buffer
            .asUint8List();

    pdf.addPage(
      pw.Page(
        margin: pw.EdgeInsets.zero,
        build: (context) {
          List<pw.TableRow> tr = [];

          tr.add(
            pw.TableRow(
              children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 12.0),
                  child: pw.Text(
                    'Name',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                ),
                pw.Container(
                  child: pw.Center(
                      child: pw.Text(
                    'Score',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  )),
                ),
              ],
            ),
          );

          for (QuestionModel question in questions) {
            tr.add(
              pw.TableRow(
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12.0),
                    child: pw.Text(question.questionName),
                  ),
                  pw.Container(
                    child: pw.Center(
                        child: pw.Text(question.questionPoint.toString())),
                  ),
                ],
              ),
            );
          }

          tr.add(
            pw.TableRow(
              children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 12.0),
                  child: pw.Text(
                    'TOTAL',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                ),
                pw.Container(
                  child: pw.Center(
                      child: pw.Text(
                    '$totalScore',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  )),
                ),
              ],
            ),
          );

          tr.add(
            pw.TableRow(
              children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 12.0),
                  child: pw.Text(
                    'Tingkat Kesadaran',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                ),
                pw.Container(
                  child: pw.Center(
                    child: pw.Padding(
                      padding: const pw.EdgeInsets.all(8.0),
                      child: pw.Text(
                        gradeLevel,
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );

          return pw.Stack(
            children: [
              pw.Positioned(
                top: 16.0,
                right: 42.0,
                child: pw.Image(
                  pw.MemoryImage(headerImage),
                  width: 120.0,
                ),
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.all(42.0),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      mmse,
                      style: pw.TextStyle(
                        fontSize: TextsTheme.sizeTextLg,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.SizedBox(height: 18.0),
                    pw.Table(
                        border: pw.TableBorder.symmetric(
                            outside: const pw.BorderSide(
                                width: 1, color: PdfColors.black)),
                        columnWidths: const {
                          0: pw.FixedColumnWidth(108),
                          1: pw.FixedColumnWidth(20),
                          2: pw.FlexColumnWidth(),
                          3: pw.FixedColumnWidth(156),
                        },
                        defaultVerticalAlignment:
                            pw.TableCellVerticalAlignment.middle,
                        children: [
                          pw.TableRow(children: [
                            pw.Padding(
                              padding: const pw.EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 12.0),
                              child: pw.Text('Nama'),
                            ),
                            pw.Text(':'),
                            pw.Text('${userInformation?['fullname']}'),
                            pw.Center(
                              child: pw.Text('Tanggal Pemeriksaan'),
                            ),
                          ]),
                          pw.TableRow(
                            children: [
                              pw.Padding(
                                padding: const pw.EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 12.0),
                                child: pw.Text('Usia'),
                              ),
                              pw.Text(':'),
                              pw.Text('${userInformation?['age']}'),
                              pw.Center(
                                child: pw.Text(
                                    '${userInformation?['examination_date']}'),
                              ),
                            ],
                          ),
                          pw.TableRow(children: [
                            pw.Padding(
                              padding: const pw.EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 12.0),
                              child: pw.Text('Jenis Kelamin'),
                            ),
                            pw.Text(':'),
                            pw.Text('${userInformation?['gender']}'),
                            pw.Container(),
                          ]),
                        ]),
                    pw.SizedBox(height: 20.0),
                    pw.Table(
                      border: pw.TableBorder.all(),
                      columnWidths: const {
                        0: pw.FlexColumnWidth(),
                        1: pw.FixedColumnWidth(196),
                      },
                      defaultVerticalAlignment:
                          pw.TableCellVerticalAlignment.middle,
                      children: tr,
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );

    Uint8List bytes = await pdf.save();

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/Result $mmse.pdf');

    await file.writeAsBytes(bytes);
    await OpenFile.open(file.path);
    Get.back();
  }

  void onReset() {
    formKey.currentState!.reset();
  }

  void onChanged({
    required int questionIndex,
    required int subQuestionIndex,
    List<FormFieldScoreModel>? scores,
  }) {
    formKey.currentState?.save();

    int totalQuestionScore = 0;
    int totalSubQuestionScore = 0;

    if (scores != null) {
      for (FormFieldScoreModel score in scores) {
        totalSubQuestionScore += score.scoreValue;
      }
    }

    List<FormFieldModel> subQuestions =
        questions[questionIndex].fields.toList();

    subQuestions[subQuestionIndex] = subQuestions[subQuestionIndex]
        .copyWith(fieldPointValue: totalSubQuestionScore);

    questions[questionIndex] =
        questions[questionIndex].copyWith(fields: subQuestions);

    List<FormFieldModel> fields = questions[questionIndex].fields;

    for (FormFieldModel field in fields) {
      totalQuestionScore += field.fieldPointValue as int;
    }

    questions[questionIndex] =
        questions[questionIndex].copyWith(questionPoint: totalQuestionScore);
    update();
  }

  void onSubmit(GlobalKey<FormBuilderState> callback) {
    _finalResult();

    Get.dialog(
      AlertDialog(
        title: const Text('Result'),
        content: RichText(
          text: TextSpan(
            style: const TextStyle(color: Colors.black),
            children: [
              TextSpan(text: 'Score : $totalScore'),
              const TextSpan(text: '\n\n'),
              TextSpan(text: 'Interpretasi : $gradeLevel'),
            ],
          ),
        ),
        actions: [ElevatedButton(onPressed: Get.back, child: const Text('Ok'))],
      ),
    );
  }

  void _finalResult() {
    int totalScore = 0;
    String gradeLevel = '-';

    for (QuestionModel question in questions) {
      totalScore += question.questionPoint;
    }

    if (totalScore >= 0 && totalScore <= 17) {
      gradeLevel = 'Severe cognitive impairment';
    }

    if (totalScore >= 18 && totalScore <= 23) {
      gradeLevel = 'Mild cognitive impairment';
    }

    if (totalScore >= 24 && totalScore <= 30) {
      gradeLevel = 'No cognitive impairment';
    }

    this.totalScore = totalScore;
    this.gradeLevel = gradeLevel;
  }
}
