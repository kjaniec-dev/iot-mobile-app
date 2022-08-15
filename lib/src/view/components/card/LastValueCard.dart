import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iot_mobile_app/src/models/last_value/LastValueProperty.dart';
import 'package:iot_mobile_app/src/view/components/constants.dart';
import '../../../models/last_value/LastValuePropertyKey.dart';

class LastValueCardContent {
  final String title;
  final String value;
  final String adornment;
  final Color backgroundColor;
  final Icon icon;

  LastValueCardContent({
    required this.title,
    required this.value,
    required this.backgroundColor,
    required this.icon,
    this.adornment = "",
  });
}

class LastValueCard extends StatelessWidget {
  final LastValueProperty lastValueProperty;

  const LastValueCard({required this.lastValueProperty, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LastValueCardContent lastValueCardContent =
        _resolveCardAssetsBasedOnPropertyType(lastValueProperty);
    return Card(
      color: lastValueCardContent.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      shadowColor: lastValueCardContent.backgroundColor.withOpacity(0.2),
      elevation: 8,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: 200,
        child: Column(children: [
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              lastValueCardContent.title,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          Row(
            children: [
              lastValueCardContent.icon,
              sizedBox16,
              Expanded(
                child: Row(
                  children: [
                    Text(
                      lastValueCardContent.value,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    sizedBox8,
                    Text(
                      lastValueCardContent.adornment,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFeatures: [FontFeature.subscripts()],
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  LastValueCardContent _resolveCardAssetsBasedOnPropertyType(
    LastValueProperty lastValueProperty,
  ) {
    switch (lastValueProperty.key) {
      case LastValueKey.temperature:
        return LastValueCardContent(
          title: "Temperature",
          value: lastValueProperty.value,
          backgroundColor: temperatureColor,
          icon: Icon(
            temperatureIcon.icon,
            size: 48,
            color: temperatureIcon.color,
          ),
          adornment: "°C",
        );
      case LastValueKey.humidity:
        return LastValueCardContent(
          title: "Humidity",
          value: lastValueProperty.value,
          backgroundColor: humidityColor,
          icon: Icon(
            humidityIcon.icon,
            size: 48,
            color: humidityIcon.color,
          ),
          adornment: "%",
        );
      case LastValueKey.heatIndex:
        return LastValueCardContent(
          title: "Heat index",
          value: lastValueProperty.value,
          backgroundColor: heatIndexColor,
          icon: Icon(
            heatIndexIcon.icon,
            size: 48,
            color: heatIndexIcon.color,
          ),
          adornment: "°C",
        );
      case LastValueKey.waterLevel:
        return LastValueCardContent(
            title: "Water level",
            value: lastValueProperty.value,
            backgroundColor: waterLevelColor,
            icon: Icon(
              waterLevelIcon.icon,
              size: 48,
              color: waterLevelIcon.color,
            ),
            adornment: "mm");
      default:
        return LastValueCardContent(
          title: "Unknown",
          value: lastValueProperty.value,
          backgroundColor: unknownColor,
          icon: Icon(
            unknownIcon.icon,
            size: 48,
            color: unknownIcon.color,
          ),
        );
    }
  }
}
