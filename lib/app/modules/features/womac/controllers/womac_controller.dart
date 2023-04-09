import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:physio_calc/app/core/themes/texts_theme.dart';
import 'package:physio_calc/app/core/utils/abstracts/questionnaire_controller.dart';
import 'package:physio_calc/app/core/values/questions/womac_question.dart';
import 'package:physio_calc/app/core/values/strings.dart';
import 'package:physio_calc/app/data/models/form_field_model/form_field_model.dart';

import 'package:flutter/services.dart';

import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class WomacController extends GetxController
    implements QuestionnairesController {
  final appBarTitle = ''.obs;
  final formKey = GlobalKey<FormBuilderState>();

  List<QuestionModel> questions = [];

  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  int totalScore = 0;
  String interpretation = '-';

  @override
  void onInit() {
    super.onInit();

    appBarTitle(Get.parameters['name']);
    questions.addAll(QuestionModel.listFromJson(womacQuestions));
  }

  @override
  void finalResult() {
    int totalScore = 0;
    String interpretation = '-';

    for (QuestionModel question in questions) {
      totalScore += question.questionPoint;
    }

    if (totalScore >= 0 && totalScore <= 24) {
      interpretation = 'Mild';
    }

    if (totalScore >= 25 && totalScore <= 48) {
      interpretation = 'Moderate';
    }

    if (totalScore >= 49 && totalScore <= 72) {
      interpretation = 'Severe';
    }

    if (totalScore >= 73 && totalScore <= 96) {
      interpretation = 'Very Severe';
    }

    this.totalScore = totalScore;
    this.interpretation = interpretation;
  }

  @override
  void onChanged({
    required int questionIndex,
    required int subQuestionIndex,
    FormFieldScoreModel? score,
  }) async {
    formKey.currentState?.save();
    int totalQuestionScore = 0;

    List<FormFieldModel> subQuestions =
        questions[questionIndex].fields.toList();

    subQuestions[subQuestionIndex] = subQuestions[subQuestionIndex]
        .copyWith(fieldPointValue: score?.scoreValue);

    questions[questionIndex] =
        questions[questionIndex].copyWith(fields: subQuestions);

    List<FormFieldModel> fields = questions[questionIndex].fields;

    for (FormFieldModel field in fields) {
      if (field.fieldPointValue != '-' && field.fieldPointValue != null) {
        totalQuestionScore += field.fieldPointValue as int;
      }
    }

    questions[questionIndex] =
        questions[questionIndex].copyWith(questionPoint: totalQuestionScore);
    update();
  }

  @override
  void onReset() {
    formKey.currentState!.reset();
    autoValidate = AutovalidateMode.disabled;

    for (var index = 0; index < questions.length; index++) {
      List<FormFieldModel> subQuestions = questions[index].fields.toList();
      for (var subIndex = index; subIndex < subQuestions.length; subIndex++) {
        subQuestions[subIndex] =
            subQuestions[subIndex].copyWith(fieldPointValue: '-');
      }
      questions[index] = questions[index].copyWith(fields: subQuestions);
    }

    update();
  }

  @override
  void onSavePdf(GlobalKey<FormBuilderState> callback) async {
    finalResult();

    final Map<String, dynamic>? userInformation = callback.currentState?.value;

    final pdf = pw.Document();

    Uint8List headerImage =
        (await rootBundle.load('assets/images/physio_calc.png'))
            .buffer
            .asUint8List();

    pdf.addPage(
      pw.MultiPage(
        // margin: pw.EdgeInsets.symmetric(horizontal: 42.0),
        pageFormat: PdfPageFormat.a4,
        header: (context) {
          return pw.Align(
            alignment: pw.Alignment.topRight,
            child: pw.Padding(
              padding: const pw.EdgeInsets.only(bottom: 20.0),
              child: pw.Image(
                alignment: pw.Alignment.topRight,
                pw.MemoryImage(headerImage),
                width: 120.0,
              ),
            ),
          );
        },
        build: (context) {
          return [
            pw.Text(
              nmq,
              style: pw.TextStyle(
                fontSize: TextsTheme.sizeTextLg,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(height: 18.0),

            pw.Container(
              decoration: pw.BoxDecoration(border: pw.Border.all()),
              padding: const pw.EdgeInsets.all(8.0),
              child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Table(columnWidths: {
                      0: const pw.FixedColumnWidth(84.0),
                      1: const pw.FixedColumnWidth(12.0),
                      // 2: const pw.FixedColumnWidth(),
                    }, children: [
                      pw.TableRow(children: [
                        pw.Text('Nama'),
                        pw.Text(':'),
                        pw.Text('${userInformation?['fullname']}'),
                      ]),
                      pw.TableRow(children: [
                        pw.Text('Usia'),
                        pw.Text(':'),
                        pw.Text('${userInformation?['age']}'),
                      ]),
                      pw.TableRow(children: [
                        pw.Text('Jenis Kelamin'),
                        pw.Text(':'),
                        pw.Text('${userInformation?['gender']}'),
                      ]),
                    ]),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Text('Tanggal Pemeriksaan'),
                        pw.Text('${userInformation?['examination_date']}'),
                      ],
                    )
                  ]),
            ),

            pw.SizedBox(height: 20.0),

            pw.Container(
                width: double.infinity, height: 1, color: PdfColors.black),

            pw.Table(
                columnWidths: {
                  0: const pw.FlexColumnWidth(4.0),
                  1: const pw.FixedColumnWidth(56.0),
                },
                border: pw.TableBorder.all(),
                children: [
                  pw.TableRow(children: [
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text('Item Description'),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text('Score'),
                    ),
                  ]),
                  ...questions.map((question) {
                    return pw.TableRow(
                        verticalAlignment: pw.TableCellVerticalAlignment.middle,
                        children: [
                          pw.Table(
                              columnWidths: {
                                0: const pw.FixedColumnWidth(64.0),
                                1: const pw.FixedColumnWidth(140.0),
                              },
                              border: pw.TableBorder.all(),
                              children: [
                                pw.TableRow(
                                    verticalAlignment:
                                        pw.TableCellVerticalAlignment.middle,
                                    children: [
                                      pw.Padding(
                                        padding: const pw.EdgeInsets.all(8),
                                        child: pw.Text(question.questionName),
                                      ),
                                      pw.Table(
                                          border: pw.TableBorder.all(),
                                          children: [
                                            ...question.fields.map((field) {
                                              return pw.TableRow(children: [
                                                pw.Padding(
                                                    padding:
                                                        const pw.EdgeInsets.all(
                                                            8),
                                                    child: pw.Text(
                                                        field.fieldLabel)),
                                              ]);
                                            }).toList()
                                          ]),
                                    ])
                              ]),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(8),
                            child: pw.Center(
                                child:
                                    pw.Text(question.questionPoint.toString())),
                          ),
                        ]);
                  }).toList()
                ]),

            pw.SizedBox(height: 20.0),

            pw.Table(tableWidth: pw.TableWidth.min, columnWidths: {
              0: const pw.FixedColumnWidth(120),
              1: const pw.FixedColumnWidth(12),
              2: const pw.FixedColumnWidth(380),
            }, children: [
              pw.TableRow(children: [
                pw.Text('Score',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                pw.Text(' : '),
                pw.Text(totalScore.toString()),
              ]),
              pw.TableRow(children: [
                pw.Text('Interpretation',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                pw.Text(' : '),
                pw.Text(interpretation),
              ]),
            ]),
          ];
        },
      ),
    );

    Uint8List bytes = await pdf.save();

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/Result $womac.pdf');

    await file.writeAsBytes(bytes);
    await OpenFile.open(file.path);
    Get.back();
  }

  @override
  void onSubmit(GlobalKey<FormBuilderState> callback) {
    finalResult();

    Get.dialog(
      AlertDialog(
        title: const Text('Result'),
        content: RichText(
          text: TextSpan(
            style: const TextStyle(color: Colors.black),
            children: [
              TextSpan(text: 'Score : $totalScore'),
              const TextSpan(text: '\n\n'),
              TextSpan(text: 'Interpretation : $interpretation'),
            ],
          ),
        ),
        actions: [ElevatedButton(onPressed: Get.back, child: const Text('Ok'))],
      ),
    );
  }
}
