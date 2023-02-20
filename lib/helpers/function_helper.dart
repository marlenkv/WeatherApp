import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

getIcons(String iconcode) {
  switch (iconcode) {
    case "01d":
      return "assets/icon/sun.png";
    case "02d":
      return "assets/icon/skyandsun.png";
    case "03d":
      return "assets/icon/clody.png";
    case "04d":
      return "assets/icon/clodysun.png";
    case "09d":
      return "assets/icon/rain.png";
    case "10d":
      return "assets/icon/rainsun";
    case "11d":
      return "assets/icon/storm.png";
    case "13d":
      return "assets/icon/snowflake.png";
    case "50d":
      return "assets/icon/RainSun";
    case "01n":
      return "assets/icon/clearmoon.png";
    case "02n":
      return "assets/icon/cloudymoon.png";
    case "03n":
      return "assets/icon/clody.png";
    case "04n":
      return "assets/icon/cloudynight.png";
    case "09n":
      return "assets/icon/rain.png";
    case "10n":
      return "assets/icon/rainnight.png";
    case "11n":
      return "assets/icon/storm.png";
    case "13n":
      return "assets/icon/snowflake.png";
    case "50n":
      return "assets/icon/RainSun";
  }
}

getDataFormat(int data) {
  var dt = DateTime.fromMillisecondsSinceEpoch(data * 1000);
  return DateFormat("d MMM yyyy").format(dt);
}

getTimeFormat(int time) {
  var tm = DateTime.fromMillisecondsSinceEpoch(time * 100);
  return DateFormat("HH:mm:ss").format(tm);
}

getCels(double temp) {
  var celc2 = 273.15;
  var res = temp - celc2;
  return res.toInt();
}
