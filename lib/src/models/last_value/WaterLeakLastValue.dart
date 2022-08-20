import 'package:iot_mobile_app/src/models/last_value/LastValue.dart';
import 'package:iot_mobile_app/src/models/last_value/LastValueProperty.dart';

import 'LastValuePropertyKey.dart';

class WaterLeakLastValue extends LastValue {
  double? waterLevel;
  double? temperature;
  double? humidity;
  double? heatIndex;

  WaterLeakLastValue(final Map<String, dynamic> json)
      : super(
            json["ts"] != null
                ? json["ts"] as int
                : DateTime.now().millisecondsSinceEpoch,
            "waterLeakDetection") {
    if (json.containsKey("waterLevel")) {
      waterLevel = json["waterLevel"] + .0;
    }
    if (json.containsKey("temperature")) {
      temperature = json["temperature"] + .0;
    }
    if (json.containsKey("humidity")) {
      humidity = json["humidity"] + .0;
    }
    if (json.containsKey("heatIndex")) {
      heatIndex = json["heatIndex"] +.0;
    }
  }

  List<LastValueProperty> resolveNotNullLastValueProperties() {
    final List<LastValueProperty> lastValueProperties = [];

    if (temperature != null) {
      lastValueProperties.add(LastValueProperty(
        LastValueKey.temperature,
        temperature.toString(),
      ));
    }

    if (humidity != null) {
      lastValueProperties.add(LastValueProperty(
        LastValueKey.humidity,
        humidity.toString(),
      ));
    }

    if (waterLevel != null) {
      lastValueProperties.add(LastValueProperty(
        LastValueKey.waterLevel,
        waterLevel.toString(),
      ));
    }

    if (heatIndex != null) {
      lastValueProperties.add(LastValueProperty(
        LastValueKey.heatIndex,
        heatIndex.toString(),
      ));
    }

    return List.unmodifiable(lastValueProperties);
  }
}
