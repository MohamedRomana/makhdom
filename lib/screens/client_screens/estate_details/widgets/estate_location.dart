import 'dart:async';
import 'dart:collection';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:makhdom/core/service/cubit/app_cubit.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../generated/locale_keys.g.dart';

class EstateLocation extends StatefulWidget {
  const EstateLocation({super.key});

  @override
  State<EstateLocation> createState() => _EstateLocationState();
}

class _EstateLocationState extends State<EstateLocation> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  var myMarkers = HashSet<Marker>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: AppText(
                text: LocaleKeys.property_location.tr(),
                size: 18.sp,
                color: AppColors.text,
                family: 'DINArabic-Medium',
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              height: 178.h,
              width: 327.w,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: AppColors.secondray,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: GoogleMap(
                mapType: MapType.terrain,
                myLocationEnabled: true,
                zoomControlsEnabled: false,
                myLocationButtonEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    AppCubit.get(context).showEstateList["lat"],
                    AppCubit.get(context).showEstateList["lng"],
                  ),
                  zoom: 15,
                ),
                onMapCreated: (GoogleMapController googleMapController) async {
                  _controller.complete(googleMapController);
                  setState(
                    () {
                      myMarkers.add(
                        Marker(
                            markerId: const MarkerId('1'),
                            position: LatLng(
                                AppCubit.get(context).showEstateList["lat"],
                                AppCubit.get(context).showEstateList["lng"]),
                            infoWindow: InfoWindow(
                              title: AppCubit.get(context)
                                  .showEstateList["address"],
                            ),
                            onTap: () {}),
                      );
                    },
                  );
                },
                markers: myMarkers,
              ),
            ),
            SizedBox(height: 47.h),
          ],
        );
      },
    );
  }
}
