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

    Future.wait([
      getCurrentEvents(),
      getLatestEvents()
    ]).then((allEventLists) {
      setState(() {
        currentEvents = allEventLists[0];
        events = allEventLists[1];
      });
    }).onError((error, stackTrace) {
      const SnackBar snackBar = SnackBar(
        content: const Text("Something went wrong when getting latest and current events"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });

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
    return SafeArea(
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
         Expanded( child: EventListView(events: events),),
        ],
      ),
    );
  }

  Future<List<Event>> getLatestEvents() async {
    return eventsService.getLatestEvents().onError((error, stackTrace) {
      const SnackBar snackBar = SnackBar(
        content: const Text("Something went wrong when getting latest events"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return [];
    });
  }

  Future<List<Event>> getCurrentEvents() async {
    return eventsService.getCurrentEvents().onError((error, stackTrace) {
      const SnackBar snackBar = SnackBar(
        content: const Text("Something went wrong when getting current events"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return [];
    });
  }
}
