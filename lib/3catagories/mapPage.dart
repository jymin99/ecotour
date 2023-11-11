import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key:key);
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late KakaoMapController mapController;
  double longitude = 0.0;
  double latitude = 0.0;

  Future<void> geoLocation() async{
    Position position = await Geolocator.getCurrentPosition();
    this.longitude = position.longitude;
    this.latitude = position.latitude;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
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
                        onPressed: (){},
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
                        onPressed: (){},
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
                child: KakaoMap(
                    onMapTap: (latLng) {
                      print(latLng);
                    }
                )
              // onMapCreated: ((controller) async {
              //    mapController = controller;
              //    setState(() { });
              //  }),
              //  center: LatLng(37.3608681, 126.9306506),
              // onMapCreated,
              // initialCameraPosition: _kInitialPosition))),
            ),
          ),
        ],
      ),
    );
  }
}
// Google Map
//   Completer<GoogleMapController> _controller = Completer();
//
//   double? lat;
//   double? lng;
//   Location location = new Location();
//   bool _serviceEnabled = true;
//   PermissionStatus? _permissionGranted;
//
//   _locateMe() async {
//     _serviceEnabled = await location.serviceEnabled();
//     if (!_serviceEnabled) {
//       _serviceEnabled = await location.requestService();
//       if (!_serviceEnabled) {
//         return;
//       }
//     }
//
//     _permissionGranted = await location.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = await location.requestPermission();
//       if (_permissionGranted != PermissionStatus.granted) {
//         return;
//       }
//     }
//     /*
//     await location.getLocation().then((res) {
//       setState(() {
//         lat = res.latitude;
//         lng = res.longitude;
//       });
//     });
//      */
//
//     // Track user Movements
//     location.onLocationChanged.listen((res) {
//       setState(() {
//         lat = res.latitude;
//         lng = res.longitude;
//       });
//     });
//   }
//
//   static final CameraPosition _kGooglePlex = CameraPosition(
//     // target: LatLng(lat, lng),
//     target: LatLng(13.0827, 80.2707),
//     //target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );
//
//   static final CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       //target: LatLng(lat, lng),
//       target: LatLng(13.0827, 80.2707),
//       //target: LatLng(37.43296265331129, -122.08832357078792),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);
//
//   @override
//   Widget build(BuildContext context) {
//       return Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Center(
//
//           child:
//               Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ElevatedButton(
//                         style: ButtonStyle(
//                           backgroundColor: MaterialStateProperty.all(Colors.white),
//                         ),
//                         onPressed: (){},
//                         child:
//                         Image(
//                           image:AssetImage('assets/accommodation.png'),
//                           width: 50.0,
//                         ),
//                       ),
//                       ElevatedButton(
//                         style: ButtonStyle(
//                           backgroundColor: MaterialStateProperty.all(Colors.white),
//                         ),
//                         onPressed: (){},
//                         child:
//                         Image(
//                           image:AssetImage('assets/food.png'),
//                           width: 50.0,
//                         ),
//                       ),
//                       ElevatedButton(
//                         style: ButtonStyle(
//                           backgroundColor: MaterialStateProperty.all(Colors.white),
//                         ),
//                         onPressed: (){},
//                         child:
//                         Image(
//                           image:AssetImage('assets/bike.png'),
//                           width: 50.0,
//                         ),
//                       ),
//                       ElevatedButton(
//                         style: ButtonStyle(
//                           backgroundColor: MaterialStateProperty.all(Colors.white),
//                         ),
//                         onPressed: (){},
//                         child:
//                         Image(
//                           image:AssetImage('assets/electriccar.png'),
//                           width: 50.0,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//
//                   SizedBox(
//                     height:400,
//                     width: MediaQuery.of(context).size.width-50,
//                     child: GoogleMap(
//                       mapType: MapType.hybrid,
//                       initialCameraPosition: _kGooglePlex,
//                       onMapCreated: (GoogleMapController controller) {
//                         _controller.complete(controller);
//                       },
//                     ),
//                   ),
//             ],
//           ),
//         ),
//       );
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: _goToTheLake,
//         label: Text('To the lake!'),
//         icon: Icon(Icons.directions_boat),
//       );
//   }
//
//   Future<void> _goToTheLake() async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   }
// }
