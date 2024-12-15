import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:makhdom/core/service/models/home_Model.dart';
import 'package:makhdom/core/service/models/notification_model.dart';
import 'package:makhdom/core/service/models/room_chat_model.dart';
import 'package:makhdom/core/service/models/rooms_model.dart';
import 'package:makhdom/core/service/models/sections_model.dart';
import 'package:makhdom/screens/client_screens/home_layout/orders/orders.dart';
import 'package:http/http.dart' as http;
import '../../../screens/client_screens/home_layout/home/home.dart';
import '../../../screens/client_screens/home_layout/notifications/notifications.dart';
import '../../../screens/client_screens/home_layout/profile/profile.dart';
import '../../cache/cache_helper.dart';
import '../../constants/contsants.dart';
import '../models/all_department_model.dart';
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

  int paymentIndex = -1;
  void changePaymentIndex({required int index}) {
    paymentIndex = index;
    emit(ChangeIndex());
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

  List sliders = [];
  List homeServices = [];
  Map valueAdded = {};

  Future homeData() async {
    emit(GetHomeDataLoading());
    http.Response response =
        await http.post(Uri.parse("${baseUrl}api/client_home"), body: {
      "lang": CacheHelper.getLang(),
      "user_id": CacheHelper.getUserId(),
    });

    Map<String, dynamic> data = jsonDecode(response.body);
    debugPrint(data.toString());

    if (data["key"] == 1) {
      sliders = data["data"]["sliders"];
      homeServices = data["data"]["services"];
      valueAdded = data;
      emit(GetHomeDataSuccess(message: data['msg']));
    } else {
      emit(GetHomeDataFailure(error: data["msg"]));
    }
  }

  List services = [];
  Map servicesMap = {};

  Future filterServices({bool isService = false, String filter = ""}) async {
    emit(GetServicesLoading());
    http.Response response =
        await http.post(Uri.parse("${baseUrl}api/services"), body: {
      "lang": CacheHelper.getLang(),
      "user_id": CacheHelper.getUserId(),
      "type": isService ? 'service' : 'product',
      if ("filter" != '') "filter": filter,
    });
    Map<String, dynamic> data = jsonDecode(response.body);
    debugPrint(data.toString());
    services = data["data"];

    if (data['key'] == 1) {
      services = data["data"];
      servicesMap = data;
      emit(GetServicesSuccess(message: data["msg"]));
    } else {
      emit(GetServicesFailure(error: data["msg"]));
    }
  }

  Map servicesList = {};
  List timeList = [];
  List dateList = [];
  Future getServices({required String serviceId}) async {
    emit(GetServicesLoading());
    http.Response response =
        await http.post(Uri.parse("${baseUrl}api/show-service"), body: {
      "lang": CacheHelper.getLang(),
      "user_id": CacheHelper.getUserId(),
      "service_id": serviceId,
    });
    Map<String, dynamic> data = jsonDecode(response.body);
    debugPrint(data.toString());

    if (data['key'] == 1) {
      servicesList = data['data'];
      dateList = data['data']['single_dates_format'];
      timeList = data['data']['single_dates_with_times'];
      emit(GetServicesSuccess(message: data["msg"]));
    } else {
      emit(GetServicesFailure(error: data["msg"]));
    }
  }

  Map provider = {};

  Future showProvider({required String providerId}) async {
    emit(ShowProviderLoading());
    http.Response response =
        await http.post(Uri.parse("${baseUrl}api/show-provider"), body: {
      "lang": CacheHelper.getLang(),
      "provider_id": providerId,
    });
    Map<String, dynamic> data = jsonDecode(response.body);
    debugPrint(data.toString());

    if (data['key'] == 1) {
      provider = data['data'];

      emit(ShowProviderSuccess());
    } else {
      emit(ShowProviderFailure(error: data["msg"]));
    }
  }

  List estatesList = [];
  late List<AllDepartmentModel> allDepartmentModel = [];
  Future getDepartments() async {
    emit(GetDepartmentLoading());
    http.Response response = await http
        .post(Uri.parse('${baseUrl}api/all-departments'), body: {
      "lang": CacheHelper.getLang(),
      "user_id": CacheHelper.getUserId()
    });
    Map<String, dynamic> data = jsonDecode(response.body);
    debugPrint(data.toString());

    if (data['key'] == 1) {
      allDepartmentModel = List<AllDepartmentModel>.from(
        (data["data"] ?? []).map((e) => AllDepartmentModel.fromJson(e)),
      );
      estatesList = data['data'];
      emit(GetDepartmentSuccess(message: data['msg']));
    } else {
      emit(GetDepartmentFailure(error: data['msg']));
    }
  }

  Map showEstateList = {};
  Future showDepartmenr({required String departmentId}) async {
    emit(ShowDepartmentLoading());
    http.Response response =
        await http.post(Uri.parse('${baseUrl}api/show-department'), body: {
      'lang': CacheHelper.getLang(),
      "department_id": departmentId,
    });
    Map<String, dynamic> data = jsonDecode(response.body);
    debugPrint(data.toString());
    if (data["key"] == 1) {
      showEstateList = data["data"];
      emit(ShowDepartmentSuccess(message: data['msg']));
    } else {
      emit(ShowDepartmentFailure(error: data['msg']));
    }
  }

  List ordersList = [];

  Future getOrders({required String status}) async {
    emit(GetOrdersLoading());
    http.Response response =
        await http.post(Uri.parse('${baseUrl}api/show-all-orders'), body: {
      "lang": CacheHelper.getLang(),
      "user_id": CacheHelper.getUserId(),
      "status": status,
    });
    Map<String, dynamic> data = jsonDecode(response.body);
    debugPrint(data.toString());

    if (data["key"] == 1) {
      ordersList = data["data"];
      emit(GetOrdersSuccess(message: data['msg']));
    } else {
      emit(GetOrdersFailure(error: data['msg']));
    }
  }

  Map storeOrderList = {};
  Future storeOrder({
    required String providerId,
    required String serviceId,
    required String subTotal,
    required String valueAdded,
    String date = "",
    String time = "",
    bool isScheduled = false,
  }) async {
    emit(StoreOrderLoading());
    try {
      http.Response response =
          await http.post(Uri.parse("${baseUrl}api/store-order"), body: {
        "lang": CacheHelper.getLang(),
        "user_id": CacheHelper.getUserId(),
        "provider_id": providerId,
        "service_id": serviceId,
        "sub_total": subTotal,
        "value_added": valueAdded,
        "total_before_promo": subTotal + valueAdded,
        "total_after_promo": subTotal + valueAdded,
        "payment_method": paymentIndex == 0 ? "cash" : "online",
        if (isScheduled) ...{
          "date": date,
          "time": time,
        },
      }).timeout(const Duration(milliseconds: 8000));

      if (response.statusCode == 500) {
        emit(ServerError());
      } else {
        Map<String, dynamic> data = jsonDecode(response.body);

        if (data["key"] == 1) {
          debugPrint(data["data"].toString());
          storeOrderList = data['data'];
          emit(StoreOrderSuccess());
          changePaymentIndex(index: -1);
        } else {
          debugPrint(data["msg"]);
          emit(StoreOrderFailure(error: data["msg"]));
        }
      }
    } catch (error) {
      if (error is TimeoutException) {
        debugPrint("Request timed out");
        emit(Timeoutt());
      } else {
        debugPrint(error.toString());
        emit(StoreOrderFailure(error: error.toString()));
      }
    }
  }

  Map showOrderList = {};
  Future showOrder({required String orderId}) async {
    emit(ShowOrderLoading());
    http.Response response =
        await http.post(Uri.parse("${baseUrl}api/show-order"), body: {
      "lang": CacheHelper.getLang(),
      "user_id": CacheHelper.getUserId(),
      "order_id": orderId,
    });
    Map<String, dynamic> data = jsonDecode(response.body);
    debugPrint(data.toString());

    if (data["key"] == 1) {
      showOrderList = data["data"];
      emit(ShowOrderSuccess());
    } else {
      emit(ShowOrderFailure(error: data["msg"]));
    }
  }

  Future changeOrderStatus(
      {required String orderId, required String status}) async {
    emit(ChangeOrderStatusLoading());
    http.Response response =
        await http.post(Uri.parse("${baseUrl}api/update-order-status"), body: {
      "lang": CacheHelper.getLang(),
      "user_id": CacheHelper.getUserId(),
      "order_id": orderId,
      "status": status,
    });
    Map<String, dynamic> data = jsonDecode(response.body);
    debugPrint(data.toString());

    if (data["key"] == 1) {
      emit(ChangeOrderStatusSuccess());
      getOrders(status: 'current');
    } else {
      emit(ChangeOrderStatusFailure(error: data["msg"]));
    }
  }

  Map showUserAccount = {};

  Future showUser() async {
    emit(ShowUserLoading());
    http.Response response =
        await http.post(Uri.parse("${baseUrl}api/show-user"), body: {
      "lang": CacheHelper.getLang(),
      "user_id": CacheHelper.getUserId(),
    });
    Map<String, dynamic> data = jsonDecode(response.body);
    debugPrint(data.toString());

    if (data["key"] == 1) {
      showUserAccount = data["data"];
      emit(ShowUserSuccess());
    } else {
      emit(ShowUserFailure(error: data["msg"]));
    }
  }

  List<NotificationModel> notificationModel = [];
  Future getNotifications() async {
    emit(GetNotificationsLoading());
    http.Response response =
        await http.post(Uri.parse("${baseUrl}api/show-notification"), body: {
      "lang": CacheHelper.getLang(),
      "user_id": CacheHelper.getUserId(),
    });
    Map<String, dynamic> data = jsonDecode(response.body);
    notificationModel = List<NotificationModel>.from(
        (data["data"] ?? []).map((e) => NotificationModel.fromJson(e)));
    debugPrint(data.toString());
    if (data["key"] == 1) {
      emit(GetNotificationsSuccess());
    } else {
      emit(GetNotificationsFailure(error: data["msg"]));
    }
  }

  Future deleteNotification(
      {required String notificationId, required int index}) async {
    emit(DeleteNotificationLoading());
    http.Response response =
        await http.post(Uri.parse("${baseUrl}api/delete-notification"), body: {
      "lang": CacheHelper.getLang(),
      "notification_id": notificationId,
    });
    Map<String, dynamic> data = jsonDecode(response.body);
    debugPrint(data.toString());
    if (data["key"] == 1) {
      notificationModel.removeAt(index);
      emit(DeleteNotificationSuccess());
    } else {
      emit(DeleteNotificationFailure(error: data["msg"]));
    }
  }

  List<File> profileImage = [];
  Future<void> getProfileImage() async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickMultiImage();
    profileImage = pickedImages
        .map((pickedImage) => File(pickedImage.path))
        .take(1)
        .toList();
    emit(ChooseImageSuccess());
  }

  void removeProfileImage() {
    profileImage.clear();
    emit(RemoveImageSuccess());
  }

  String? profileImageUrl;
  Future uploadProfileImage() async {
    emit(UploadImagesLoading());
    final request =
        http.MultipartRequest('POST', Uri.parse("${baseUrl}api/upload-image"));
    request.fields['lang'] = CacheHelper.getLang();

    for (var image in profileImage) {
      var stream = http.ByteStream(image.openRead());
      var length = await image.length();
      var multipartFile = http.MultipartFile(
        'image',
        stream,
        length,
        filename: image.path.split('/').last,
      );
      request.files.add(multipartFile);
    }
    final response = await request.send();
    final responseBody = await response.stream.bytesToString();

    Map<String, dynamic> data = jsonDecode(responseBody);
    profileImageUrl = data["app_url"];
    debugPrint("imageUrl is $profileImageUrl");

    if (data["key"] == 1) {
      emit(UploadImagesSuccess());
    } else {
      emit(UploadImagesFailure());
    }
  }

  String cityId = "";
  String sectionId = "";
  Future updateProfile({
    required String firstName,
    required String phone,
  }) async {
    if (profileImage.isNotEmpty) {
      uploadProfileImage();
    }
    emit(UpdateProfileLoading());
    try {
      http.Response response =
          await http.post(Uri.parse("${baseUrl}api/update-user"), body: {
        "lang": CacheHelper.getLang(),
        "user_id": CacheHelper.getUserId(),
        "first_name": firstName,
        "phone": phone,
        if (cityId != "") "city_id": cityId,
        if (profileImage.isNotEmpty) "avatar": profileImageUrl,
        if (CacheHelper.getUserType() == "saler" && sectionId != "")
          "section_id": sectionId,
      }).timeout(const Duration(milliseconds: 8000));

      if (response.statusCode == 500) {
        emit(ServerError());
      } else {
        Map<String, dynamic> data = jsonDecode(response.body);
        debugPrint(data.toString());

        if (data["key"] == 1) {
          emit(UpdateProfileSuccess(message: data["msg"]));
          cityId = "";
          profileImage.clear();
          profileImageUrl = null;
          showUser();
        } else {
          debugPrint(data["msg"]);
          emit(UpdateProfileFailure(error: data["msg"]));
        }
      }
    } catch (error) {
      if (error is TimeoutException) {
        debugPrint("Request timed out");
        emit(Timeoutt());
      } else {
        debugPrint(error.toString());
        emit(UpdateProfileFailure(error: error.toString()));
      }
    }
  }

  List<CitiesModel> citiesList = [];
  List<SectionsModel> sectionsModel = [];
  List<DepartmentViewModel> departmentViewModel = [];
  List<DepartmenFinishTypesModel> departmentFinishTypesModel = [];
  List<DepartmenSectionsModel> departmentSectionsModel = [];

  Future getSections() async {
    emit(GetSectionsLoading());
    http.Response response =
        await http.post(Uri.parse('${baseUrl}api/sections'), body: {
      "lang": CacheHelper.getLang(),
      "user_id": CacheHelper.getUserId(),
    });

    Map<String, dynamic> data = jsonDecode(response.body);

    if (data['key'] == 1) {
      citiesList = List<CitiesModel>.from(
        (data['data']['cities'] ?? []).map((e) => CitiesModel.fromJson(e)),
      );

      sectionsModel = List<SectionsModel>.from(
        (data['data']['sections'] ?? []).map((e) => SectionsModel.fromJson(e)),
      );
      departmentViewModel = List<DepartmentViewModel>.from(
        (data['data']['view_types'] ?? [])
            .map((e) => DepartmentViewModel.fromJson(e)),
      );
      departmentFinishTypesModel = List<DepartmenFinishTypesModel>.from(
        (data['data']['finish_types'])
            .map((e) => DepartmenFinishTypesModel.fromJson(e)),
      );
      departmentSectionsModel = List<DepartmenSectionsModel>.from(
        (data['data']['department_sections'] ?? [])
            .map((e) => DepartmenSectionsModel.fromJson(e)),
      );
      emit(GetSectionsSuccess(message: data['msg']));
    } else {
      emit(GetSectionsFailure(error: data['msg']));
    }
  }

  String aboutUsTitle = '';
  Future aboutUs() async {
    emit(AboutUsLoading());
    http.Response response =
        await http.post(Uri.parse("${baseUrl}api/page"), body: {
      "lang": CacheHelper.getLang(),
      'user_id': CacheHelper.getUserId(),
      "title": "about",
    });
    Map<String, dynamic> data = jsonDecode(response.body);
    aboutUsTitle = data["data"]['desc'];
    debugPrint(data.toString());

    if (data["key"] == 1) {
      emit(AboutUsSuccess());
    } else {
      emit(AboutUsFailure(error: data["msg"]));
    }
  }

  String privacyPolicyTitle = '';
  Future privacyPolicy() async {
    emit(PrivacyPolicyLoading());
    http.Response response =
        await http.post(Uri.parse("${baseUrl}api/page"), body: {
      "lang": CacheHelper.getLang(),
      'user_id': CacheHelper.getUserId(),
      "title": "condition",
    });
    Map<String, dynamic> data = jsonDecode(response.body);
    privacyPolicyTitle = data["data"]['desc'];
    debugPrint(data.toString());

    if (data["key"] == 1) {
      emit(PrivacyPolicySuccess());
    } else {
      emit(PrivacyPolicyFailure(error: data["msg"]));
    }
  }

  Future contactUs({
    required String name,
    required String phone,
    required String message,
  }) async {
    emit(ContactUsLoading());
    http.Response response =
        await http.post(Uri.parse("${baseUrl}api/contact-us"), body: {
      "lang": CacheHelper.getLang(),
      'user_id': CacheHelper.getUserId(),
      "name": name,
      "phone": phone,
      "message": message,
    });
    Map<String, dynamic> data = jsonDecode(response.body);
    debugPrint(data.toString());

    if (data["key"] == 1) {
      emit(ContactUsSuccess(message: data["msg"]));
    } else {
      emit(ContactUsFailure(error: data["msg"]));
    }
  }

  List<HomeModel> searchResult = [];
  Future getSearch({required String title, required String filter}) async {
    emit(GetSearchLoading());
    http.Response response =
        await http.post(Uri.parse('${baseUrl}api/services'), body: {
      "lang": CacheHelper.getLang(),
      'user_id': CacheHelper.getUserId(),
      "city_id": cityId,
      "section_id": sectionId,
      "title": title,
      "filter": filter,
    });
    Map<String, dynamic> data = jsonDecode(response.body);
    if (data['key'] == 1) {
      debugPrint(data.toString());
      searchResult = List<HomeModel>.from(
        (data['data'] ?? []).map((e) => HomeModel.fromJson(e)),
      );
      emit(GetSearchSuccess(message: data['msg']));
      cityId = "";
      sectionId = "";
    } else {
      emit(GetSearchFailure(error: data['msg']));
    }
  }

  List<RoomsModel> rooms = [];
  Future getRooms() async {
    emit(GetRoomsLoading());
    http.Response response =
        await http.post(Uri.parse('${baseUrl}api/all-rooms'), body: {
      "lang": CacheHelper.getLang(),
      'user_id': CacheHelper.getUserId(),
    });
    Map<String, dynamic> data = jsonDecode(response.body);
    if (data['key'] == 1) {
      debugPrint(data.toString());
      rooms = List<RoomsModel>.from(
        (data['data'] ?? []).map((e) => RoomsModel.fromJson(e)),
      );
      emit(GetRoomsSuccess(message: data['msg']));
    } else {
      emit(GetRoomsFailure(error: data['msg']));
    }
  }

  List<RoomChatModel> roomChat = [];
  Map chatDetails = {};

  Future getRoomChat({
    required String salerId,
    String roomId = "",
    bool isLoading = true,
  }) async {
    if (isLoading) {
      emit(GetRoomChatLoading());
    }
    http.Response response =
        await http.post(Uri.parse('${baseUrl}api/all-chats'), body: {
      "lang": CacheHelper.getLang(),
      'user_id': CacheHelper.getUserId(),
      "saler_id": salerId,
      "room_id": roomId,
    });
    Map<String, dynamic> data = jsonDecode(response.body);
    if (data['key'] == 1) {
      debugPrint(data.toString());
      chatDetails = data;
      roomChat = List<RoomChatModel>.from(
        (data['data'] ?? [])
            .map((e) => RoomChatModel.fromJson(e))
            .toList()
            .reversed,
      );
      emit(GetRoomChatSuccess(message: data['msg']));
    } else {
      emit(GetRoomChatFailure(error: data['msg']));
    }
  }

  Future sendMessage({required String message}) async {
    emit(SendMessageLoading());
    http.Response response =
        await http.post(Uri.parse('${baseUrl}api/store-chat'), body: {
      "lang": CacheHelper.getLang(),
      'from_id': CacheHelper.getUserId(),
      "type": 'text',
      "message": message,
      'to_id': CacheHelper.getUserType() == "saler"
          ? chatDetails['user_id'].toString()
          : chatDetails['saler_id'].toString(),
    });
    Map<String, dynamic> data = jsonDecode(response.body);
    if (data['key'] == 1) {
      debugPrint(data.toString());
      emit(SendMessageSuccess(message: data['msg']));
      getRoomChat(
        roomId: chatDetails['room_id'].toString(),
        isLoading: false,
        salerId: chatDetails['saler_id'].toString(),
      );
    } else {
      emit(SendMessageFailure(error: data['msg']));
    }
  }
}
