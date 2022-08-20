import 'package:flutter/material.dart';
import 'package:iot_mobile_app/src/view/components/constants.dart';
import 'package:iot_mobile_app/src/view/components/list/item/ListItem.dart';

import '../../../../models/events/Event.dart';

class EventListView extends StatelessWidget {
  final List<Event> events;

  const EventListView({required this.events, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: ListTile.divideTiles(
        context: context,
        tiles: events.length > 0
            ? events.map((Event ev) {
                final String dateTime =
                    DateTime.fromMillisecondsSinceEpoch(ev.lastValue.ts)
                        .toString();
                final String eventType = ev.type;
                final Icon leadingIcon =
                    _resolveLeadingIconBasedOnEventType(eventType);
                final Icon trailingIcon =
                    _resolveTrailingIconBasedOnEventType(eventType);
                return Material(
                    color: cardColor,
                    child: ListItem(
                      title: eventType,
                      leadingIcon: leadingIcon,
                      trailingIcon: trailingIcon,
                      secondaryText: dateTime,
                    ));
              }).toList()
            : [
                const Text(
                  "None of events occur",
                  textAlign: TextAlign.center,
                  style: TextStyle( color: textPrimary, fontSize: 16,  ),
                )
              ],
      ).toList(),
    );
  }

  Icon _resolveLeadingIconBasedOnEventType(String eventType) {
    switch (eventType) {
      case "highHumidityEvent":
      case "humidityRestoredEvent":
        return humidityIcon;
      case "highTemperatureEvent":
      case "temperatureRestoredEvent":
        return temperatureIcon;
      case "highWaterLevelEvent":
      case "waterLevelRestoredEvent":
        return waterLevelIcon;
      case "noDataReceivedEvent":
      case "dataReceived":
        return lastValueDataIcon;
      default:
        return unknownIcon;
    }
  }

  Icon _resolveTrailingIconBasedOnEventType(String eventType) {
    return eventType == "dataReceived" || eventType.contains("Restored")
        ? caretDownIcon
        : caretUpIcon;
  }
}
