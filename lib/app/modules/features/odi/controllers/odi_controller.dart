import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/src/form_builder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:physio_calc/app/core/themes/texts_theme.dart';
import 'package:physio_calc/app/core/utils/abstracts/questionnaire_controller.dart';
import 'package:physio_calc/app/core/values/questions/odi_question.dart';
import 'package:physio_calc/app/core/values/strings.dart';
import 'package:physio_calc/app/data/models/form_field_model/form_field_model.dart';

import 'package:flutter/services.dart';

import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class OdiController extends GetxController implements QuestionnaireController {
  final appBarTitle = ''.obs;
  final formKey = GlobalKey<FormBuilderState>();

  List<FormFieldModel> formFieldsModel = [];

  String totalScore = '-';
  String percentage = '-';
  String levelOfDisability = '-';
  String interpretation = '-';

  @override
  void onInit() {
    super.onInit();

    appBarTitle(Get.parameters['name']);

    formFieldsModel.addAll(FormFieldModel.listFromJson(odiQuestions));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void finalResult() {
    int totalScore = 0;
    double percentage = 0;
    String levelOfDisability = '-';
    String interpretation = '-';

    for (FormFieldModel field in formFieldsModel) {
      if (field.fieldPointValue != '-') {
        totalScore += int.parse(field.fieldPointValue);
      }
    }

    final filledQuestions =
        formFieldsModel.where((e) => e.fieldPointValue != '-');

    percentage = (totalScore / (filledQuestions.length * 5)) * 100;

    if (percentage >= 0 && percentage <= 20) {
      levelOfDisability = 'Minimal disability';
      interpretation =
          'The patient can cope with most living activities. Usually no treatment is indicated apart from advice on lifting sitting and exercise.';
    }

    if (percentage >= 21 && percentage <= 40) {
      levelOfDisability = 'Moderate Disability';
      interpretation =
          'The patient experiences more pain and difficulty with sitting, lifting and standing. Travel and social life are more difficult and they may be disabled from work. Personal care, sexual activity and sleeping are not grossly affected and the patient can usually be managed by conservative means.';
    }

    if (percentage >= 41 && percentage <= 60) {
      levelOfDisability = 'Severe Disability';
      interpretation =
          'Pain remains the main problem in this group but activities of daily living are affected. These patients require a detailed investigation.';
    }

    if (percentage >= 61 && percentage <= 80) {
      levelOfDisability = 'Crippling back pain';
      interpretation =
          'Back pain impinges on all aspects of the patient\'s life. Positive intervention is required.';
    }

    if (percentage >= 81 && percentage <= 100) {
      levelOfDisability = 'Bed-bound or exaggerating symptoms';
      interpretation =
          'These patients are either bed-bound or exaggerating their symptoms.';
    }

    this.totalScore = totalScore == 0 && filledQuestions.isEmpty
        ? '-'
        : totalScore.toString();
    this.percentage = percentage.isNaN ? '-' : '${percentage.toInt()}%';
    this.levelOfDisability = levelOfDisability;
    this.interpretation = interpretation;
  }

  @override
  void onChanged({required int index, FormFieldScoreModel? value}) async {
    formKey.currentState?.save();

    formFieldsModel[index] = formFieldsModel[index]
        .copyWith(fieldPointValue: '${value?.scoreValue}');
    update();
  }

  @override
  void onReset() {
    formKey.currentState!.reset();

    for (var i = 0; i < formFieldsModel.length; i++) {
      formFieldsModel[i] = formFieldsModel[i].copyWith(fieldPointValue: '-');
    }
    update();
  }

  @override
  void onSavePdf(GlobalKey<FormBuilderState> callback) async {
    final Map<String, dynamic>? userInformation = callback.currentState?.value;
    final pdf = pw.Document();

    Uint8List headerImage =
        (await rootBundle.load('assets/images/physio_calc.png'))
            .buffer
            .asUint8List();

    const tableHeaders = [
      'No',
      'Name',
      'Score',
    ];

    pdf.addPage(
      pw.Page(
        margin: pw.EdgeInsets.zero,
        build: (context) {
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
                      odi,
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
                    pw.Container(
                        width: double.infinity,
                        height: 1,
                        color: PdfColors.black),
                    pw.Table.fromTextArray(
                      border: pw.TableBorder.all(),
                      cellAlignments: {
                        0: pw.Alignment.center,
                        1: pw.Alignment.centerLeft,
                        2: pw.Alignment.center,
                      },
                      headers: List<String>.generate(
                        tableHeaders.length,
                        (col) => tableHeaders[col],
                      ),
                      headerStyle: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                      ),
                      data: List<List<String>>.generate(
                        formFieldsModel.length,
                        (row) => List<String>.generate(
                          3,
                          (col) {
                            String data;
                            switch (col) {
                              case 0:
                                data = '${formFieldsModel[row].fieldId}';
                                break;
                              case 1:
                                data = formFieldsModel[row].fieldLabel;
                                break;
                              case 2:
                                data = formFieldsModel[row].fieldPointValue;
                                break;
                              default:
                                data = '-';
                            }
                            return data;
                          },
                        ),
                      ),
                    ),
                    pw.SizedBox(height: 20.0),
                    pw.Row(children: [
                      pw.Expanded(
                        flex: 2,
                        child: pw.Table(children: [
                          pw.TableRow(children: [
                            pw.Text('Score',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold)),
                            pw.Text(' : '),
                            pw.Text(totalScore),
                          ]),
                          pw.TableRow(children: [
                            pw.Text('Percentage',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold)),
                            pw.Text(' : '),
                            pw.Text(percentage),
                          ]),
                          pw.TableRow(children: [
                            pw.Text('Level Of Disability',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold)),
                            pw.Text(' : '),
                            pw.Text(levelOfDisability),
                          ]),
                          pw.TableRow(children: [
                            pw.Text('Interpretation',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold)),
                            pw.Text(' : '),
                            pw.Text(interpretation),
                          ]),
                        ]),
                      ),
                    ]),
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
    final file = File('${directory.path}/Result $odi.pdf');

    await file.writeAsBytes(bytes);
    await OpenFile.open(file.path);
    // Get.back();
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
              TextSpan(text: 'Percentage : $percentage'),
              const TextSpan(text: '\n\n'),
              TextSpan(text: 'Level of Disability : $levelOfDisability'),
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
