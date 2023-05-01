import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:physio_calc/app/core/themes/texts_theme.dart';
import 'package:physio_calc/app/core/utils/abstracts/questionnaire_controller.dart';

import 'package:flutter/services.dart';

import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:physio_calc/app/core/values/questions/uefi_question.dart';
import 'package:physio_calc/app/core/values/strings.dart';
import 'package:physio_calc/app/data/models/form_field_model/form_field_model.dart';

class UefiController extends GetxController implements QuestionnaireController {
  final appBarTitle = ''.obs;
  final formKey = GlobalKey<FormBuilderState>();

  List<FormFieldModel> formFieldsModel = [];

  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  String totalScore = '-';

  @override
  void onInit() {
    super.onInit();

    appBarTitle(Get.parameters['name']);

    formFieldsModel.addAll(FormFieldModel.listFromJson(uefiQuestions));
  }

  @override
  void finalResult() {
    int totalScore = 0;

    for (FormFieldModel field in formFieldsModel) {
      if (field.fieldPointValue != '-') {
        totalScore += int.parse(field.fieldPointValue);
      }
    }

    this.totalScore = '$totalScore';
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

    List tableHeadersDescription = [];

    for (var i = 0; i < 6; i++) {
      tableHeadersDescription.add('Raw Score');
      tableHeadersDescription.add('Final Score');
    }

    Map<int, pw.Alignment>? finalScoreCellAligment = {};

    for (var i = 0; i < 12; i++) {
      finalScoreCellAligment.addAll({i: pw.Alignment.center});
    }

    const tableBodyDescription = [
      [0, 0.0, 10, 33.1, 20, 43.5, 30, 51.5, 40, 59.4, 50, 69.9],
      [1, 8.5, 11, 34.4, 21, 44.4, 31, 52.3, 41, 60.2, 51, 71.3],
      [2, 14.4, 12, 35.6, 22, 45.2, 32, 53.0, 42, 61.1, 52, 72.9],
      [3, 18.6, 13, 36.7, 23, 46.0, 33, 53.8, 43, 62.0, 53, 74.8],
      [4, 21.7, 14, 37.8, 24, 46.9, 34, 54.6, 44, 63.0, 54, 76.8],
      [5, 24.3, 15, 38.9, 25, 47.6, 35, 55.3, 45, 64.0, 55, 79.3],
      [6, 26.5, 16, 39.9, 26, 48.4, 36, 56.1, 46, 65.0, 56, 82.3],
      [7, 28.4, 17, 40.8, 27, 49.2, 37, 56.9, 47, 66.1, 57, 86.2],
      [8, 30.1, 18, 41.8, 28, 50.0, 38, 57.7, 48, 67.3, 58, 91.8],
      [9, 31.7, 19, 42.7, 29, 50.7, 39, 58.5, 49, 68.5, 59, 100.0],
    ];

    pdf.addPage(
      pw.MultiPage(
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
              uefi,
              style: pw.TextStyle(
                fontSize: TextsTheme.sizeTextLg,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(height: 18.0),
            pw.Table(
                border: pw.TableBorder.symmetric(
                    outside:
                        const pw.BorderSide(width: 1, color: PdfColors.black)),
                columnWidths: const {
                  0: pw.FixedColumnWidth(108),
                  1: pw.FixedColumnWidth(20),
                  2: pw.FlexColumnWidth(),
                  3: pw.FixedColumnWidth(156),
                },
                defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
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
                      pw.Text('${userInformation?['age']} Tahun'),
                      pw.Center(
                        child:
                            pw.Text('${userInformation?['examination_date']}'),
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
                width: double.infinity, height: 1, color: PdfColors.black),
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
            pw.RichText(
              text: pw.TextSpan(
                text: 'Raw Total : ',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                children: [
                  pw.TextSpan(
                    text: totalScore,
                    style: pw.TextStyle(fontWeight: pw.FontWeight.normal),
                  )
                ],
              ),
            ),
            pw.SizedBox(height: 96.0),
            pw.Text('Final Score',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 12),
            pw.Table.fromTextArray(
              border: pw.TableBorder.all(),
              cellAlignments: finalScoreCellAligment,
              headers: List<String>.generate(
                tableHeadersDescription.length,
                (col) => tableHeadersDescription[col],
              ),
              headerStyle:
                  pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10),
              data: List<List<String>>.generate(
                tableBodyDescription.length,
                (row) => List<String>.generate(
                  tableHeadersDescription.length,
                  (col) => tableBodyDescription[row][col].toString(),
                ),
              ),
            ),
          ];
        },
      ),
    );

    Uint8List bytes = await pdf.save();

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/Result $uefi.pdf');

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
              TextSpan(text: 'Raw Total : $totalScore'),
            ],
          ),
        ),
        actions: [ElevatedButton(onPressed: Get.back, child: const Text('Ok'))],
      ),
    );
  }
}
