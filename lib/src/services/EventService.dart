import 'dart:convert';

import 'package:iot_mobile_app/src/models/last_value/LastValue.dart';

import 'package:http/http.dart' as http;

import '../env/EnvironmentVariables.dart';
import '../models/events/Event.dart';

class EventService {
  Future<List<Event>> getCurrentEvents() async {
    var uri = Uri.parse(
      "${EnvironmentVariables.httpProtocol}://${EnvironmentVariables.host}:${EnvironmentVariables.port}/events/current",
    );
    return http.get(uri).then((http.Response res) => handleEvents(res.body));
  }

  Future<List<Event>> getLatestEvents() {
    var uri = Uri.parse(
      "${EnvironmentVariables.httpProtocol}://${EnvironmentVariables.host}:${EnvironmentVariables.port}/events",
    );
    return http.get(uri).then((http.Response res) => handleEvents(res.body));
  }

  List<Event> handleEvents(dynamic body) {
    final List<dynamic> events = jsonDecode(body);
    return events.map((ev) {
      final dynamic eventData = ev["data"];
      return Event(ev["type"], LastValue(eventData["ts"], ev["type"]));
    }).toList();
  }
}
