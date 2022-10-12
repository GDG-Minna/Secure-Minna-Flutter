import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';

import '../../models/security_agencies_model.dart';

class NigeriaCivilDefenceTabTwoPage extends StatefulWidget {
  final SecurityAgenciesModel items;

  const NigeriaCivilDefenceTabTwoPage({super.key, required this.items});

  @override
  State<NigeriaCivilDefenceTabTwoPage> createState() =>
      _NigeriaCivilDefenceTabTwoPageState();
}

class _NigeriaCivilDefenceTabTwoPageState
    extends State<NigeriaCivilDefenceTabTwoPage> {
  // late SecurityAgenciesModel _item = widget.items;

  GoogleMapController? mapController; //controller for Google map
  Set<Marker> markers = {}; //markers for google map;
  late double lat, lng;
  late String _mapStyle;

  @override
  void initState() {
    lat = widget.items.lat!;
    lng = widget.items.long!;
    markers.add(Marker(
      //add marker on google map
      markerId: MarkerId(LatLng(lat, lng).toString()),
      position: LatLng(lat, lng), //position of marker
      infoWindow: InfoWindow(
          //popup info
          title: '${widget.items.title}',
          snippet: '${widget.items.address}',
          onTap: () {
            MapsLauncher.launchCoordinates(lat, lng, "${widget.items.address}");
          }),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));
    //you can add more markers here
    super.initState();
    rootBundle.loadString('assets/json/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GoogleMap(
        mapToolbarEnabled: true,
        buildingsEnabled: true,
        //Map widget from google_maps_flutter package
        zoomGesturesEnabled: true,
        //enable Zoom in, out on map
        initialCameraPosition: CameraPosition(
          //initial position in map
          target: LatLng(lat, lng), //initial position
          zoom: 18.0, //initial zoom level
        ),
        markers: markers,
        //markers to show on map
        mapType: MapType.normal,
        //map type
        onMapCreated: (controller) {
          //method called when map is created
          setState(() {
            mapController = controller;
            mapController
                ?.showMarkerInfoWindow(MarkerId(LatLng(lat, lng).toString()));
            mapController?.setMapStyle(_mapStyle);
          });
        },
      ),
    );
  }
}
