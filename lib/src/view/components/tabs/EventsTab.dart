import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iot_mobile_app/src/models/events/Event.dart';
import 'package:iot_mobile_app/src/services/EventService.dart';
import 'package:iot_mobile_app/src/view/components/constants.dart';
import 'package:iot_mobile_app/src/view/components/list/header/ListHeader.dart';

import '../list/view/EventListView.dart';
import '../snackbar/snackbar.dart';

class EventsTab extends StatefulWidget {
  const EventsTab({Key? key}) : super(key: key);

  @override
  State<EventsTab> createState() => _EventsTabState();
}

class _EventsTabState extends State<EventsTab> {
  List<Event> events = <Event>[];
  List<Event> currentEvents = <Event>[];
  final EventService eventsService = EventService();
  late Timer _periodicTimer;

  @override
  void initState() {
    super.initState();
    getLatestEvents().then((value) => events = value);
    getCurrentEvents().then((value) => currentEvents = value);

    _periodicTimer = Timer.periodic(const Duration(minutes: 1), (timer) async {
      final List<Event> latestEvents = await getLatestEvents();
      final List<Event> actualEvents = await getCurrentEvents();

      setState(() {
        events = latestEvents;
        currentEvents = actualEvents;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _periodicTimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            const ListHeader(
              title: "Current events",
              icon: currentEventsIcon,
            ),
            EventListView(events: currentEvents),
            const ListHeader(
              title: "Latest events",
              icon: latestEventsIcon,
            ),
            EventListView(events: events.reversed.toList()),
          ],
        ),
      ),
    );
  }

  Future<List<Event>> getLatestEvents() async {
    return eventsService
        .getLatestEvents()
        .then((value) => events = value)
        .catchError(
          () => const Snackbar(
            text: "Something went wrong when getting lastest events",
          ),
        );
  }

  Future<List<Event>> getCurrentEvents() async {
    return eventsService
        .getCurrentEvents()
        .then((value) => currentEvents = value)
        .catchError(
          () => const Snackbar(
            text: "Something went wrong when getting lastest events",
          ),
        );
  }
}
