import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:iot_mobile_app/src/env/EnvironmentVariables.dart';
import 'package:iot_mobile_app/src/view/components/constants.dart';
import 'package:iot_mobile_app/src/view/components/tabs/EventsTab.dart';
import 'package:iot_mobile_app/src/view/components/tabs/LastValueTab.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

Future main() async {
  await dotenv.load();
  runApp(const IotMobileApp());
}

class IotMobileApp extends StatelessWidget {
  const IotMobileApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Iot mobile app',
      theme: CupertinoThemeData(
        brightness: Brightness.dark,
        primaryColor: primaryColor,
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(
            color: primaryColor,
            fontSize: 32,
          ),
        ),
        scaffoldBackgroundColor: backgroundColor,
        barBackgroundColor: appBarColor,
      ),
      home: HomePage(title: 'Iot mobile app monitor'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  // that it has a State object (defined below) that contains fields that affect

  // This widget is the home page of your application. It is stateful, meaning
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final WebSocketChannel channel = WebSocketChannel.connect(
    Uri.parse(
      "${EnvironmentVariables.websocketProtocol}://${EnvironmentVariables.host}:${EnvironmentVariables.port}",
    ),
  );

  @override
  void dispose() {
    super.dispose();
    channel.sink.close();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Iot mobile app"),
      ),
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(
              icon: lastValuesIcon,
              label: "Last values",
            ),
            BottomNavigationBarItem(
              icon: eventsIcon,
              label: "Events",
            ),
          ],
        ),
        tabBuilder: (BuildContext context, index) {
          switch (index) {
            case 0:
              return LastValueTab(stream: channel.stream);
            case 1:
            default:
              return const EventsTab();
          }
        },
      ),
    );
  }
}
