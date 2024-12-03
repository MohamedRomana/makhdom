import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwiperContainer extends StatelessWidget {
  const SwiperContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 24.h),
        child: Container(
          height: 150.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Swiper(
            itemBuilder: (context, index) => Image.asset(
              'assets/img/swiper.png',
              fit: BoxFit.cover,),
            autoplay: true,
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            curve: Curves.fastOutSlowIn,
            pagination: SwiperPagination(
              alignment: Alignment.bottomCenter,
              builder: DotSwiperPaginationBuilder(
                color:  const Color.fromARGB(153, 158, 158, 158),
                activeColor: Colors.black,
                size: 8.r,
                activeSize: 11.r,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
