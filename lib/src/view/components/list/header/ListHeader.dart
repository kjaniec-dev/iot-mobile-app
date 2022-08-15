import 'package:flutter/material.dart';
import 'package:iot_mobile_app/src/view/components/constants.dart';

import '../../IconWithText.dart';

class ListHeader extends StatelessWidget {
  final String title;
  final Icon icon;

  const ListHeader({required this.title, required this.icon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: IconWithText(
        icon: icon,
        text: Text(
          title,
          style: bold24,
        ),
        mainAxisAlignment: MainAxisAlignment.start,
      ),
    );
  }
}
