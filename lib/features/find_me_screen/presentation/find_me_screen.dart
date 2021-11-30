import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trek_high/features/find_me_screen/infrastructure/current_location_provider.dart';
import 'package:trek_high/features/home_screen/presentation/widgets/drawer_nav_bar.dart';

class FindMeScreen extends StatefulHookWidget {
  const FindMeScreen({Key? key}) : super(key: key);

  @override
  _FindMeScreenState createState() => _FindMeScreenState();
}

class _FindMeScreenState extends State<FindMeScreen> {
  late BitmapDescriptor myIcon = BitmapDescriptor.defaultMarker;

  late GoogleMapController googleMapController;
  Set<Marker> allMarkers = {};
  final List<Marker> markers = [];

  void addMarker(LatLng cordinate) {
    final id = Random().nextInt(100);
    setState(() {
      allMarkers.add(
        Marker(
          position: cordinate,
          markerId: MarkerId(
            id.toString(),
          ),
          icon: myIcon,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const Drawer(
        child: DrawerNavBar(),
      ),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          tr('current_location'),
          style: GoogleFonts.ptSerif(
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
      body: HookBuilder(
        builder: (context) {
          final currentLocation = useProvider(currentLocationProvider);
          final currentLocationData = currentLocation.currentLocationData;
          return SizedBox(
            height: size.height - 20,
            child: GoogleMap(
              markers: allMarkers,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  currentLocationData?.latitude ?? 27.6588,
                  currentLocationData?.longitude ?? 85.3247,
                ),
                zoom: 2,
              ),
              onMapCreated: (controller) {
                setState(() {
                  googleMapController = controller;
                });
              },
              onTap: (cordinate) {
                googleMapController.animateCamera(
                  CameraUpdate.newLatLng(cordinate),
                );
                addMarker(cordinate);
              },
            ),
          );
        },
      ),
    );
  }
}
