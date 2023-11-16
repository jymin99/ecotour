import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:capstone/firebase/map_list.dart';
// import 'package:location/location.dart';
import 'package:capstone/cycle/cycle.dart';
import 'package:capstone/cycle/cycle_repository.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key:key);
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  // Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController mapController;
  double latitude = 37.553836;
  double longitude = 126.969652;

  Set<Marker> markers = {};

  bool areMarkersVisible = false;
  bool areBikeMarkersVisible = false; // 새로 추가된 부분

  @override
  void initState() {
    super.initState();
    loadMarkers();
    //loadMarkersFromFirestore();
    loadCycleMarkers();

  }

  Future<void> loadCycleMarkers() async {
    try {
      List<Cycle>? cycles = await CycleRepository().loadCycles();
      if (cycles != null && cycles.isNotEmpty) {
        Set<Marker> newMarkers = cycles.map((cycle) {
          final BitmapDescriptor markerIcon = _getMarkerIconForCycle();
          return Marker(
            markerId: MarkerId(cycle.rentId),
            position: LatLng(double.parse(cycle.staLat), double.parse(cycle.staLong)),
            infoWindow: InfoWindow(title: cycle.rentNm),
            icon: markerIcon,
          );
        }).toSet();

        setState(() {
          if (!areBikeMarkersVisible)
            markers.clear();
          markers.addAll(newMarkers);
        });
      }
    } catch (e) {
      print('Error loading bike stations: $e');
      // 적절한 오류 처리 추가
    }
  }

  BitmapDescriptor _getMarkerIconForCycle() {
    // 적절한 조건에 따라 다른 색상의 아이콘을 반환
    if (areBikeMarkersVisible) {
      return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue);
    }
    else {
      return BitmapDescriptor.fromBytes(Uint8List(0));
      //return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
    }
  }

  Future<void> loadMarkers() async {
    // loadMarkersFromFirestore() 내용을 여기로 옮김
    List<Map<String, dynamic>> cafes = await FireService().getFireModels();
    Set<Marker> newMarkers = cafes.map((cafe) => Marker(
      markerId: MarkerId(cafe['shop'].toString()),
      position: LatLng(cafe['latitude'] as double, cafe['longitude'] as double),
      infoWindow: InfoWindow(title: cafe['shop'].toString()),
    )).toSet();

    setState(() {
      markers.clear();
      if (areMarkersVisible) {
        markers.addAll(newMarkers);
      }
    });
  }



  Future<Position> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    // setState(() {
    //   latitude = position.latitude;
    //   longitude = position.longitude;
    //   markers.clear();
    //   markers.add(
    //     Marker(
    //       markerId: MarkerId('userLocation'),
    //       position: LatLng(latitude, longitude),
    //       infoWindow: InfoWindow(title: 'Your Location'),
    //     ),
    //   );
    // });
    // mapController.moveCamera(
    //   CameraUpdate.newLatLng(LatLng(latitude, longitude)),
    // );
    return position;
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.553836, 126.969652),
    //target: LatLng(37.478818, 126.979486),
     zoom: 15,
   );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child:
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: (){},
                    child:
                    Image(
                      image:AssetImage('assets/accommodation.png'),
                      width: 50.0,
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                     backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: (){
                      print("Button Pressed");

                      setState(() {
                        areMarkersVisible = !areMarkersVisible; // Toggle visibility state
                      });
                      loadMarkers();
                      //loadMarkersFromFirestore(); // Load markers based on the new visibility state
                    },
                    child:
                    Image(
                      image:AssetImage('assets/food.png'),
                      width: 50.0,
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: (){
                      setState(() {
                        areBikeMarkersVisible = !areBikeMarkersVisible; // Toggle visibility state
                      });
                      loadCycleMarkers();
                    },
                    child:
                    Image(
                      image:AssetImage('assets/bike.png'),
                      width: 50.0,
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: (){},
                    child:
                    Image(
                      image:AssetImage('assets/electriccar.png'),
                      width: 50.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  height: 450.0,
                     width: MediaQuery.of(context).size.width - 50,
                     child: GoogleMap(
                       initialCameraPosition: _kGooglePlex,
                       // initialCameraPosition: CameraPosition(target:LatLng(latitude, longitude)),
                       mapType: MapType.normal,
                       markers: Set.from(markers),
                       myLocationEnabled: true,
                       myLocationButtonEnabled: true,
                       onCameraMove: (_){},
                       onMapCreated: ((controller) async {
                         mapController = controller;
                         setState(() {

                         });
                       })
                     ),
                   ),
              ),
              // FloatingActionButton(
              //   onPressed: () async {
              //     var gps = await getCurrentLocation();
              //
              //     mapController.animateCamera(
              //         CameraUpdate.newLatLng(LatLng(gps.latitude, gps.longitude)));
              //
              //     // print("FloatingActionButton pressed");
              //     // Position currentLocation = await getCurrentLocation();
              //     // print("Current Location: $currentLocation");
              //     // mapController.moveCamera(
              //     //     CameraUpdate.newLatLng(LatLng(currentLocation.latitude, currentLocation.longitude)));
              //   },
              //   child: Icon(
              //     Icons.my_location,
              //     color: Colors.black,
              //   ),
              //   backgroundColor: Colors.white,
              //  ),
            ],
          ),
        ),

      );
  }
}
