import 'package:flutter/material.dart';
import 'package:iot_mobile_app/src/view/components/constants.dart';

import '../../IconWithText.dart';

class ListItem extends StatelessWidget {
  final String title;
  final Icon leadingIcon;
  final Icon trailingIcon;
  final String secondaryText;

  const ListItem(
      {required this.title,
      required this.leadingIcon,
      required this.trailingIcon,
      required this.secondaryText,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leadingIcon,
      trailing: trailingIcon,
      title: Text(title,
          style: const TextStyle(
            color: Colors.white,
          )),
      subtitle: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        child: Row(children: [
          Icon(
            clockIcon.icon,
            color: textSecondary,
            size: 16,
          ),
          sizedBox16,
          Text(
            secondaryText,
            style: const TextStyle(
              color: textSecondary,
            ),
          )
        ]),
      ),
    );
  }
}
