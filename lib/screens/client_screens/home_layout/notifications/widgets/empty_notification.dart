import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/app_text.dart';

class EmptyNotification extends StatelessWidget {
  const EmptyNotification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/img/noNotifications.png'),
          AppText(
            text: 'لا يوجد اشعارات حاليا',
            size: 24.sp,
          ),
        ],
      ),
    );
  }
}
