import 'package:flutter/material.dart';

class FieldSpacer extends StatelessWidget {
  const FieldSpacer({super.key, this.height = 20});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
