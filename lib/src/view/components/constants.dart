import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//Colors
const Color cardColor = Color(0xFF424242);
const Color backgroundColor = Color(0xFF303030);
const Color appBarColor = Color(0xFF212121);
const primaryColor = Color(0xFFFF8A65);

const Color temperatureColor = Color(0xFFE57373);
const Color temperatureAnalogousColor = Color(0xFFE5AC73);

const Color humidityColor = Color(0xFF4DB6AC);
const Color humidityAnalogousColor = Color(0xFF4D8BB6);

const Color heatIndexColor = Color(0xFFFFB74D);
const Color heatIndexAnalogousColor = Color(0xFFFF5E4D);

const Color waterLevelColor = Color(0xFF64B5F6);
const Color waterLevelAnalogousColor = Color(0xFF646CF6);

const Color unknownColor = Color(0xFFEEEEEE);
const Color dataColor = Color(0xFFB39DDB);

const Color caretUpColor = Color(0xFFF06292);
const Color caretDownColor = Color(0xFFA5D6A7);

const Color textPrimary = Colors.white;
const Color textSecondary = Color(0XBFFFFFFF);

//Icons
const Icon temperatureIcon = Icon(
  FontAwesomeIcons.temperatureHalf,
  color: temperatureAnalogousColor,
);
const Icon humidityIcon = Icon(
  FontAwesomeIcons.droplet,
  color: humidityAnalogousColor,
);
const Icon waterLevelIcon = Icon(
  FontAwesomeIcons.faucet,
  color: waterLevelAnalogousColor,
);
const Icon heatIndexIcon = Icon(
  FontAwesomeIcons.fire,
  color: heatIndexAnalogousColor,
);
const Icon unknownIcon = Icon(
  FontAwesomeIcons.question,
  color: Colors.black,
);
const Icon caretUpIcon = Icon(
  CupertinoIcons.up_arrow,
  color: caretUpColor,
);
const Icon caretDownIcon = Icon(
  CupertinoIcons.down_arrow,
  color: caretDownColor,
);
const Icon clockIcon = Icon(
  FontAwesomeIcons.clock,
  color: primaryColor,
);
const Icon lastValueDataIcon = Icon(
  CupertinoIcons.antenna_radiowaves_left_right,
  color: dataColor,
);
const Icon currentEventsIcon = Icon(
  CupertinoIcons.exclamationmark_octagon_fill,
  color: primaryColor,
);
const Icon latestEventsIcon = Icon(
  CupertinoIcons.list_dash,
  color: primaryColor,
);
const Icon lastValuesIcon = Icon(CupertinoIcons.speedometer);
const Icon eventsIcon = Icon(CupertinoIcons.square_list) ;

//Miscellaneous
const sizedBox16 = SizedBox(
  width: 16,
);
const sizedBox8 = SizedBox(
  width: 8,
);
const bold24 = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
);
