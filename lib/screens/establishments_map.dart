import 'dart:collection';

import 'package:aquitemsus/models/establishment.dart';
import 'package:aquitemsus/models/location.dart';
import 'package:aquitemsus/utils/establishment_service.dart';
import 'package:aquitemsus/utils/location_service.dart';
import 'package:aquitemsus/widgets/nav_bar.dart';
import 'package:clippy_flutter/triangle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:custom_info_window/custom_info_window.dart';

class EstablishmentsMap extends StatefulWidget {
  const EstablishmentsMap({Key? key}) : super(key: key);

  @override
  _EstablishmentMapState createState() => _EstablishmentMapState();
}

class _EstablishmentMapState extends State<EstablishmentsMap> {
  final CustomInfoWindowController _infoWindowController =
      CustomInfoWindowController();
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

  @override
  void dispose() {
    _infoWindowController.dispose();
    super.dispose();
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
    _infoWindowController.googleMapController = controller;
  }

  _showEstablishmentsNearby() async {
    _establishments = await EstablishmentService().getEstablishmentsNearby();
    _setMarkers();
  }

  _setMarkers() async {
    for (var establishment in _establishments) {
      var markerId = MarkerId(establishment.id.toString());
      var position = LatLng(
          establishment.location.latitude, establishment.location.longitude);

      var marker = Marker(
        markerId: markerId,
        icon: await BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty,
            EstablishmentService()
                .getIconPathByCategory(establishment.category)),
        position: position,
        onTap: () => _showInfoWindow(establishment, position),
      );

      _markers.add(marker);
    }
  }

  _showInfoWindow(Establishment establishment, LatLng position) {
    _infoWindowController.addInfoWindow!(
      Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      establishment.category.name,
                      style: const TextStyle(
                          color: Color.fromRGBO(84, 133, 229, 1),
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      establishment.name,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Atendimento de Seg. a Sex.',
                      style: TextStyle(
                          color: Color.fromRGBO(154, 154, 154, 1), height: 1.5),
                    ),
                    const Text(
                      'Clique para ver mais informações',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 9,
                      ),
                    )
                  ],
                ),
              ),
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Triangle.isosceles(
            edge: Edge.BOTTOM,
            child: Container(
              color: Colors.white,
              width: 20.0,
              height: 10.0,
            ),
          ),
        ],
      ),
      position,
    );
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
              return Stack(children: [
                GoogleMap(
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  initialCameraPosition: CameraPosition(
                    target:
                        LatLng(_userLocation.latitude, _userLocation.longitude),
                    zoom: 15,
                  ),
                  onMapCreated: _onMapCreated,
                  onTap: (position) => _infoWindowController.hideInfoWindow!(),
                  onCameraMove: (position) {
                    _infoWindowController.onCameraMove!();
                  },
                  markers: _markers,
                ),
                CustomInfoWindow(
                  controller: _infoWindowController,
                  height: 110,
                  width: 250,
                  offset: 50,
                )
              ]);
            } else {
              return const Text('Carregando localização...');
            }
          }),
      bottomNavigationBar: const NavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
