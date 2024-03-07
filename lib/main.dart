import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/routes/routes.dart';
import 'package:my_portfolio/view/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My PortFolio',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      getPages: allPage,
      home: HomePage(),
    );
  }
}
