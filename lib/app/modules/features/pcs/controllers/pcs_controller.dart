import 'dart:io';

import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter_form_builder/src/form_builder.dart';
import 'package:get/get.dart';
import 'package:physio_calc/app/core/themes/texts_theme.dart';
import 'package:physio_calc/app/core/utils/abstracts/questionnaire_controller.dart';
import 'package:physio_calc/app/core/values/questions/pcs_question.dart';
import 'package:physio_calc/app/core/values/strings.dart';
import 'package:physio_calc/app/data/models/form_field_model/form_field_model.dart';

import 'package:flutter/services.dart';

import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PcsController extends GetxController implements QuestionnaireController {
  final appBarTitle = ''.obs;
  final formKey = GlobalKey<FormBuilderState>();

  List<FormFieldModel> formFieldsModel = [];

  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  int totalScore = 0;
  String headInjuryClassification = '-';

  @override
  void onInit() {
    super.onInit();

    appBarTitle(Get.parameters['name']);

    formFieldsModel.addAll(FormFieldModel.listFromJson(pcsQuestions));
  }

  @override
  void finalResult() {
    int totalScore = 0;
    String headInjuryClassification = '';

    for (FormFieldModel field in formFieldsModel) {
      if (field.fieldPointValue != '-') {
        totalScore += int.parse(field.fieldPointValue);
      }
    }

    if (totalScore <= 8) {
      headInjuryClassification = 'Severe Head Injury';
    }
    if (totalScore >= 9 && totalScore <= 12) {
      headInjuryClassification = 'Moderate Head Injury';
    }
    if (totalScore >= 13 && totalScore <= 15) {
      headInjuryClassification = 'Mild Head Injury';
    }

    this.totalScore = totalScore;
    this.headInjuryClassification = headInjuryClassification;
  }

  @override
  void onChanged({required int index, FormFieldScoreModel? value}) {
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

    const tableHeaders = [
      'No',
      'Item Description',
      'Score',
    ];

    const tableHeadersDescription = [
      'Usia',
      'Nilai Normal',
    ];
    const tableBodyDescription = [
      {'age': '0 - 6 Bulan', 'value': '9'},
      {'age': '6 - 12 Bulan', 'value': '11'},
      {'age': '1 - 2 Tahun', 'value': '12'},
      {'age': '2 - 5 Tahun', 'value': '13'},
      {'age': '> 5 Tahun', 'value': '14'}
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
                      pcs,
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
                              pw.Text(
                                  '${userInformation?['age_in_months']} Bulan / ${userInformation?['age_in_years']} Tahun'),
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
                    pw.Table(
                      tableWidth: pw.TableWidth.min,
                      columnWidths: {
                        0: const pw.FixedColumnWidth(180),
                        1: const pw.FixedColumnWidth(20),
                        2: const pw.FixedColumnWidth(380),
                      },
                      children: [
                        pw.TableRow(children: [
                          pw.Text(
                            'Total',
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            ' : ',
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            '$totalScore',
                          ),
                        ]),
                        pw.TableRow(children: [
                          pw.Text(
                            'Klasifikasi Head Injury',
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            ' : ',
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            headInjuryClassification,
                          ),
                        ]),
                      ],
                    ),
                    pw.SizedBox(height: 32),
                    pw.Text(
                      '*Keterangan Kategori Tingkat Kesadaran Yang Normal Pada Anak Berdasarkan Usia',
                    ),
                    pw.SizedBox(height: 12),
                    pw.Table.fromTextArray(
                      border: pw.TableBorder.all(),
                      cellAlignments: {
                        0: pw.Alignment.center,
                        1: pw.Alignment.center,
                      },
                      headers: List<String>.generate(
                        tableHeadersDescription.length,
                        (col) => tableHeadersDescription[col],
                      ),
                      headerStyle: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                      ),
                      data: List<List<String>>.generate(
                        tableBodyDescription.length,
                        (row) => List<String>.generate(
                          2,
                          (col) {
                            String data;
                            switch (col) {
                              case 0:
                                data = '${tableBodyDescription[row]['age']}';
                                break;
                              case 1:
                                data = '${tableBodyDescription[row]['value']}';
                                break;
                              default:
                                data = '-';
                            }
                            return data;
                          },
                        ),
                      ),
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
    final file = File('${directory.path}/Result $pcs.pdf');

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
              TextSpan(
                  text: 'Klasfikasi Head Injury : $headInjuryClassification'),
            ],
          ),
        ),
        actions: [ElevatedButton(onPressed: Get.back, child: const Text('Ok'))],
      ),
    );
  }
}
