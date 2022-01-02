import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trek_high/core/widgets/custom_notification.dart';
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

  @override
  void initState() {
    context.read(locationController.notifier).determinePosition(context);
    context.read(locationController.notifier).determinePosition(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const Drawer(
        child: DrawerNavBar(),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            gradient: LinearGradient(
              colors: [Colors.indigoAccent, Colors.indigoAccent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        title: Text(
          tr('current_location'),
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(color: Colors.white),
        ),
        actions: const [CustomNotification()],
      ),
      body: HookBuilder(
        builder: (context) {
          final currentLocation = useProvider(currentLocationProvider);
          Set<Marker> _marker() {
            return <Marker>{
              Marker(
                markerId: const MarkerId('Current Location'),
                position: LatLng(
                  currentLocation.currentLocationData?.latitude ?? 0,
                  currentLocation.currentLocationData?.longitude ?? 0,
                ),
                infoWindow: const InfoWindow(title: 'My Current Location'),
              )
            };
          }

          return SizedBox(
            height: size.height - 20,
            child: GoogleMap(
              markers: _marker(),
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  currentLocation.currentLocationData?.latitude ?? 0,
                  currentLocation.currentLocationData?.longitude ?? 0,
                ),
                zoom: 2,
              ),
              onMapCreated: (controller) {
                googleMapController = controller;
              },
            ),
          );
        },
      ),
    );
  }
}
