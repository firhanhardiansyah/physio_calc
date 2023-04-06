import 'package:flutter/material.dart';

class MyDragHandle extends StatelessWidget {
  const MyDragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      height: 4.0,
      width: 32.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black.withOpacity(.4),
      ),
    );
  }
}
