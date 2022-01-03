import 'package:aquitemsus/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EstablishmentsMap extends StatefulWidget {
  const EstablishmentsMap({Key? key}) : super(key: key);

  @override
  _EstablishmentMapState createState() => _EstablishmentMapState();
}

class _EstablishmentMapState extends State<EstablishmentsMap> {
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
      bottomNavigationBar: const NavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
