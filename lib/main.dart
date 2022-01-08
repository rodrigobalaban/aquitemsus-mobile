import 'package:aquitemsus/screens/establishments_map.dart';
import 'package:flutter/material.dart';

import 'screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(home: Splash());
        } else {
          return MaterialApp(
            title: 'Aqui tem SUS',
            theme: ThemeData(primarySwatch: Colors.blue),
            home: const EstablishmentsMap(),
          );
        }
      },
    );
  }
}
