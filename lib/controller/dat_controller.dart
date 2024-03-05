import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  var dataMap = <String, double>{
    "Flutter": 5,
    "Java": 4,
    "MySQL": 3.5,
    "HTML": 4.5,
    "CSS": 4.5,
  }.obs;

  var colorList = <Color>[
    const Color(0xfffdcb6e),
    const Color(0xff0984e3),
    const Color(0xfffd79a8),
    const Color(0xffe17055),
    const Color(0xff6c5ce7),
  ];

  var gradientList = <List<Color>>[
    [const Color.fromRGBO(223, 250, 92, 1), const Color.fromRGBO(129, 250, 112, 1)],
    [const Color.fromRGBO(129, 182, 205, 1), const Color.fromRGBO(91, 253, 199, 1)],
    [const Color.fromRGBO(175, 63, 62, 1.0), const Color.fromRGBO(254, 154, 92, 1)],
    [const Color.fromARGB(255, 86, 62, 175), const Color.fromARGB(255, 254, 92, 176)],
  ];
}
