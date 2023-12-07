import 'dart:async';
import 'dart:ffi' as ffi;
import 'dart:typed_data';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:capstone/firebase/map_list.dart';
//import 'package:location/location.dart';
import 'package:capstone/cycle/cycle.dart';
import 'package:capstone/cycle/cycle_repository.dart';
import 'package:capstone/evcar/ev.dart';
import 'package:capstone/evcar/ev_repository.dart';
import 'package:capstone/accommodation/accommodation.dart';
import 'package:capstone/accommodation/accommodation_repository.dart';

import '../schedule/database/drift_database.dart';

List<String> favorites=[];


class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  // Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController mapController;
  TextEditingController _controller = TextEditingController();
  // TextField에 입력된 값을 가져오거나 TextField에 입력된 값이 변경될 때 사용

  double latitude = 37.553836;
  double longitude = 126.969652;

  Set<Marker> markers = {};

  bool areMarkersVisible = false;
  bool areBikeMarkersVisible = false; // 새로 추가된 부분
  bool areEvMarkerVisible = false;
  bool areAccMarkersVisible = false;
  bool areEcoShopMarkersVisible = false;
  bool areRefillMarkersVisible = false;
  bool areStoreMarkersVisible = false;

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
    loadEvMarkers();
    loadCycleMarkers();
    loadAccMarkers();
    loadEcoShopMarkers();
    loadStoreMarkers();
    loadRefillMarkers();
  }


  Future<void> loadAccMarkers() async {
    try {
      List<Accommodation>? accs = await AccommodationRepository().loadAccs();
      if (accs != null && accs.isNotEmpty) {
        Set<Marker> newMarkers = accs.map((acc) {
          final BitmapDescriptor markerIcon = _getMarkerIconForAcc();
          return Marker(
            markerId: MarkerId('acc${acc.contentid}'),
            position:
            LatLng(double.parse(acc.mapy), double.parse(acc.mapx)),
            infoWindow: InfoWindow(title: acc.title),
            icon: markerIcon,
            onTap: () {
              _onMarkerTapped(MarkerId('acc${acc.contentid}'));
            },
          );
        }).toSet();

        setState(() {
          if(!areAccMarkersVisible) markers.clear();
          markers.addAll(newMarkers);
        });
      }
    } catch(e) {
      print('Error loading accommodation list: $e');
    }
  }

  Future<void> loadMarkers() async {
    List<Map<String, dynamic>> cafes = await FireService().getFireModels();
    Set<Marker> newMarkers = cafes.map((cafe) {
      final BitmapDescriptor markerIcon = _getMarkerIcon();
      return Marker(
          markerId: MarkerId('cafe${cafe['shop'].toString()}'),
          position: LatLng(
              cafe['latitude'] as double, cafe['longitude'] as double),
          infoWindow: InfoWindow(title: cafe['shop'].toString()),
          icon: markerIcon,
          onTap:(){
            _onCafeMarkerTapped(MarkerId('cafe${cafe['shop']}'));
          }
      );
    }).toSet();

    setState(() {
      if (!areMarkersVisible) markers.clear();
      markers.addAll(newMarkers);
    });
  }

  Future<void> loadCycleMarkers() async {
    try {
      List<Cycle>? cycles = await CycleRepository().loadCycles();
      if (cycles != null && cycles.isNotEmpty) {
        Set<Marker> newMarkers = cycles.map((cycle) {
          final BitmapDescriptor markerIcon = _getMarkerIconForCycle();
          return Marker(
            markerId: MarkerId('bike${cycle.rentId}'),
            position:
            LatLng(double.parse(cycle.staLat), double.parse(cycle.staLong)),
            infoWindow: InfoWindow(title: cycle.rentNm),
            icon: markerIcon,
            onTap: () {
              _onCycleMarkerTapped(MarkerId('bike${cycle.rentId}'));
            },
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

  Future<void> loadEvMarkers() async {
    try {
      List<Ev>? evs = await EvRepository().loadEvs();
      // print('Ev details: $evs');

      if (evs != null && evs.isNotEmpty) {
        Set<Marker> newMarkers = evs.map((ev) {
          final BitmapDescriptor markerIcon = _getMarkerIconForEv();
          return Marker(
            markerId: MarkerId('ev${ev.cpId}'),
            position:
            LatLng(double.parse(ev.lat), double.parse(ev.longi)),
            infoWindow: InfoWindow(title: ev.csNm),
            icon: markerIcon,
            onTap: () {
              _onEvMarkerTapped(MarkerId('ev${ev.cpId}'));
            },
          );
        }).toSet();

        setState(() {
          if(!areEvMarkerVisible) markers.clear();
          markers.addAll(newMarkers);
        });
      }
    } catch(e) {
      print('Error loading ev list: $e');
    }
  }

  Future<void> loadEcoShopMarkers() async {
    List<Map<String, dynamic>> eco_shop = await FireService().getEcoShop();
    Set<Marker> newMarkers = eco_shop.map((eco_shop) {
      final BitmapDescriptor markerIcon = _getMarkerIconForEcoShop();
      return Marker(
          markerId: MarkerId('eco_shop${eco_shop['name'].toString()}'),
          position: LatLng(
              eco_shop['latitude'] as double, eco_shop['longitude'] as double),
          infoWindow: InfoWindow(title: eco_shop['name'].toString()),
          icon: markerIcon,
          onTap: () {
            _onEcoShopMarkerTapped(MarkerId('eco_shop${eco_shop['name'].toString()}'));
          }
      );
    }).toSet();

    setState(() {
      if (!areEcoShopMarkersVisible) markers.clear();
      markers.addAll(newMarkers);
    });
  }

  Future<void> loadRefillMarkers() async {
    List<Map<String, dynamic>> refill = await FireService().getRefill();
    Set<Marker> newMarkers = refill.map((refill) {
      final BitmapDescriptor markerIcon = _getMarkerIconForRefill();
      return Marker(
          markerId: MarkerId('refill${refill['name'].toString()}'),
          position: LatLng(
              refill['latitude'] as double, refill['longitude'] as double),
          infoWindow: InfoWindow(title: refill['name'].toString()),
          icon: markerIcon,
          onTap: () {
            _onRefillMarkerTapped(MarkerId('refill${refill['name'].toString()}'));
          }
      );
    }).toSet();

    setState(() {
      if (!areRefillMarkersVisible) markers.clear();
      markers.addAll(newMarkers);
    });
  }

  Future<void> loadStoreMarkers() async {
    List<Map<String, dynamic>> store = await FireService().getStore();
    Set<Marker> newMarkers = store.map((store) {
      final BitmapDescriptor markerIcon = _getMarkerIconForStore();
      return Marker(
          markerId: MarkerId('store${store['name'].toString()}'),
          position: LatLng(
              store['latitude'] as double, store['longitude'] as double),
          infoWindow: InfoWindow(title: store['name'].toString()),
          icon: markerIcon,
          onTap: () {
            _onStoreMarkerTapped(MarkerId('store${store['name'].toString()}'));
          }
      );
    }).toSet();

    setState(() {
      if (!areStoreMarkersVisible) markers.clear();
      markers.addAll(newMarkers);
    });
  }

  BitmapDescriptor _getMarkerIcon() {
    // 적절한 조건에 따라 다른 색상의 아이콘을 반환
    if (areMarkersVisible) {
      return BitmapDescriptor.defaultMarker;
      //return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
    } else {
      return BitmapDescriptor.fromBytes(Uint8List(0));
      //return BitmapDescriptor.defaultMarker; // 수정 후 코드
      //return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
    }
  }

  BitmapDescriptor _getMarkerIconForEcoShop() {
    // 적절한 조건에 따라 다른 색상의 아이콘을 반환
    if (areEcoShopMarkersVisible) {
      return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure);
    } else {
      return BitmapDescriptor.fromBytes(Uint8List(0));
    }
  }

  BitmapDescriptor _getMarkerIconForRefill() {
    // 적절한 조건에 따라 다른 색상의 아이콘을 반환
    if (areRefillMarkersVisible) {
      return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose);
    } else {
      return BitmapDescriptor.fromBytes(Uint8List(0));
    }
  }

  BitmapDescriptor _getMarkerIconForStore() {
    // 적절한 조건에 따라 다른 색상의 아이콘을 반환
    if (areStoreMarkersVisible) {
      return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet);
    } else {
      return BitmapDescriptor.fromBytes(Uint8List(0));
    }
  }

  BitmapDescriptor _getMarkerIconForAcc() {
    // 적절한 조건에 따라 다른 색상의 아이콘을 반환
    if (areAccMarkersVisible) {
      return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange);
    } else {
      return BitmapDescriptor.fromBytes(Uint8List(0));
    }
  }

  BitmapDescriptor _getMarkerIconForCycle() {
    // 적절한 조건에 따라 다른 색상의 아이콘을 반환
    if (areBikeMarkersVisible) {
      return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);
    } else {
      return BitmapDescriptor.fromBytes(Uint8List(0));
    }
  }

  BitmapDescriptor _getMarkerIconForEv() {
    // 적절한 조건에 따라 다른 색상의 아이콘을 반환
    if (areEvMarkerVisible) {
      return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue);
    } else {
      return BitmapDescriptor.fromBytes(Uint8List(0));
    }
  }

  Future<void> _toggleEcoShopMarkers() async {
    setState(() {
      areEcoShopMarkersVisible = !areEcoShopMarkersVisible;
      if (areEcoShopMarkersVisible == false) {
        markers.removeWhere((marker) => marker.markerId.value.startsWith("eco_shop"));
      } else {
        loadEcoShopMarkers();
      }
    });
  }

  Future<void> _toggleStoreMarkers() async {
    setState(() {
      areStoreMarkersVisible = !areStoreMarkersVisible;
      if (areStoreMarkersVisible == false) {
        markers.removeWhere((marker) => marker.markerId.value.startsWith("store"));
      } else {
        loadStoreMarkers();
      }
    });
  }

  Future<void> _toggleRefillMarkers() async {
    setState(() {
      areRefillMarkersVisible = !areRefillMarkersVisible;
      if (areRefillMarkersVisible == false) {
        markers.removeWhere((marker) => marker.markerId.value.startsWith("refill"));
      } else {
        loadRefillMarkers();
      }
    });
  }

  Future<void> _toggleMarkers() async {
    setState(() {
      areMarkersVisible = !areMarkersVisible;
      if (areMarkersVisible == false) {
        markers.removeWhere((marker) => marker.markerId.value.startsWith("cafe"));
      } else {
        loadMarkers();
      }
    });
  }

  Future<void> _toggleBikeMarkers() async {
    setState(() {
      areBikeMarkersVisible = !areBikeMarkersVisible;
      if (!areBikeMarkersVisible) {
        markers.removeWhere((marker) => marker.markerId.value.startsWith("bike"));
      } else {
        loadCycleMarkers();
      }
    });
  }


  Future<void> _toggleAccMarkers() async {
    setState(() {
      areAccMarkersVisible = !areAccMarkersVisible;
      if (!areAccMarkersVisible) {
        markers.removeWhere((marker) => marker.markerId.value.startsWith("acc"));
      } else {
        loadAccMarkers();
      }
    });
  }

  Future<void> _toggleEvMarkers() async {
    setState(() {
      areEvMarkerVisible = !areEvMarkerVisible;
      if (!areEvMarkerVisible) {
        markers.removeWhere((marker) => marker.markerId.value.startsWith("ev"));
      } else {
        loadEvMarkers();
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
      print("위치서비스가 비활성화되어있습니다.");
    }

    // 위치 권한 확인
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // 위치 권한이 거부된 경우 권한 요청
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // 사용자가 위치 권한을 거부한 경우 처리
        print("위치 권한을 거부하였습니다.");
      }
    }

    Position position = await Geolocator.getCurrentPosition();

    print("Received location: ${position.latitude}, ${position.longitude}");

    setState(() {
      // markers.clear();
      // markers.add(
      //   Marker(
      //     markerId: MarkerId('userLocation'),
      //     position: LatLng(position.latitude, position.longitude),
      //     infoWindow: InfoWindow(title: 'Your Location'),
      //   ),
      // );
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

  Future<void> _onMarkerTapped(MarkerId markerId) async {
    if (markerId.value.startsWith('acc')) {
      String contentid = markerId.value.substring(3);
      Accommodation? tappedAccommodation;
      List<Accommodation?> accommodations = await AccommodationRepository().getAccommodationDetails(contentid);
      if (accommodations.isNotEmpty) {
        tappedAccommodation = accommodations.first;
      }
      if (tappedAccommodation != null) {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                        tappedAccommodation!.title!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                        textAlign: TextAlign.center
                    ),
                    SizedBox(height: 10.0),
                    Text('Address: ${tappedAccommodation.add1} ${tappedAccommodation.add2}'),
                    SizedBox(height: 8.0),
                    Text('Tel: ${tappedAccommodation.tel}'),
                    SizedBox(height: 20.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () async {
                              List<String> currentFavoritesList = await GetIt.I<LocalDatabase>().getFavoritesList();

                              if (currentFavoritesList.contains(tappedAccommodation!.title!)) {
                                currentFavoritesList.remove(tappedAccommodation!.title!);
                                currentFavoritesList.insert(0, tappedAccommodation!.title!);
                              } else {
                                currentFavoritesList.insert(0, tappedAccommodation!.title!);
                              }
                              // Update the Favorites table in the database
                              await GetIt.I<LocalDatabase>().updateFavorites(currentFavoritesList);

                              // Retrieve and print the list of favorites
                              List<String> favoritesList = await GetIt.I<LocalDatabase>().getFavoritesList();

                              print('Favorites List: $favoritesList');

                              Navigator.pop(context);
                            },
                            child: Text(
                              'Add to Plan',
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child:
                            Text('Close'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }
    }
  }

  Future<void> _onEvMarkerTapped(MarkerId markerId) async {
    // print('Current BuildContext hashCode: ${context.hashCode}');
    if (markerId.value.startsWith('ev')) {
      String cpId = markerId.value.substring(2);
      // print('Trying to get details for csId: $cpId');
      Ev? tappedEv;
      List<Ev?> evs = await EvRepository().getEvDetails(cpId);
      // print('Ev details: $evs');

      if (evs.isNotEmpty) {
        tappedEv = evs.first;
      }
      if (tappedEv != null) {
        // EvRepository evRepository = EvRepository();
        // String chargeStatusText = evRepository.getChargeStatusText(tappedEv.cpStat);
        // String chargeTypeText = evRepository.getChargeTypeText(tappedEv.cpTp);

        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            // print('Modal Bottom Sheet BuildContext hashCode: ${context.hashCode}');
            return Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        tappedEv!.csNm,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                        textAlign: TextAlign.center
                    ),
                    SizedBox(height: 10.0),
                    Text('Address: ${tappedEv.addr}'),
                    SizedBox(height: 8.0),
                    Text('Charge Name: ${tappedEv.cpNm}'),
                    // SizedBox(height: 8.0),
                    // Text('Charge Type: $chargeTypeText'),
                    // SizedBox(height: 8.0),
                    // Text('Status: $chargeStatusText'),
                    SizedBox(height: 20.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () async {
                              // Your favorite icon button action
                              if (favorites.contains(tappedEv!.csNm)) {
                                favorites.add(tappedEv!.csNm); // 리스트의 맨 앞에 추가
                              }
                              else{
                                favorites.remove(tappedEv!.csNm);
                                favorites.insert(0, tappedEv!.csNm);
                              }

                              // 데이터베이스에 업데이트된 favorites 리스트 반영
                              await GetIt.I<LocalDatabase>().updateFavorites(favorites);

                              Navigator.pop(context);
                            },
                            child: Text(
                              'Add to Plan',
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () {
                              // Your favorite icon button action
                              Navigator.pop(context);
                            },
                            child:
                            Text('Close'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }
    }
  }

  Future<void> _onCycleMarkerTapped(MarkerId markerId) async {
    if (markerId.value.startsWith('bike')) {
      String rentId = markerId.value.substring(4);
      // print('Trying to get details for csId: $rentId');
      Cycle? tappedCycle;
      List<Cycle?> cycles = await CycleRepository().getEvDetails(rentId);
      // print('Cycle details: $cycles');

      if (cycles.isNotEmpty) {
        tappedCycle = cycles.first;
      }
      if (tappedCycle != null) {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            // print('Modal Bottom Sheet BuildContext hashCode: ${context.hashCode}');
            return Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        tappedCycle!.rentNm,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                        textAlign: TextAlign.center
                    ),
                    SizedBox(height: 10.0),
                    Text('Address: ${tappedCycle.staAdd1}'),
                    SizedBox(height: 8.0),
                    Text('         ${tappedCycle.staAdd2}'),
                    SizedBox(height: 8.0),
                    Text('Number of bike hold: ${tappedCycle.holdNum}'),
                    SizedBox(height: 20.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () async {
                              // Your favorite icon button action
                              List<String> currentFavoritesList = await GetIt.I<LocalDatabase>().getFavoritesList();

                              if (currentFavoritesList.contains(tappedCycle!.rentNm)) {
                                currentFavoritesList.remove(tappedCycle!.rentNm);
                                currentFavoritesList.insert(0, tappedCycle!.rentNm);
                              } else {
                                currentFavoritesList.insert(0, tappedCycle!.rentNm);
                              }
                              // Update the Favorites table in the database
                              await GetIt.I<LocalDatabase>().updateFavorites(currentFavoritesList);

                              Navigator.pop(context);
                            },
                            child: Text(
                              'Add to Plan',
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () {
                              // Your favorite icon button action
                              Navigator.pop(context);
                            },
                            child:
                            Text('Close'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }
    }
  }

  Future<void> _onCafeMarkerTapped(MarkerId markerId) async {
    // 마커 ID가 카페 ID와 일치한다고 가정합니다.
    FireService fireService = FireService();
    List<Map<String, dynamic>> cafeData = await fireService.getFireModels();
    String cafeId = markerId.value;

    // 탭한 마커에 대한 카페 데이터 찾기
    Map<String, dynamic>? tappedCafe;
    for (var cafe in cafeData) {
      if ("cafe${cafe['shop'].toString()}" == cafeId) {
        tappedCafe = cafe;
        break;
      }
    }

    // 데이터 출력
    if (tappedCafe != null) {
      // showModalBottomSheet를 사용하여 정보 표시
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    tappedCafe?['shop'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.0),
                  Text('Name: ${tappedCafe?['shop']}'),
                  SizedBox(height: 8.0),
                  Text('latitude: ${tappedCafe?['latitude']}'),
                  SizedBox(height: 8.0),
                  Text('longitude: ${tappedCafe?['longitude']}'),
                  SizedBox(height: 20.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () async {
                            // Your favorite icon button action
                            List<String> currentFavoritesList = await GetIt.I<LocalDatabase>().getFavoritesList();

                            if (currentFavoritesList.contains('${tappedCafe?['shop']}')) {
                              currentFavoritesList.remove('${tappedCafe?['shop']}');
                              currentFavoritesList.insert(0, '${tappedCafe?['shop']}');
                            } else {
                              currentFavoritesList.insert(0, '${tappedCafe?['shop']}');
                            }
                            // Update the Favorites table in the database
                            await GetIt.I<LocalDatabase>().updateFavorites(currentFavoritesList);

                            Navigator.pop(context);
                          },
                          child: Text('Add to plan'),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () {
                            // Your favorite icon button action
                            Navigator.pop(context);
                          },
                          child: Text('Close'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  Future<void> _onEcoShopMarkerTapped(MarkerId markerId) async {
    // 마커 ID가 샵 ID와 일치한다고 가정합니다.
    FireService fireService = FireService();
    List<Map<String, dynamic>> ecoData = await fireService.getEcoShop();
    String ecoShopId = markerId.value;

    // 탭한 마커에 대한 데이터 찾기
    Map<String, dynamic>? tappedEcoShop;
    for (var eco_shop in ecoData) {
      if ("eco_shop${eco_shop['name'].toString()}" == ecoShopId) {
        tappedEcoShop = eco_shop;
        break;
      }
    }

    // 데이터 출력
    if (tappedEcoShop != null) {
      // showModalBottomSheet를 사용하여 정보 표시
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    tappedEcoShop?['name'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.0),
                  Text('Address: ${tappedEcoShop?['address']}'),
                  SizedBox(height: 8.0),
                  Text('tel: ${tappedEcoShop?['tel']}'),
                  SizedBox(height: 20.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () async {
                            addToPlan(tappedEcoShop);
                            // Your favorite icon button action
                            List<String> currentFavoritesList = await GetIt.I<LocalDatabase>().getFavoritesList();

                            if (currentFavoritesList.contains('${tappedEcoShop?['address']}')) {
                              currentFavoritesList.remove('${tappedEcoShop?['address']}');
                              currentFavoritesList.insert(0,'${tappedEcoShop?['address']}' );
                            } else {
                              currentFavoritesList.insert(0,'${tappedEcoShop?['address']}' );
                            }
                            // Update the Favorites table in the database
                            await GetIt.I<LocalDatabase>().updateFavorites(currentFavoritesList);



                            Navigator.pop(context);
                          },
                          child: Text('Add to Plan'),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () {
                            // Your favorite icon button action
                            Navigator.pop(context);
                          },
                          child: Text('Close'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  Future<void> _onRefillMarkerTapped(MarkerId markerId) async {
    // 마커 ID가 샵 ID와 일치한다고 가정합니다.
    FireService fireService = FireService();
    List<Map<String, dynamic>> refillData = await fireService.getRefill();
    String refillId = markerId.value;

    // 탭한 마커에 대한 데이터 찾기
    Map<String, dynamic>? tappedRefill;
    for (var refill in refillData) {
      if ("refill${refill['name'].toString()}" == refillId) {
        tappedRefill = refill;
        break;
      }
    }

    // 데이터 출력
    if (tappedRefill != null) {
      // showModalBottomSheet를 사용하여 정보 표시
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    tappedRefill?['name'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.0),
                  Text('Address: ${tappedRefill?['address']}'),
                  SizedBox(height: 8.0),
                  Text('tel: ${tappedRefill?['tel']}'),
                  SizedBox(height: 20.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () async {
                            addToPlan(tappedRefill);
                            // Your favorite icon button action

                            List<String> currentFavoritesList = await GetIt.I<LocalDatabase>().getFavoritesList();

                            if (currentFavoritesList.contains(tappedRefill?['name'])) {
                              currentFavoritesList.remove(tappedRefill?['name']);
                              currentFavoritesList.insert(0, tappedRefill?['name']);
                            } else {
                              currentFavoritesList.insert(0, tappedRefill?['name']);
                            }
                            // Update the Favorites table in the database
                            await GetIt.I<LocalDatabase>().updateFavorites(currentFavoritesList);


                            Navigator.pop(context);
                          },
                          child: Text('Add to Plan'),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () {
                            // Your favorite icon button action
                            Navigator.pop(context);
                          },
                          child: Text('Close'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  Future<void> _onStoreMarkerTapped(MarkerId markerId) async {
    // 마커 ID가 샵 ID와 일치한다고 가정합니다.
    FireService fireService = FireService();
    List<Map<String, dynamic>> storeData = await fireService.getStore();
    String storeId = markerId.value;

    // 탭한 마커에 대한 데이터 찾기
    Map<String, dynamic>? tappedStore;
    for (var store in storeData) {
      if ("store${store['name'].toString()}" == storeId) {
        tappedStore = store;
        break;
      }
    }

    // 데이터 출력
    if (tappedStore != null) {
      // showModalBottomSheet를 사용하여 정보 표시
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    tappedStore?['name'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.0),
                  Text('Address: ${tappedStore?['address']}'),
                  SizedBox(height: 8.0),
                  Text('tel: ${tappedStore?['tel']}'),
                  SizedBox(height: 20.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () async {
                            addToPlan(tappedStore);
                            // Your favorite icon button action
                            List<String> currentFavoritesList = await GetIt.I<LocalDatabase>().getFavoritesList();

                            if (currentFavoritesList.contains(tappedStore?['name'])) {
                              currentFavoritesList.remove(tappedStore?['name']);
                              currentFavoritesList.insert(0, tappedStore?['name']);
                            } else {
                              currentFavoritesList.insert(0, tappedStore?['name']);
                            }
                            // Update the Favorites table in the database
                            await GetIt.I<LocalDatabase>().updateFavorites(currentFavoritesList);


                            Navigator.pop(context);
                          },
                          child: Text('Add to Plan'),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () {
                            // Your favorite icon button action
                            Navigator.pop(context);
                          },
                          child: Text('Close'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  // Add to Plan 기능을 수행하는 함수
  void addToPlan(Map<String, dynamic>? store) {
    // 여기서 store를 즐겨찾기에 추가하는 작업을 수행
    if (store != null) {
      print('Added to Plan: ${store['name']}');
      // 여기에 실제로 즐겨찾기에 추가하는 로직을 구현
      // 예: 로컬 상태 업데이트 또는 데이터베이스에 추가
    }
  }

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50.0,
                        height: 70.0,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            print("Button Pressed");
                            _toggleAccMarkers();
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('assets/accommodation_1.png'),
                                width: 30.0,
                                height: 30.0,
                              ),
                              //SizedBox(height: 5.0), // Adjust the spacing between image and text
                              Text(
                                '숙소',
                                style: TextStyle(
                                  fontFamily: "Gy",
                                  fontSize: 9.0,
                                  color: Colors.black,
                                  // Add any additional text style properties here
                                ),
                              ),
                            ],
                          ),
                          // child: Image(
                          //   image: AssetImage('assets/accommodation_1.png'),
                          //   width: 30.0,
                          //   height: 30.0,
                          // ),
                        ),
                      ),
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                      //     minimumSize: Size(10, 10),
                      //   ),
                      //   // style: ButtonStyle(
                      //   //   backgroundColor:
                      //   //       MaterialStateProperty.all(Colors.white),
                      //   // ),
                      //   onPressed: () {
                      //     print("Button Pressed");
                      //
                      //     _toggleAccMarkers();
                      //   },
                      //   child: Image(
                      //     image: AssetImage('assets/accommodation_1.png'),
                      //     width: 15.0,
                      //   ),
                      // ),
                      Container(
                        width: 50.0,
                        height: 70.0,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),
                          ),
                          // style: ButtonStyle(
                          //   backgroundColor:
                          //       MaterialStateProperty.all(Colors.white),
                          // ),
                          onPressed: () {
                            print("Button Pressed");

                            _toggleMarkers();
                            // setState(() {
                            //   areMarkersVisible =
                            //       !areMarkersVisible; // Toggle visibility state
                            // });
                            // loadMarkers();
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('assets/restaurant_1.png'),
                                width: 30.0,
                                height: 30.0,
                              ),
                              //SizedBox(height: 5.0), // Adjust the spacing between image and text
                              Text(
                                '음식점',
                                style: TextStyle(
                                  fontFamily: "Gy",
                                  fontSize: 9.0,
                                  color: Colors.black,
                                  // Add any additional text style properties here
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),
                      //   ),
                      //   // style: ButtonStyle(
                      //   //   backgroundColor:
                      //   //       MaterialStateProperty.all(Colors.white),
                      //   // ),
                      //   onPressed: () {
                      //     print("Button Pressed");
                      //
                      //     _toggleMarkers();
                      //     // setState(() {
                      //     //   areMarkersVisible =
                      //     //       !areMarkersVisible; // Toggle visibility state
                      //     // });
                      //     // loadMarkers();
                      //   },
                      //   child: Image(
                      //     image: AssetImage('assets/restaurant_1.png'),
                      //     width: 15.0,
                      //   ),
                      // ),
                      Container(
                        width: 50.0,
                        height: 70.0,
                        child:TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),
                          ),
                          // style: ButtonStyle(
                          //   backgroundColor:
                          //       MaterialStateProperty.all(Colors.white),
                          // ),
                          onPressed: () {
                            print("Button Pressed");

                            _toggleBikeMarkers();
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('assets/bicycle_1.png'),
                                width: 30.0,
                                height: 30.0,
                              ),
                              //SizedBox(height: 5.0), // Adjust the spacing between image and text
                              Text(
                                '자전거',
                                style: TextStyle(
                                  fontFamily: "Gy",
                                  fontSize: 9.0,
                                  color: Colors.black,
                                  // Add any additional text style properties here
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                      //     minimumSize: Size(15, 15),
                      //   ),
                      //   // style: ButtonStyle(
                      //   //   backgroundColor:
                      //   //       MaterialStateProperty.all(Colors.white),
                      //   // ),
                      //   onPressed: () {
                      //     print("Button Pressed");
                      //
                      //     _toggleBikeMarkers();
                      //   },
                      //   child: Image(
                      //     image: AssetImage('assets/bicycle_1.png'),
                      //     width: 15.0,
                      //   ),
                      // ),
                      Container(
                        width: 50.0,
                        height: 70.0,
                        child:TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),
                          ),
                          // style: ButtonStyle(
                          //   backgroundColor:
                          //       MaterialStateProperty.all(Colors.white),
                          // ),
                          onPressed: () {
                            _toggleEvMarkers();
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('assets/ev_car_1.png'),
                                width: 30.0,
                                height: 30.0,
                              ),
                              //SizedBox(height: 5.0), // Adjust the spacing between image and text
                              Text(
                                '전기차',
                                style: TextStyle(
                                  fontFamily: "Gy",
                                  fontSize: 9.0,
                                  color: Colors.black,
                                  // Add any additional text style properties here
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                      //     minimumSize: Size(15, 15),
                      //   ),
                      //   // style: ButtonStyle(
                      //   //   backgroundColor:
                      //   //       MaterialStateProperty.all(Colors.white),
                      //   // ),
                      //   onPressed: () {
                      //      _toggleEvMarkers();
                      //   },
                      //   child: Image(
                      //     image: AssetImage('assets/ev_car_1.png'),
                      //     width: 15.0,
                      //   ),
                      // ),
                      Container(
                        width: 50.0,
                        height: 70.0,
                        child:TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),
                          ),
                          // style: ButtonStyle(
                          //   backgroundColor:
                          //   MaterialStateProperty.all(Colors.white),
                          // ),
                          onPressed: () {
                            _toggleEcoShopMarkers();
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('assets/eco_cafe.png'),
                                width: 30.0,
                                height: 30.0,
                              ),
                              //SizedBox(height: 5.0), // Adjust the spacing between image and text
                              Text(
                                '친환경',
                                style: TextStyle(
                                  fontFamily: "Gy",
                                  fontSize: 9.0,
                                  color: Colors.black,
                                  // Add any additional text style properties here
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                      //     minimumSize: Size(15, 15),
                      //   ),
                      //   // style: ButtonStyle(
                      //   //   backgroundColor:
                      //   //   MaterialStateProperty.all(Colors.white),
                      //   // ),
                      //   onPressed: () {
                      //     _toggleEcoShopMarkers();
                      //   },
                      //   child: Image(
                      //     image: AssetImage('assets/eco_cafe.png'),
                      //     width: 15.0,
                      //   ),
                      // ),
                      Container(
                        width: 50.0,
                        height: 70.0,
                        child:TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),
                          ),
                          // style: ButtonStyle(
                          //   backgroundColor:
                          //   MaterialStateProperty.all(Colors.white),
                          // ),
                          onPressed: () {
                            _toggleRefillMarkers();
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('assets/refill.png'),
                                width: 30.0,
                                height: 30.0,
                              ),
                              //SizedBox(height: 5.0), // Adjust the spacing between image and text
                              Text(
                                '리필샵',
                                style: TextStyle(
                                  fontFamily: "Gy",
                                  fontSize: 9.0,
                                  color: Colors.black,
                                  // Add any additional text style properties here
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                      //     minimumSize: Size(15, 15),
                      //   ),
                      //   // style: ButtonStyle(
                      //   //   backgroundColor:
                      //   //   MaterialStateProperty.all(Colors.white),
                      //   // ),
                      //   onPressed: () {
                      //     _toggleRefillMarkers();
                      //   },
                      //   child: Image(
                      //     image: AssetImage('assets/refill.png'),
                      //     width: 15.0,
                      //   ),
                      // ),
                      Container(
                        width: 50.0,
                        height: 70.0,
                        child:TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),
                          ),
                          // style: ButtonStyle(
                          //   backgroundColor:
                          //   MaterialStateProperty.all(Colors.white),
                          // ),
                          onPressed: () {
                            _toggleStoreMarkers();
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('assets/eco_shop_2.png'),
                                width: 30.0,
                                height: 30.0,
                              ),
                              //SizedBox(height: 5.0), // Adjust the spacing between image and text
                              Text(
                                '스토어',
                                style: TextStyle(
                                  fontFamily: "Gy",
                                  fontSize: 9.0,
                                  color: Colors.black,
                                  // Add any additional text style properties here
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                      //     minimumSize: Size(15, 15),
                      //   ),
                      //   // style: ButtonStyle(
                      //   //   backgroundColor:
                      //   //   MaterialStateProperty.all(Colors.white),
                      //   // ),
                      //   onPressed: () {
                      //     _toggleStoreMarkers();
                      //   },
                      //   child: Image(
                      //     image: AssetImage('assets/eco_shop_1.png'),
                      //     width: 15.0,
                      //   ),
                      // ),
                    ],
                  ),
                  // SizedBox(
                  //   height: 13,
                  // ),
                  Center(
                    child: SizedBox(
                      height:
                      // MediaQuery.of(context).size.height - 20,
                      405.0,
                      width: MediaQuery.of(context).size.width - 10,
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
                            var currentLocation = await getCurrentLocation();
                            mapController.moveCamera(CameraUpdate.newLatLng(
                                LatLng(currentLocation.latitude,
                                    currentLocation.longitude)));
                            setState(() {});
                          })),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}