import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';

import 'package:secure_minna/models/security_agencies_model.dart';
import 'package:secure_minna/repository/app_constant.dart';

class NigeriaPoliceForceTabTwoPage extends StatefulWidget {
  final SecurityAgenciesModel items;

  const NigeriaPoliceForceTabTwoPage({super.key, required this.items});

  @override
  State<NigeriaPoliceForceTabTwoPage> createState() =>
      _NigeriaPoliceForceTabTwoPageState();
}

class _NigeriaPoliceForceTabTwoPageState
    extends State<NigeriaPoliceForceTabTwoPage> {
  // late SecurityAgenciesModel _item = widget.items;

  GoogleMapController? mapController; //controller for Google map
  Set<Marker> markers = {}; //markers for google map;
  late double lat, lng;
  String? _mapStyle;

  Future<void> init() async {
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
            MapsLauncher.launchCoordinates(lat, lng, '${widget.items.address}');
          }),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));
    //you can add more markers here
    rootBundle.loadString(AppConstant.mapStyle).then((string) {
      _mapStyle = string;
    });
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GoogleMap(
        style: _mapStyle,
        mapToolbarEnabled: true,
        buildingsEnabled: true,
        //Map widget from google_maps_flutter package
        zoomGesturesEnabled: true,
        //enable Zoom in, out on map
        initialCameraPosition: CameraPosition(
          //initial position in map
          target: LatLng(lat, lng), //initial position
          zoom: 19.0, //initial zoom level
        ),
        markers: markers,
        mapType: MapType.normal,
        onMapCreated: (controller) {
          //method called when map is created
          //mapController?.setMapStyle(_mapStyle);
          setState(() {
            mapController = controller;
            mapController
                ?.showMarkerInfoWindow(MarkerId(LatLng(lat, lng).toString()));
            mapController?.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(target: LatLng(lat, lng), zoom: 19.0),
              ),
            );
          });
        },
      ),
    );
  }
}
