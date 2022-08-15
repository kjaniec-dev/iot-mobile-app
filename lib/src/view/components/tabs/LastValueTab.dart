// Home Tab
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iot_mobile_app/src/view/components/IconWithText.dart';
import 'package:iot_mobile_app/src/view/components/constants.dart';

import '../../../models/last_value/WaterLeakLastValue.dart';
import '../card/LastValueCard.dart';

class LastValueTab extends StatefulWidget {
  final Stream stream;

  const LastValueTab({required this.stream, Key? key}) : super(key: key);

  @override
  State<LastValueTab> createState() => _LastValueTabState();
}

class _LastValueTabState extends State<LastValueTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: StreamBuilder(
            stream: widget.stream,
            builder: (context, snapshot) {
              final String containerText;
              final List<Widget> widgets = <Widget>[];

              if (snapshot.hasData && snapshot.data.toString().isNotEmpty) {
                WaterLeakLastValue waterLeakLastValue =
                    _parseLastValueFromMessage(
                  snapshot.data.toString(),
                );

                waterLeakLastValue
                    .resolveNotNullLastValueProperties()
                    .forEach((element) {
                  widgets.add(LastValueCard(lastValueProperty: element));
                });
                containerText =
                    "${DateTime.fromMillisecondsSinceEpoch(waterLeakLastValue.ts).toString()}";
              } else {
                containerText = "There is no data to display";
              }
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(32),
                    child: IconWithText(
                      icon: clockIcon,
                      text: Text(
                        containerText,
                        textAlign: TextAlign.center,
                        style: bold24,
                      ),
                    ),
                  ),
                  Wrap(
                    children: widgets,
                    runSpacing: 24,
                    spacing: 24,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.spaceAround,
                  ),
                ],
              );
            }),
      ),
    );
  }

  WaterLeakLastValue _parseLastValueFromMessage(String content) {
    final Map<String, dynamic> json = jsonDecode(content);
    return WaterLeakLastValue(json);
  }
}
