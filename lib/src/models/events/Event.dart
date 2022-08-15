import '../last_value/LastValue.dart';

class Event {
  final String type;
  final LastValue lastValue;

  Event( this.type, this.lastValue );
}
