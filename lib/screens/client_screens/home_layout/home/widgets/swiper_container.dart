import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/service/cubit/app_cubit.dart';
import 'package:makhdom/core/widgets/app_cached.dart';

class SwiperContainer extends StatelessWidget {
  const SwiperContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Center(
          child: Padding(
            padding: EdgeInsets.only(top: 24.h),
            child: SizedBox(
              height: 150.h,
              child: Swiper(
                itemBuilder: (context, index) => ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: AppCachedImage(
                        image: AppCubit.get(context).sliders[index]["image"])),
                autoplay: true,
                itemCount: AppCubit.get(context).sliders.length,
                scrollDirection: Axis.horizontal,
                curve: Curves.fastOutSlowIn,
                pagination: SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                    color: const Color.fromARGB(153, 158, 158, 158),
                    activeColor: Colors.black,
                    size: 8.r,
                    activeSize: 11.r,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
