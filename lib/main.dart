import 'package:flutter/material.dart';
import 'Model/CountryModelEntity.dart';
import 'CommonComponent/ComComp.dart';
import 'API/Constants.dart';
import 'API/RegionAPI.dart';
import 'ui/continent/Continents.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:Continents(),
      //MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}