import 'dart:async';
import 'dart:ffi';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:capstone/firebase/map_list.dart';

import 'package:location/location.dart';
import 'package:capstone/cycle/cycle.dart';
import 'package:capstone/cycle/cycle_repository.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

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
    // getCurrentLocation().then((position) {
    //   setState(() {
    //     latitude = position.latitude;
    //     longitude = position.longitude;
    //   });
    // });
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
            position:
                LatLng(double.parse(cycle.staLat), double.parse(cycle.staLong)),
            infoWindow: InfoWindow(title: cycle.rentNm),
            icon: markerIcon,
          );
        }).toSet();

        setState(() {
          if (!areBikeMarkersVisible) markers.clear();
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
    } else {
      return BitmapDescriptor.fromBytes(Uint8List(0));
      //return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
    }
  }

  Future<void> loadMarkers() async {
    // loadMarkersFromFirestore() 내용을 여기로 옮김
    List<Map<String, dynamic>> cafes = await FireService().getFireModels();
    Set<Marker> newMarkers = cafes
        .map((cafe) => Marker(
              markerId: MarkerId(cafe['shop'].toString()),
              position: LatLng(
                  cafe['latitude'] as double, cafe['longitude'] as double),
              infoWindow: InfoWindow(title: cafe['shop'].toString()),
            ))
        .toSet();

    setState(() {
      markers.clear();
      if (areMarkersVisible) {
        markers.addAll(newMarkers);
      }
    });
  }

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // 위치 서비스가 활성화되었는지 확인
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // 위치 서비스가 비활성화된 경우 처리
      // 사용자에게 위치 서비스를 활성화하라는 메시지를 보여줄 수 있습니다.
      print("위치서비스가 비활성화되어있습니다.");
    }

    // 위치 권한 확인
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // 위치 권한이 거부된 경우 권한 요청
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // 사용자가 위치 권한을 거부한 경우 처리
        // 사용자에게 메시지를 표시하거나 정보를 제공할 수 있습니다.
        print("위치 권한을 거부하였습니다.");
      }
    }

    Position position = await Geolocator.getCurrentPosition();

    print("Received location: ${position.latitude}, ${position.longitude}");

    setState(() {
      markers.clear();
      markers.add(
        Marker(
          markerId: MarkerId('userLocation'),
          position: LatLng(position.latitude, position.longitude),
          infoWindow: InfoWindow(title: 'Your Location'),
        ),
      );
    });

    print("Set new location: $latitude, $longitude");

    mapController.moveCamera(
      CameraUpdate.newLatLng(LatLng(latitude, longitude)),
    );
    return position;
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    //target: LatLng(37.553836, 126.969652),
    target: LatLng(37.503430, 126.957077),
    zoom: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      // child: Center(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      onPressed: () {},
                      child: Image(
                        image: AssetImage('assets/accommodation.png'),
                        width: 40.0,
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      onPressed: () {
                        print("Button Pressed");

                        setState(() {
                          areMarkersVisible =
                              !areMarkersVisible; // Toggle visibility state
                        });
                        loadMarkers();
                        //loadMarkersFromFirestore(); // Load markers based on the new visibility state
                      },
                      child: Image(
                        image: AssetImage('assets/food.png'),
                        width: 40.0,
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      onPressed: () {
                        setState(() {
                          areBikeMarkersVisible =
                              !areBikeMarkersVisible; // Toggle visibility state
                        });
                        loadCycleMarkers();
                      },
                      child: Image(
                        image: AssetImage('assets/bike.png'),
                        width: 40.0,
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      onPressed: () {},
                      child: Image(
                        image: AssetImage('assets/electriccar.png'),
                        width: 40.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 13,
                ),
                Center(
                  child: SizedBox(
                    height: 405.0,
                    width: MediaQuery.of(context).size.width - 50,
                    child: GoogleMap(
                        initialCameraPosition: _kGooglePlex,
                        //initialCameraPosition: CameraPosition(target:LatLng(latitude, longitude)),
                        mapType: MapType.normal,
                        markers: Set.from(markers),
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                        onCameraMove: (_) {},
                        onMapCreated: ((controller) async {
                          mapController = controller;
                          // var currentLocation = await getCurrentLocation();
                          // mapController.moveCamera(CameraUpdate.newLatLng(
                          //     LatLng(currentLocation.latitude,
                          //         currentLocation.longitude)));
                          setState(() {});
                        })),
                  ),
                ),
              ],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            FloatingActionButton.small(
              onPressed: () async {
                var gps = await getCurrentLocation();

                mapController.moveCamera(CameraUpdate.newLatLng(
                    LatLng(gps.latitude, gps.longitude)));

                // print("FloatingActionButton pressed");
                print("Current Location: $gps");
                // mapController.moveCamera(
                //     CameraUpdate.newLatLng(LatLng(currentLocation.latitude, currentLocation.longitude)));
              },
              child: Icon(
                Icons.my_location,
                color: Colors.black,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              backgroundColor: Colors.white,
            ),
            SizedBox(
              width: 15,
            )
          ])
        ],
      ),
    );
  }
}
