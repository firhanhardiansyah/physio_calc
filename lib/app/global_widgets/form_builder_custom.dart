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
    this.btnSubmitPadding,
  });

  final GlobalKey<FormBuilderState> formKey;
  final List<Widget> fields;
  final Function(GlobalKey<FormBuilderState>) onSubmit;
  final String textSubmit;
  final EdgeInsetsGeometry? btnSubmitPadding;

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
            Padding(
              padding: widget.btnSubmitPadding ?? EdgeInsets.zero,
              child: ElevatedButton(
                onPressed: () {
                  if (widget.formKey.currentState?.saveAndValidate() ?? false) {
                    widget.onSubmit(widget.formKey);

                    setState(() {
                      autovalidateMode = AutovalidateMode.disabled;
                    });

                    Get.focusScope?.unfocus();
                    return;
                  }

                  if (Get.isSnackbarOpen) return;

                  setState(() {
                    autovalidateMode = AutovalidateMode.onUserInteraction;
                  });

                  Get.showSnackbar(
                    const GetSnackBar(
                      message: 'Harap periksa kembali!',
                      snackStyle: SnackStyle.FLOATING,
                      duration: Duration(seconds: 2),
                      margin:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                      borderRadius: 8,
                      backgroundColor: Colors.red,
                    ),
                  );
                },
                child: Text(widget.textSubmit),
              ),
            )
          ],
        ),
      ),
    );
  }
}
