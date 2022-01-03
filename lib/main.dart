import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
  late String _mapStyle;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      rootBundle.loadString('assets/styles/map_style.json').then((string) {
        _mapStyle = string;
      });
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(_mapStyle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.search),
        backgroundColor: Colors.blue,
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(-26.226583568552600, -51.059303283691400),
          zoom: 15,
        ),
        onMapCreated: _onMapCreated,
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
