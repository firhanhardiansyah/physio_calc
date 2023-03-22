import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:physio_calc/app/core/themes/texts_theme.dart';
import 'package:physio_calc/app/core/values/questions/gcs_question.dart';
import 'package:physio_calc/app/core/values/strings.dart';
import 'package:physio_calc/app/data/models/form_field_model/form_field_model.dart';

import 'package:flutter/services.dart';

import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class GcsController extends GetxController {
  final appBarTitle = ''.obs;

  final formKey = GlobalKey<FormBuilderState>();

  List<FormFieldModel> formFieldsModel = [];

  int totalScore = 0;
  String gradeLevel = '-';
  String gradeClassification = '-';

  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  @override
  void onInit() {
    super.onInit();

    appBarTitle(Get.parameters['name']);

    formFieldsModel.addAll(FormFieldModel.listFromJson(gcsQuestions));
  }

  void onReset() {
    formKey.currentState!.reset();
    autoValidate = AutovalidateMode.disabled;
    update();

    for (var i = 0; i < formFieldsModel.length; i++) {
      formFieldsModel[i] = formFieldsModel[i].copyWith(fieldPointValue: '-');
    }
    update();
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

          for (FormFieldModel field in formFieldsModel) {
            tr.add(
              pw.TableRow(
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12.0),
                    child: pw.Text(field.fieldLabel),
                  ),
                  pw.Container(
                    child: pw.Center(child: pw.Text(field.fieldPointValue)),
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
          tr.add(
            pw.TableRow(
              children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 12.0),
                  child: pw.Text(
                    'Klasifikasi Head Injury',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                ),
                pw.Container(
                  child: pw.Center(
                    child: pw.Padding(
                      padding: const pw.EdgeInsets.all(8.0),
                      child: pw.Text(
                        gradeClassification,
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
                      gcs,
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
                        1: pw.FixedColumnWidth(128),
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
    final file = File('${directory.path}/Result $gcs.pdf');

    await file.writeAsBytes(bytes);
    await OpenFile.open(file.path);
    Get.back();
  }

  void onSubmit(GlobalKey<FormBuilderState> callback) {
    if (formKey.currentState?.saveAndValidate() ?? false) {
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
                TextSpan(text: 'Tingkat Kesadaran : $gradeLevel'),
                const TextSpan(text: '\n\n'),
                TextSpan(
                    text: 'Klasifikasi Head Injury : $gradeClassification'),
              ],
            ),
          ),
          actions: [
            ElevatedButton(onPressed: Get.back, child: const Text('Ok'))
          ],
        ),
      );
      return;
    }

    autoValidate = AutovalidateMode.onUserInteraction;
    update();
  }

  void onChanged({
    required int index,
    FormFieldScoreModel? value,
  }) {
    formKey.currentState?.save();

    formFieldsModel[index] = formFieldsModel[index]
        .copyWith(fieldPointValue: '${value?.scoreValue}');
    update();
  }

  void _finalResult() {
    int totalScore = 0;
    String gradeLevel = '-';
    String gradeClassification = '-';

    for (FormFieldModel field in formFieldsModel) {
      totalScore += int.parse(field.fieldPointValue);
    }

    // Grade Level
    if (totalScore == 15) {
      gradeLevel = 'Composmentis';
    }
    if (totalScore >= 13 && totalScore <= 14) {
      gradeLevel = 'Somnolen/Lathergy';
    }
    if (totalScore >= 8 && totalScore <= 12) {
      gradeLevel = 'Sopor';
    }
    if (totalScore >= 3 && totalScore <= 7) {
      gradeLevel = 'Coma';
    }

    // Grade Level
    if (totalScore >= 13 && totalScore <= 15) {
      gradeClassification = 'Mild Head Injury';
    }
    if (totalScore >= 9 && totalScore <= 12) {
      gradeClassification = 'Moderate Head Injury';
    }
    if (totalScore >= 0 && totalScore <= 8) {
      gradeClassification = 'Severe Head Injury';
    }

    this.totalScore = totalScore;
    this.gradeLevel = gradeLevel;
    this.gradeClassification = gradeClassification;
  }
}
