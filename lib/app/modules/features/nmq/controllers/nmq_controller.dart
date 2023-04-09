import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:physio_calc/app/core/themes/texts_theme.dart';
import 'package:physio_calc/app/core/utils/abstracts/questionnaire_controller.dart';
import 'package:physio_calc/app/core/values/questions/nmq_question.dart';
import 'package:physio_calc/app/core/values/strings.dart';
import 'package:physio_calc/app/data/models/form_field_model/form_field_model.dart';

import 'package:flutter/services.dart';

import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class NmqController extends GetxController implements QuestionnaireController {
  final appBarTitle = ''.obs;
  final formKey = GlobalKey<FormBuilderState>();

  List<FormFieldModel> formFieldsModel = [];

  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  int totalScore = 0;
  String degreeOfRisk = '-';
  String improvement = '-';

  @override
  void onInit() {
    super.onInit();

    appBarTitle(Get.parameters['name']);

    formFieldsModel.addAll(FormFieldModel.listFromJson(nmqQuestions));
  }

  @override
  void onChanged({
    required int index,
    FormFieldScoreModel? value,
  }) async {
    formKey.currentState?.save();

    formFieldsModel[index] = formFieldsModel[index]
        .copyWith(fieldPointValue: '${value?.scoreValue}');
    update();
  }

  @override
  void onReset() {
    formKey.currentState!.reset();
    autoValidate = AutovalidateMode.disabled;
    update();

    for (var i = 0; i < formFieldsModel.length; i++) {
      formFieldsModel[i] = formFieldsModel[i].copyWith(fieldPointValue: '-');
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

    Uint8List bodyMapImage =
        (await rootBundle.load('assets/images/body_map.png'))
            .buffer
            .asUint8List();

    const tableHeaders = [
      'No',
      'Jenis Keluhan',
      'Score',
    ];

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
            pw.Table(
              border: pw.TableBorder.symmetric(
                outside: const pw.BorderSide(
                  width: 1,
                  color: PdfColors.black,
                ),
              ),
              defaultVerticalAlignment: pw.TableCellVerticalAlignment.top,
              children: [
                pw.TableRow(children: [pw.SizedBox(height: 4.0)]),
                pw.TableRow(
                  children: [
                    pw.Table(
                      columnWidths: const {
                        0: pw.FlexColumnWidth(32),
                        1: pw.FixedColumnWidth(8),
                        2: pw.FlexColumnWidth(42),
                      },
                      defaultVerticalAlignment:
                          pw.TableCellVerticalAlignment.middle,
                      children: [
                        pw.TableRow(children: [
                          pw.Padding(
                            padding: const pw.EdgeInsets.symmetric(
                              vertical: 4.0,
                              horizontal: 12.0,
                            ),
                            child: pw.Text('Nama'),
                          ),
                          pw.Text(':'),
                          pw.Text('${userInformation?['fullname']}'),
                        ]),
                        pw.TableRow(children: [
                          pw.Padding(
                            padding: const pw.EdgeInsets.symmetric(
                              vertical: 4.0,
                              horizontal: 12.0,
                            ),
                            child: pw.Text('Usia'),
                          ),
                          pw.Text(':'),
                          pw.Text('${userInformation?['age']}'),
                        ]),
                        pw.TableRow(children: [
                          pw.Padding(
                            padding: const pw.EdgeInsets.symmetric(
                              vertical: 4.0,
                              horizontal: 12.0,
                            ),
                            child: pw.Text('Jenis Kelamin'),
                          ),
                          pw.Text(':'),
                          pw.Text('${userInformation?['gender']}'),
                        ]),
                        pw.TableRow(children: [
                          pw.Padding(
                            padding: const pw.EdgeInsets.symmetric(
                              vertical: 4.0,
                              horizontal: 12.0,
                            ),
                            child: pw.Text('Berat Badan'),
                          ),
                          pw.Text(':'),
                          pw.Text('${userInformation?['weight']}'),
                        ]),
                      ],
                    ),
                    pw.Table(
                      columnWidths: const {
                        0: pw.FlexColumnWidth(72),
                        1: pw.FixedColumnWidth(8),
                        2: pw.FlexColumnWidth(42),
                      },
                      defaultVerticalAlignment:
                          pw.TableCellVerticalAlignment.middle,
                      children: [
                        pw.TableRow(children: [
                          pw.Padding(
                            padding: const pw.EdgeInsets.symmetric(
                              vertical: 4.0,
                              horizontal: 12.0,
                            ),
                            child: pw.Text('Pekerjaan'),
                          ),
                          pw.Text(':'),
                          pw.Text('${userInformation?['job']}'),
                        ]),
                        pw.TableRow(children: [
                          pw.Padding(
                            padding: const pw.EdgeInsets.symmetric(
                              vertical: 4.0,
                              horizontal: 12.0,
                            ),
                            child: pw.Text('Lama Bekerja'),
                          ),
                          pw.Text(':'),
                          pw.Text('${userInformation?['length_of_work']}'),
                        ]),
                        pw.TableRow(children: [
                          pw.Padding(
                            padding: const pw.EdgeInsets.symmetric(
                              vertical: 4.0,
                              horizontal: 12.0,
                            ),
                            child: pw.Text('Waktu Bekerja'),
                          ),
                          pw.Text(':'),
                          pw.Text('${userInformation?['working_time']}'),
                        ]),
                        pw.TableRow(children: [
                          pw.Padding(
                            padding: const pw.EdgeInsets.symmetric(
                              vertical: 4.0,
                              horizontal: 12.0,
                            ),
                            child: pw.Text('Tanggal Pemeriksaan'),
                          ),
                          pw.Text(':'),
                          pw.Text('${userInformation?['examination_date']}'),
                        ]),
                        pw.TableRow(children: [pw.SizedBox(height: 12.0)])
                      ],
                    ),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 20.0),

            pw.Container(
                width: double.infinity, height: 1, color: PdfColors.black),

            pw.Container(
              alignment: pw.Alignment.center,
              padding: const pw.EdgeInsets.only(top: 12.0, right: 8.0),
              child: pw.Image(
                pw.MemoryImage(bodyMapImage),
                height: 320.0,
              ),
            ),

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
                        data = '${formFieldsModel[row].fieldId - 1}';
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
                    pw.Text('Individual Sum Skor',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text(' : '),
                    pw.Text(totalScore.toString()),
                  ]),
                  pw.TableRow(children: [
                    pw.Text('Degree of Risk',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text(' : '),
                    pw.Text(degreeOfRisk),
                  ]),
                  pw.TableRow(children: [
                    pw.Text('Improvement',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text(' : '),
                    pw.Text(improvement),
                  ]),
                ]),
              ),
              pw.Expanded(child: pw.SizedBox()),
            ]),

            pw.SizedBox(height: 20.0),
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Expanded(
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Container(
                        decoration: const pw.BoxDecoration(
                          border: pw.Border(
                              top: pw.BorderSide(color: PdfColors.black)),
                        ),
                        padding: const pw.EdgeInsets.only(top: 10, bottom: 4),
                        child: pw.Text(
                          'Keterangan',
                          style: pw.TextStyle(
                            fontSize: 10,
                            color: PdfColors.indigo,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ),
                      pw.Text(
                        '1 = No pain, 2 = Rather pain, 3 = Pain, 4 = Very Pain',
                        textAlign: pw.TextAlign.justify,
                        style: const pw.TextStyle(
                          fontSize: 8,
                          lineSpacing: 2,
                          color: PdfColors.grey800,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.Expanded(
                  child: pw.SizedBox(),
                ),
              ],
            )
          ];
        },
      ),
    );

    Uint8List bytes = await pdf.save();

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/Result $nmq.pdf');

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
              TextSpan(text: 'Individual Sum Skor : $totalScore'),
              const TextSpan(text: '\n\n'),
              TextSpan(text: 'Degree of Risk : $degreeOfRisk'),
              const TextSpan(text: '\n\n'),
              TextSpan(text: 'Improvement : $improvement'),
            ],
          ),
        ),
        actions: [ElevatedButton(onPressed: Get.back, child: const Text('Ok'))],
      ),
    );
  }

  @override
  void finalResult() {
    int totalScore = 0;
    String degreeOfRisk = '-';
    String improvement = '-';

    for (FormFieldModel field in formFieldsModel) {
      totalScore += int.parse(field.fieldPointValue);
    }

    if (totalScore >= 28 && totalScore <= 49) {
      degreeOfRisk = 'Low';
      improvement = 'Doesn\'t need improvement';
    }

    if (totalScore >= 50 && totalScore <= 70) {
      degreeOfRisk = 'Medium';
      improvement = 'Maybe need improvement';
    }

    if (totalScore >= 71 && totalScore <= 91) {
      degreeOfRisk = 'High';
      improvement = 'Need Improvement';
    }

    if (totalScore >= 92 && totalScore <= 112) {
      degreeOfRisk = 'Very High';
      improvement = 'Need Improvement as soon as Possible';
    }

    this.totalScore = totalScore;
    this.degreeOfRisk = degreeOfRisk;
    this.improvement = improvement;
  }
}
