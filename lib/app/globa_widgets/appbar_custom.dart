import 'package:flutter/material.dart';
import 'package:physio_calc/app/core/themes/color_theme.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom(
      {super.key,
      required this.title,
      required this.onSave,
      required this.onReset,
      required this.onInfo});

  final String title;
  final VoidCallback onSave;
  final VoidCallback onReset;
  final VoidCallback onInfo;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        PopupMenuButton(
          onSelected: (value) {
            switch (value) {
              case 'save':
                return onSave();
              case 'reset':
                return onReset();
              case 'info':
                return onInfo();
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'save',
              child: Row(
                children: [
                  Icon(
                    Icons.description_outlined,
                    color: ColorsTheme.primary,
                  ),
                  const SizedBox(
                    width: 18.0,
                  ),
                  const Text('Save')
                ],
              ),
            ),
            PopupMenuItem(
              value: 'reset',
              child: Row(
                children: [
                  Icon(
                    Icons.restart_alt_outlined,
                    color: ColorsTheme.primary,
                  ),
                  const SizedBox(
                    width: 18.0,
                  ),
                  const Text('Reset')
                ],
              ),
            ),
            PopupMenuItem(
              value: 'info',
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: ColorsTheme.primary,
                  ),
                  const SizedBox(
                    width: 18.0,
                  ),
                  const Text('Info')
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
