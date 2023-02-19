import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:physio_calc/app/core/themes/texts_theme.dart';
import 'package:physio_calc/app/core/values/strings.dart';
import 'package:physio_calc/app/data/models/barthel_index/barthel_index_model.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class BarthelIndexController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();

  final setAppBarTitle = ''.obs;
  String get getAppBarTitle => setAppBarTitle.value;

  List<BarthelIndexModel> listFields = [];
  int totalScore = 0;
  String gradeResult = '-';

  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  @override
  void onInit() {
    super.onInit();

    setAppBarTitle(Get.parameters['name']);

    listFields = [
      BarthelIndexModel(
        id: 1,
        name: 'feeding',
        label: 'Feeding (Makan)',
        score: [
          BarthelIndexScoreModel(
            scoreName: 'Tidak mampu',
            scoreValue: 0,
          ),
          BarthelIndexScoreModel(
            scoreName: 'Butuh bantuan memotong, mengoles mentega, dll',
            scoreValue: 5,
          ),
          BarthelIndexScoreModel(
            scoreName: 'Mandiri',
            scoreValue: 10,
          ),
        ],
        pointName: 'feeding_point',
      ),
      BarthelIndexModel(
        id: 2,
        name: 'bathing',
        label: 'Bathing (Mandi)',
        score: [
          BarthelIndexScoreModel(
            scoreName: 'Tergantung orang lain',
            scoreValue: 0,
          ),
          BarthelIndexScoreModel(
            scoreName: 'Mandiri',
            scoreValue: 5,
          ),
        ],
        pointName: 'bathing_point',
      ),
      BarthelIndexModel(
        id: 3,
        name: 'grooming',
        label: 'Grooming (Perawatan Diri)',
        score: [
          BarthelIndexScoreModel(
            scoreName: 'Membutuhkan bantuan orang lain',
            scoreValue: 0,
          ),
          BarthelIndexScoreModel(
            scoreName:
                'Mandiri dalam perawatan muka, rambut, gigi, dan bercukur',
            scoreValue: 5,
          ),
        ],
        pointName: 'grooming_point',
      ),
      BarthelIndexModel(
        id: 4,
        name: 'dressing',
        label: 'Dressing (Berpakaian)',
        score: [
          BarthelIndexScoreModel(
            scoreName: 'Tergantung orang lain',
            scoreValue: 0,
          ),
          BarthelIndexScoreModel(
            scoreName: 'Sebagian dibantu (misal mengancing baju)',
            scoreValue: 5,
          ),
          BarthelIndexScoreModel(
            scoreName: 'Mandiri',
            scoreValue: 10,
          ),
        ],
        pointName: 'dressing_point',
      ),
      BarthelIndexModel(
        id: 5,
        name: 'bowel',
        label: 'Bowel (Buang Air Kecil)',
        score: [
          BarthelIndexScoreModel(
            scoreName: 'Inkontinensia atau pakai kateter dan tidak terkontrol',
            scoreValue: 0,
          ),
          BarthelIndexScoreModel(
            scoreName: 'Kadang Inkontinensia (maks, 1x24 jam)',
            scoreValue: 5,
          ),
          BarthelIndexScoreModel(
            scoreName: 'Kontinensia (teratur untuk lebih dari 7 hari)',
            scoreValue: 10,
          ),
        ],
        pointName: 'bowel_point',
      ),
      BarthelIndexModel(
        id: 6,
        name: 'bladder',
        label: 'Bladder (Buang Air Besar)',
        score: [
          BarthelIndexScoreModel(
            scoreName: 'Inkontinensia (tidak teratur atau perlu enema)',
            scoreValue: 0,
          ),
          BarthelIndexScoreModel(
            scoreName: 'Kadang Inkontensia (sekali seminggu)',
            scoreValue: 5,
          ),
          BarthelIndexScoreModel(
            scoreName: 'Kontinensia (teratur)',
            scoreValue: 10,
          ),
        ],
        pointName: 'bladder_point',
      ),
      BarthelIndexModel(
        id: 7,
        name: 'toilet_use',
        label: 'Toilet Use (Penggunaan Toilet',
        score: [
          BarthelIndexScoreModel(
            scoreName: 'Tergantung bantuan orang lain',
            scoreValue: 0,
          ),
          BarthelIndexScoreModel(
            scoreName:
                'Membutuhkan bantuan, tapi dapat melakukan beberapa hal sendiri',
            scoreValue: 5,
          ),
          BarthelIndexScoreModel(
            scoreName: 'Mandiri',
            scoreValue: 10,
          ),
        ],
        pointName: 'toilet_use_point',
      ),
      BarthelIndexModel(
        id: 8,
        name: 'transfer',
        label:
            'Transfer (Berpindah Dari Tempat Tidur Ke Kursi, dan Sebaliknya)',
        score: [
          BarthelIndexScoreModel(
            scoreName: 'Tidak mampu',
            scoreValue: 0,
          ),
          BarthelIndexScoreModel(
            scoreName: 'Butuh bantuan untuk bisa duduk (2 orang)',
            scoreValue: 5,
          ),
          BarthelIndexScoreModel(
            scoreName: 'Bantuan kecil (1 orang)',
            scoreValue: 10,
          ),
          BarthelIndexScoreModel(
            scoreName: 'Mandiri',
            scoreValue: 15,
          ),
        ],
        pointName: 'transfer_point',
      ),
      BarthelIndexModel(
        id: 9,
        name: 'mobilitas',
        label: 'Mobilitas (Pada Permukaan Datar)',
        score: [
          BarthelIndexScoreModel(
            scoreName: 'Immobile (tidak mampu)',
            scoreValue: 0,
          ),
          BarthelIndexScoreModel(
            scoreName: 'Menggunakan kursi roda',
            scoreValue: 5,
          ),
          BarthelIndexScoreModel(
            scoreName: 'Berjalan dengan bantuan satu orang',
            scoreValue: 10,
          ),
          BarthelIndexScoreModel(
            scoreName:
                'Mandiri (meskipun menggunakan alat bantu seperti, tongkat)',
            scoreValue: 10,
          ),
          BarthelIndexScoreModel(
            scoreName: 'Mandiri',
            scoreValue: 15,
          ),
        ],
        pointName: 'mobilitas_point',
      ),
      BarthelIndexModel(
        id: 10,
        name: 'stairs',
        label: 'Stairs (Naik Turun Tangga)',
        score: [
          BarthelIndexScoreModel(
            scoreName: 'Tidak mampu',
            scoreValue: 0,
          ),
          BarthelIndexScoreModel(
            scoreName: 'Membutuhkan bantuan (alat bantu)',
            scoreValue: 5,
          ),
          BarthelIndexScoreModel(
            scoreName: 'Mandiri',
            scoreValue: 10,
          ),
        ],
        pointName: 'stairs_point',
      ),
    ];
  }

  void onChanged({
    required int index,
    BarthelIndexScoreModel? value,
  }) {
    formKey.currentState?.save();

    listFields[index] =
        listFields[index].copyWith(pointValue: '${value?.scoreValue}');
    update();
  }

  void onSubmit() {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      _finalResult();

      Get.dialog(AlertDialog(
        title: const Text('Result'),
        content: RichText(
            text: TextSpan(
                style: const TextStyle(color: Colors.black),
                children: [
              TextSpan(text: 'Score : $totalScore'),
              const TextSpan(text: '\n\n'),
              TextSpan(text: 'Interpretasi : $gradeResult'),
            ])),
        actions: [ElevatedButton(onPressed: Get.back, child: const Text('Ok'))],
      ));
      return;
    }

    autoValidate = AutovalidateMode.onUserInteraction;
    update();
  }

  void onReset() {
    formKey.currentState!.reset();
    autoValidate = AutovalidateMode.disabled;
    update();

    for (var i = 0; i < listFields.length; i++) {
      listFields[i] = listFields[i].copyWith(pointValue: '-');
    }
    update();
  }

  void onSavePdf(GlobalKey<FormBuilderState> userInformationFormKey) async {
    _finalResult();

    final Map<String, dynamic>? userInformation =
        userInformationFormKey.currentState?.value;
    final pdf = pw.Document();

    log('message userInformation : $userInformation');

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

          for (BarthelIndexModel field in listFields) {
            tr.add(
              pw.TableRow(
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12.0),
                    child: pw.Text(field.label),
                  ),
                  pw.Container(
                    child: pw.Center(child: pw.Text(field.pointValue)),
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
                    'INTERPRETASI',
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
              ],
            ),
          );

          return pw.Stack(
            children: [
              pw.Align(
                alignment: pw.Alignment.topRight,
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
                      barthelIndex,
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
                    pw.SizedBox(height: 28.0),
                    pw.Text(
                      'RESULT',
                      style: pw.TextStyle(fontSize: TextsTheme.sizeTextBase),
                    ),
                    pw.SizedBox(height: 8.0),
                    pw.Table(
                        border: pw.TableBorder.all(),
                        columnWidths: const {
                          0: pw.FlexColumnWidth(),
                          1: pw.FixedColumnWidth(128),
                        },
                        defaultVerticalAlignment:
                            pw.TableCellVerticalAlignment.middle,
                        children: tr),
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
    final file = File('${directory.path}/Result $barthelIndex.pdf');

    await file.writeAsBytes(bytes);
    await OpenFile.open(file.path);
  }

  void _finalResult() {
    int totalScore = 0;
    String gradeResult = '-';

    for (BarthelIndexModel field in listFields) {
      totalScore += int.parse(field.pointValue);
    }

    if (totalScore >= 0 && totalScore <= 20) {
      gradeResult = 'Dependen Total';
    }
    if (totalScore >= 21 && totalScore <= 40) {
      gradeResult = 'Dependen Berat';
    }
    if (totalScore >= 41 && totalScore <= 60) {
      gradeResult = 'Dependen Sedang';
    }
    if (totalScore >= 61 && totalScore <= 90) {
      gradeResult = 'Dependen Ringan';
    }
    if (totalScore >= 91 && totalScore <= 100) {
      gradeResult = 'Mandiri';
    }

    this.totalScore = totalScore;
    this.gradeResult = gradeResult;
  }
}
