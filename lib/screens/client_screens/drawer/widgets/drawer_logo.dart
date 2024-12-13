import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../gen/assets.gen.dart';

class DrawerLogo extends StatelessWidget {
  const DrawerLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 173.h,
      width: 283.w,
      decoration: BoxDecoration(
        color: const Color(0xff55679C),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(24.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 16.w, top: 50.h),
        child: Row(
          children: [
            Image.asset(
              Assets.img.logo.path,
              height: 84.h,
              width: 84.w,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
