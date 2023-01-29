import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_identity_controller.dart';

class UserIdentityView extends GetView<UserIdentityController> {
  const UserIdentityView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserIdentityView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'UserIdentityView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
