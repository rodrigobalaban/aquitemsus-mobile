import 'package:aquitemsus/screens/establishments_map.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aqui tem SUS',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const EstablishmentsMap(),
    );
  }
}
