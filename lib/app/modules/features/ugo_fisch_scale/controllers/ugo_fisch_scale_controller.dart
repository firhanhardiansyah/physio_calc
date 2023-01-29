import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:physio_calc/app/core/themes/texts_theme.dart';
import 'package:physio_calc/app/core/values/strings.dart';
import 'package:physio_calc/app/data/models/ugo_fisch_scale/ugo_fisch_scale_field_model.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class UgoFischScaleController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();

  final _validateMode = false.obs;

  List<UgoFischScaleFieldModel> listFields = [];

  String get appBarTitle => Get.parameters['name'] as String;

  AutovalidateMode get autoValidate {
    return _validateMode.value == true
        ? AutovalidateMode.onUserInteraction
        : AutovalidateMode.disabled;
  }

  Map<String, FormBuilderFieldState> get _fields =>
      formKey.currentState!.fields;
  Map<String, dynamic> get fieldsValue => formKey.currentState!.value;

  int totalScore = 0;
  String gradeResult = '-';

  @override
  void onInit() {
    super.onInit();

    listFields = [
      UgoFischScaleFieldModel(
          name: 'shut_up',
          label: 'Shut Up (Istirahat/Diam)',
          pointName: 'shut_up_point'),
      UgoFischScaleFieldModel(
          name: 'wrinkled_forehead',
          label: 'Wrinkled Forehead (Mengerutkan Dahi)',
          pointName: 'wrinkled_forehead_point'),
      UgoFischScaleFieldModel(
          name: 'close_your_eyes',
          label: 'Close Your Eyes (Menutup Mata)',
          pointName: 'close_your_eyes_point'),
      UgoFischScaleFieldModel(
          name: 'smile', label: 'Smile (Tersenyum)', pointName: 'smile_point'),
      UgoFischScaleFieldModel(
          name: 'whistling',
          label: 'Whistling (Bersiul)',
          pointName: 'whistling_point'),
    ];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onChangeField(String? value, UgoFischScaleFieldModel field, int index) {
    formKey.currentState?.save();

    switch (field.name) {
      case 'shut_up':
        _formula(x: 20, i: index, field: field);
        break;
      case 'wrinkled_forehead':
        _formula(x: 10, i: index, field: field);
        break;
      case 'close_your_eyes':
        _formula(x: 30, i: index, field: field);
        break;
      case 'smile':
        _formula(x: 30, i: index, field: field);
        break;
      case 'whistling':
        _formula(x: 10, i: index, field: field);
        break;
      default:
    }
  }

  void onSubmit() {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      debugPrint(formKey.currentState?.value.toString());

      int totalScore = 0;

      for (UgoFischScaleFieldModel field in listFields) {
        totalScore += int.parse(field.pointValue);
      }

      String gradeResult;
      if (totalScore == 100) {
        gradeResult = 'Normal';
      } else if (totalScore >= 70 && totalScore <= 99) {
        gradeResult = 'Prognosis Baik';
      } else if (totalScore >= 30 && totalScore <= 69) {
        gradeResult = 'Prognosis Cukup';
      } else if (totalScore >= 0 && totalScore <= 29) {
        gradeResult = 'Prognosis Buruk';
      } else {
        gradeResult = '-';
      }

      this.totalScore = totalScore;
      this.gradeResult = gradeResult;

      Get.dialog(AlertDialog(
        title: const Text('Result'),
        content: RichText(
            text: TextSpan(
                style: const TextStyle(color: Colors.black),
                children: [
              TextSpan(text: 'Score : $totalScore'),
              const TextSpan(text: '\n\n'),
              TextSpan(text: 'Grade : $gradeResult'),
            ])),
        actions: [ElevatedButton(onPressed: Get.back, child: const Text('Ok'))],
      ));
    } else {
      debugPrint(formKey.currentState?.value.toString());
      debugPrint('validation failed');
    }
  }

  /// Save PDF
  void onSavePdf() async {
    final pdf = pw.Document();

    List<pw.TableRow> tr = [];

    tr.add(pw.TableRow(children: [
      pw.Padding(
        padding: const pw.EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
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
    ]));

    for (UgoFischScaleFieldModel field in listFields) {
      tr.add(pw.TableRow(children: [
        pw.Padding(
          padding:
              const pw.EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          child: pw.Text(field.label),
        ),
        pw.Container(
          child: pw.Center(child: pw.Text(field.pointValue)),
        ),
      ]));
    }

    tr.add(pw.TableRow(children: [
      pw.Padding(
        padding: const pw.EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: pw.Text(
          'Total',
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
    ]));

    tr.add(pw.TableRow(children: [
      pw.Padding(
        padding: const pw.EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: pw.Text(
          'Grade',
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        ),
      ),
      pw.Container(
        child: pw.Center(
            child: pw.Text(
          gradeResult,
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        )),
      ),
    ]));

    pdf.addPage(
      pw.Page(build: (pw.Context context) {
        return pw
            .Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
          pw.Text(ugoFischScale,
              style: pw.TextStyle(
                  fontSize: TextsTheme.sizeTextLg,
                  fontWeight: pw.FontWeight.bold)),
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
                  pw.Container(),
                  pw.Container(
                      child: pw.Center(child: pw.Text('Tanggal Pemeriksaan'))),
                ]),
                pw.TableRow(children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12.0),
                    child: pw.Text('Usia'),
                  ),
                  pw.Text(':'),
                  pw.Container(),
                  pw.Container(),
                ]),
                pw.TableRow(children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12.0),
                    child: pw.Text('Jenis Kelamin'),
                  ),
                  pw.Text(':'),
                  pw.Container(),
                  pw.Container(),
                ]),
              ]),
          pw.SizedBox(height: 28.0),
          pw.Text('Result',
              style: pw.TextStyle(fontSize: TextsTheme.sizeTextBase)),
          pw.SizedBox(height: 8.0),
          pw.Table(
              border: pw.TableBorder.all(),
              columnWidths: const {
                0: pw.FlexColumnWidth(),
                1: pw.FixedColumnWidth(128),
              },
              defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
              children: tr),
        ]);
      }),
    );

    Uint8List bytes = await pdf.save();

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/Result $ugoFischScale.pdf');

    await file.writeAsBytes(bytes);
    await OpenFile.open(file.path);
  }

  void onReset() {
    _validateMode(false);
    formKey.currentState!.reset();
  }

  // Formula
  void _formula({
    required int x,
    required int i,
    required UgoFischScaleFieldModel field,
  }) {
    if (fieldsValue[field.name] == null) return;

    double persentage = fieldsValue[field.name] / 100;
    int result = (x * persentage).round();

    _fields['${field.name}_point']!.didChange('$result');

    listFields[i] = listFields[i].copyWith(pointValue: '$result');
  }
}
