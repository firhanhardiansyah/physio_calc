import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:physio_calc/app/globa_widgets/appbar_custom.dart';

import '../controllers/barthel_index_controller.dart';

class BarthelIndexView extends GetView<BarthelIndexController> {
  const BarthelIndexView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(58),
        child: AppBarCustom(
          title: controller.appBarTitle,
          onSave: () {},
          onReset: () {},
          onInfo: () {},
        ),
      ),
      body: Center(
        child: Text(
          'BarthelIndexView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
