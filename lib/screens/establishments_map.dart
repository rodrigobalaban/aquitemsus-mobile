import 'dart:collection';

import 'package:aquitemsus/models/establishment.dart';
import 'package:aquitemsus/models/location.dart';
import 'package:aquitemsus/utils/establishment_service.dart';
import 'package:aquitemsus/utils/location_service.dart';
import 'package:aquitemsus/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EstablishmentsMap extends StatefulWidget {
  const EstablishmentsMap({Key? key}) : super(key: key);

  @override
  _EstablishmentMapState createState() => _EstablishmentMapState();
}

class _EstablishmentMapState extends State<EstablishmentsMap> {
  late List<Establishment> _establishments;
  late String _mapStyle;
  late Location _userLocation;
  final Set<Marker> _markers = HashSet<Marker>();

  @override
  initState() {
    super.initState();
    _loadMapStyle();
    _getUserLocation();
    _showEstablishmentsNearby();
  }

  void _loadMapStyle() {
    rootBundle.loadString('assets/styles/map_style.json').then((string) {
      _mapStyle = string;
    });
  }

  Future<bool> _getUserLocation() async {
    _userLocation = await LocationService.determinePosition();
    return true;
  }

  void _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(_mapStyle);
  }

  _showEstablishmentsNearby() async {
    _establishments = await EstablishmentService().getEstablishmentsNearby();
    _setMarkers();
  }

  _setMarkers() async {
    for (var establishment in _establishments) {
      _markers.add(Marker(
          markerId: MarkerId(establishment.id.toString()),
          icon: await BitmapDescriptor.fromAssetImage(
              ImageConfiguration.empty,
              EstablishmentService()
                  .getIconPathByCategory(establishment.category)),
          position: LatLng(establishment.location.latitude,
              establishment.location.longitude)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.search),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
          future: _getUserLocation(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GoogleMap(
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                initialCameraPosition: CameraPosition(
                  target:
                      LatLng(_userLocation.latitude, _userLocation.longitude),
                  zoom: 15,
                ),
                onMapCreated: _onMapCreated,
                markers: _markers,
              );
            } else {
              return const Text('Carregando localização...');
            }
          }),
      bottomNavigationBar: const NavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
