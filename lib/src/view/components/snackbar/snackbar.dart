import 'package:flutter/material.dart';

class Snackbar extends StatelessWidget {
  final String text;

  const Snackbar({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(
        text,
      ),
      elevation: 8,
    );
  }
}
