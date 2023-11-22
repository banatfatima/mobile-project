import 'package:flutter/material.dart';
import 'package:project_uni/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: "Booking",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Home()
          ,
    );
  }
}
