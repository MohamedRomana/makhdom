// ignore_for_file: use_build_context_synchronously
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:makhdom/core/widgets/app_router.dart';
import 'package:makhdom/core/widgets/app_text.dart';
import 'package:makhdom/screens/client_screens/estate_details/estate_details.dart';
import 'package:screenshot/screenshot.dart';
import '../constants/colors.dart';
import '../service/cubit/app_cubit.dart';
import '../widgets/app_cached.dart';
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
  final Set<Marker> _markers = {};

  ScreenshotController screenshotController = ScreenshotController();
  Future<BitmapDescriptor> _captureWidgetAsMarker({
    required String image,
    required String title,
    required String address,
    required String price,
  }) async {
    Uint8List markerImage =
        await screenshotController.captureFromWidget(Container(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),

      height: 30.h,
      width: 80.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            height: 20.w,
            width: 20.w,
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsetsDirectional.only(end: 3.w, ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary,
                  blurRadius: 5.r,
                  spreadRadius: -1.r,
                  offset: Offset(0, 5.r),
                ),
              ],
            ),
            child: AppCachedImage(image: image),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: title,
                size: 5.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.text,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 5.sp,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  AppText(
                    text: address,
                    size: 3.5.sp,
                    color: Colors.grey,
                  ),
                ],
              ),
              Row(
                children: [
                  AppText(
                    text: price,
                    size: 5.sp,
                    color: AppColors.text,
                    fontWeight: FontWeight.w800,
                  ),
                  AppText(
                    text: ' ر.س',
                    color: AppColors.text,
                    size: 5.sp,
                  )
                ],
              )
            ],
          )
        ],
      ),
    ));
    return BitmapDescriptor.bytes(markerImage);
  }

  Future<void> _generateDynamicMarker() async {
    for (var location in AppCubit.get(context).allDepartmentModel) {
      final markerIcon = await _captureWidgetAsMarker(
        image: location.firstImage,
        title: location.title,
        address: location.address,
        price: location.price.toString(),
      );
      _markers.add(
        Marker(
          markerId: MarkerId(location.id.toString()),
          position: LatLng(location.lat, location.lng),
          icon: markerIcon,
          onTap: () {
            debugPrint(location.title);
            AppRouter.pop(context);
            AppRouter.navigateTo(
              context,
              EstateDetails(
                id: location.id,
              ),
            );
          },
        ),
      );
    }
    setState(() {});
  }

  @override
  void initState() {
    getMyCurrentLocation();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _generateDynamicMarker();
    });
    super.initState();
  }

  Future<void> getMyCurrentLocation() async {
    position = await LocationHelper.determinePosition().whenComplete(() {
      setState(
        () {},
      );
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
                      // onTap: (argument) async {
                      //   myMarkers.clear();
                      //   final placeMarks = await placemarkFromCoordinates(
                      //     argument.latitude,
                      //     argument.longitude,
                      //   );
                      //   AppCubit.get(context).changeAddress(
                      //     newAddress: placeMarks[0].street ?? "",
                      //   );
                      //   debugPrint(AppCubit.get(context).address);
                      //   setState(() {
                      //     AppCubit.get(context).lat = argument.latitude;
                      //     AppCubit.get(context).lng = argument.longitude;
                      //     debugPrint(
                      //         "${AppCubit.get(context).lat} + ${AppCubit.get(context).lng}");
                      //   });

                      //   myMarkers.add(Marker(
                      //       markerId: const MarkerId("2"),
                      //       position: argument,
                      //       infoWindow: InfoWindow(
                      //           title: AppCubit.get(context).address)));
                      // },
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
                            // myMarkers.add(
                            //   Marker(
                            //       markerId: const MarkerId('1'),
                            //       position: LatLng(
                            //           position!.latitude, position!.longitude),
                            //       infoWindow: InfoWindow(
                            //         title: AppCubit.get(context).address ??
                            //             "location",
                            //       ),
                            //       onTap: () {}),
                            // );
                          },
                        );
                      },
                      markers: _markers,
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
