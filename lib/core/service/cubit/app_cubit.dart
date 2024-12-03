import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makhdom/screens/client_screens/home_layout/orders/orders.dart';
import 'package:http/http.dart' as http;

import '../../../screens/client_screens/home_layout/home/home.dart';
import '../../../screens/client_screens/home_layout/notifications/notifications.dart';
import '../../../screens/client_screens/home_layout/profile/profile.dart';
import '../../cache/cache_helper.dart';
import '../../constants/contsants.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  double? lat = 0;
  double? lng = 0;
  String? address;

  void changeAddress({required String newAddress}) {
    address = newAddress;
    emit(ChangeIndex());
  }

  List introList = [];
  Future intro() async {
    emit(GetIntroLoading());
    http.Response response = await http.post(
      Uri.parse("${baseUrl}api/intro"),
      body: {"lang": CacheHelper.getLang()},
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    debugPrint(data.toString());
    introList = data["data"];

    if (data["key"] == 1) {
      emit(GetIntroSuccess());
    } else {
      emit(GetIntroFailure(error: data["msg"]));
    }
  }
int chooseTimeIndex = -1;
  chooseTimeIndexFun(int index) {
    chooseTimeIndex = index;
    emit(ChooseTimeIndex());
  }

  int chooseDateIndex = 0;
  chooseDateIndexFun(int index) {
    chooseDateIndex = index;
    emit(ChooseTimeIndex());
  }
  int currentScreenIndex = 0;
  List<Widget> screens = [
    const Home(),
    const Orders(),
    const Profile(),
    const Notifications(),
  ];
  int screenIndex = 0;

  void changeScreenIndex({required int index}) {
    screenIndex = index;
    emit(ChangeScreenIndex());
  }
}
