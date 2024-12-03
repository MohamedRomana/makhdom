// ignore_for_file: use_build_context_synchronously
import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:makhdom/core/widgets/app_router.dart';
import '../constants/colors.dart';
import '../service/cubit/app_cubit.dart';
import 'location_helper.dart';

class Locationn extends StatefulWidget {
  final bool? isContainer;
  const Locationn({
    super.key,
    this.isContainer = true,
  });
  @override
  State<Locationn> createState() => _LocationState();
}

class _LocationState extends State<Locationn> {
  static Position? position;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  var myMarkers = HashSet<Marker>();

  @override
  void initState() {
    getMyCurrentLocation();
    super.initState();
  }

  Future<void> getMyCurrentLocation() async {
    position = await LocationHelper.determinePosition().whenComplete(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Stack(
            children: [
              position != null
                  ? GoogleMap(
                      mapType: MapType.terrain,
                      myLocationEnabled: true,
                      zoomControlsEnabled: false,
                      myLocationButtonEnabled: false,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(position!.latitude, position!.longitude),
                        zoom: 15,
                      ),
                      onTap: (argument) async {
                        myMarkers.clear();
                        final placeMarks = await placemarkFromCoordinates(
                          argument.latitude,
                          argument.longitude,
                        );
                        AppCubit.get(context).changeAddress(
                          newAddress: placeMarks[0].street ?? "",
                        );
                        debugPrint(AppCubit.get(context).address);
                        setState(() {
                          AppCubit.get(context).lat = argument.latitude;
                          AppCubit.get(context).lng = argument.longitude;
                          debugPrint(
                              "${AppCubit.get(context).lat} + ${AppCubit.get(context).lng}");
                        });

                        myMarkers.add(Marker(
                            markerId: const MarkerId("2"),
                            position: argument,
                            infoWindow: InfoWindow(
                                title: AppCubit.get(context).address)));
                      },
                      onMapCreated:
                          (GoogleMapController googleMapController) async {
                        _controller.complete(googleMapController);
                        final placeMarks = await placemarkFromCoordinates(
                            position!.latitude, position!.longitude);
                        setState(
                          () {
                            AppCubit.get(context).changeAddress(
                                newAddress: placeMarks[0].street ?? "");
                            debugPrint(AppCubit.get(context).address);
                            AppCubit.get(context).lat = position!.latitude;
                            AppCubit.get(context).lng = position!.longitude;
                            debugPrint(AppCubit.get(context).lat.toString());
                            debugPrint(AppCubit.get(context).lng.toString());
                            myMarkers.add(
                              Marker(
                                  markerId: const MarkerId('1'),
                                  position: LatLng(
                                      position!.latitude, position!.longitude),
                                  infoWindow: InfoWindow(
                                    title: AppCubit.get(context).address ??
                                        "location",
                                  ),
                                  onTap: () {}),
                            );
                          },
                        );
                      },
                      markers: myMarkers,
                    )
                  : const Center(
                      child:
                          CircularProgressIndicator(color: AppColors.primary),
                    ),
              if (widget.isContainer == true)
                ...{}
              else ...{
                PositionedDirectional(
                  top: 5.h,
                  end: 5.w,
                  child: IconButton(
                    onPressed: () {
                      AppRouter.pop(context);
                    },
                    icon: const Icon(
                      Icons.cancel_outlined,
                      color: Colors.red,
                    ),
                  ),
                ),
              }
            ],
          ),
        );
      },
    );
  }
}
