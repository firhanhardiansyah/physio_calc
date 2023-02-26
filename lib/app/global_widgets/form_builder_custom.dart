import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class FormBuilderCustom extends StatefulWidget {
  const FormBuilderCustom({
    super.key,
    required this.formKey,
    required this.fields,
    required this.onSubmit,
    required this.textSubmit,
  });

  final GlobalKey<FormBuilderState> formKey;
  final List<Widget> fields;
  final Function(GlobalKey<FormBuilderState>) onSubmit;
  final String textSubmit;

  @override
  State<FormBuilderCustom> createState() => _FormBuilderCustomState();
}

class _FormBuilderCustomState extends State<FormBuilderCustom> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.focusScope?.unfocus();
      },
      child: FormBuilder(
        key: widget.formKey,
        autovalidateMode: autovalidateMode,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Wrap(
              runSpacing: 16.0,
              children: widget.fields,
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                if (widget.formKey.currentState?.saveAndValidate() ?? false) {
                  widget.onSubmit(widget.formKey);
                  setState(() {
                    autovalidateMode = AutovalidateMode.disabled;
                  });
                  Get.focusScope?.unfocus();
                  return;
                }

                setState(() {
                  autovalidateMode = AutovalidateMode.onUserInteraction;
                });
              },
              child: Text(widget.textSubmit),
            )
          ],
        ),
      ),
    );
  }
}
