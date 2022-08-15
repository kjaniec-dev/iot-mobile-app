import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvironmentVariables {
  static final String host = dotenv.get("SERVER_HOST", fallback: "localhost");
  static final String port = dotenv.get("SERVER_PORT", fallback: "8001");
  static final String websocketProtocol =
      dotenv.get("WEBSOCKET_PROTOCOL", fallback: "ws");
  static final String httpProtocol =
      dotenv.get("HTTP_PROTOCOL", fallback: "http");
}
