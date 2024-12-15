import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makhdom/core/service/cubit/app_cubit.dart';
import 'package:makhdom/core/widgets/custom_app_bar.dart';
import 'package:makhdom/core/widgets/custom_bottom_nav.dart';
import '../../custom_drawer.dart';
import 'widgets/chat_Bubbles.dart';
import 'widgets/chat_item_shimmer.dart';
import 'widgets/floating_send_message.dart';

class ChatDetails extends StatefulWidget {
  final String id;
  final String name;
  const ChatDetails({
    super.key,
    required this.name,
    required this.id,
  });

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  Timer? _timer;
  @override
  void initState() {
    AppCubit.get(context).getRoomChat(salerId: widget.id.toString());
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) async {
      AppCubit.get(context).getRoomChat(
        isLoading: false,
        salerId: widget.id.toString(),
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          drawer: CustomDrawer(langContext: context),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.h),
            child: CustomAppBar(
              scaffoldKey: scaffoldKey,
              title: widget.name,
            ),
          ),
          bottomNavigationBar: const CustomBottomNav(),
          floatingActionButton: state is GetRoomChatLoading
              ? const SizedBox()
              : const FloatingSendMessageContainer(),
          body: state is GetRoomChatLoading
              ? const ChatItemShimmer()
              : ListView.separated(
                  padding: EdgeInsetsDirectional.only(
                    top: 20.h,
                    start: 16.w,
                    end: 16.w,
                    bottom: 80.h,
                  ),
                  reverse: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: AppCubit.get(context).roomChat.length,
                  separatorBuilder: (context, index) => SizedBox(height: 5.h),
                  itemBuilder: (context, index) => ChatBubbles(
                    index: index,
                    roomChat: AppCubit.get(context).roomChat[index],
                  ),
                ),
        );
      },
    );
  }
}
