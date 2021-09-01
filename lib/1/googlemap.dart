/*import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//#
class MyMap extends StatefulWidget {
  @override
  State<MyMap> createState() => MyMapSampleState();
  
}

class MyMapSampleState extends State<MyMap> {
//

   Widget _mapWidget; 
    GoogleMapController _mapController;
    void _onMapCreated(GoogleMapController controller) {
    _mapController = controller; }
  
  Position _currentPosition;
  
  final Map<String, Marker> _markers = {};

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  void initState() {
    super.initState();
        _mapWidget = SpinKitRotatingCircle(
      color: Colors.white,
      size: 50.0,
    );
 _initCurrentLocation();
  }



 /* _getCurrentLocation() async {
  GeolocationStatus geolocationStatus  = await Geolocator().checkGeolocationPermissionStatus();

    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
       final Marker marker = Marker(
              markerId: MarkerId("markerIdVal"),
              position:
                  LatLng(_currentPosition.latitude, _currentPosition.longitude),
              infoWindow: InfoWindow(title: "My location"));

              markers[MarkerId("markerIdVal")] = marker;
    }).catchError((e) {
      print(e);
    });
    
  }
*/
  _initCurrentLocation() async {


    await checkPermission();

 _currentPosition = await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);


/*
    Geolocator()
      ..forceAndroidLocationManager = !false
      ..getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      ).then((position) {
        if (mounted) {
          setState(() {_currentPosition = position;
           _mapWidget = initMapWidget();
          
          });

          final Marker marker = Marker(
              markerId: MarkerId("markerIdVal"),
              position:
                  LatLng(_currentPosition.latitude, _currentPosition.longitude),
              infoWindow: InfoWindow(title: "My location"));

          // adding a new marker to map
          markers[MarkerId("markerIdVal")] = marker;
        }
      }).catchError((e) {
        //
      });
      */
  }

  Widget initMapWidget () {
    return GoogleMap(
      mapType: MapType.normal,
      onMapCreated: _onMapCreated,
      myLocationEnabled: true,
      initialCameraPosition: CameraPosition(
        target: LatLng(_currentPosition.latitude, _currentPosition.longitude),
        zoom: 15.0,
      ),
       markers: _markers.values.toSet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _getLocation,
        tooltip: 'الحصول على الموقع',
        child: Icon(Icons.flag),
      ),
      body:  _currentPosition == null?
      Center(child: CircularProgressIndicator()):
      initMapWidget(),
      

     );
  }

  void _getLocation() async {
     var currentLocation = await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    //var currentLocation = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

    setState(() {
      _markers.clear();
      final marker = Marker(
        markerId: MarkerId("curr_loc"),
        position: LatLng(currentLocation.latitude, currentLocation.longitude),
        infoWindow: InfoWindow(title: 'موقعك'),
      );
      _markers["Current Location"] = marker;
    });
  }
}



/* 
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Home extends StatefulWidget {
  Home(this.listType);
  final String listType;

  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  GoogleMapController _mapController;
  // final LatLng _center = const LatLng(1.290270, 103.851959);
  Position _pos;
  Widget _mapWidget; 

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  void initState() {
    _mapWidget = SpinKitRotatingCircle(
      color: Colors.white,
      size: 50.0,
    );
    getCurrentLocation();
    super.initState();
  }

  void getCurrentLocation() async {
    GeolocationStatus geolocationStatus  = await Geolocator().checkGeolocationPermissionStatus();
    print(geolocationStatus);

    Position currPos = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    print(currPos);

    setState(() {
      _pos = currPos;
      _mapWidget = initMapWidget();
    });
  }

  Widget initMapWidget () {
    return GoogleMap(
      mapType: MapType.normal,
      onMapCreated: _onMapCreated,
      myLocationEnabled: true,
      initialCameraPosition: CameraPosition(
        target: LatLng(_pos.latitude, _pos.longitude),
        zoom: 15.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _mapWidget,
      ),
    );
  }
}
 */ 

*/