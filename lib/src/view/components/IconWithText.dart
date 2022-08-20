import 'package:flutter/material.dart';

import 'constants.dart';

class IconWithText extends StatelessWidget {
  final Icon icon;
  final Text text;
  final MainAxisAlignment mainAxisAlignment;

  const IconWithText(
      {required this.icon,
      required this.text,
      this.mainAxisAlignment = MainAxisAlignment.center,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [icon, sizedBox16, Flexible( child: text )],
    );
  }
}
