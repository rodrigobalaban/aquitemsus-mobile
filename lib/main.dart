import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aqui Tem SUS',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Aqui Tem SUS'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.search),
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Expanded(
              child: IconButton(
                icon: Icon(Icons.home_outlined),
                onPressed: null,
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.schedule_outlined),
                onPressed: null,
              ),
            ),
            Expanded(child: Text('')),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.event_outlined),
                onPressed: null,
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.person_outline),
                onPressed: null,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
