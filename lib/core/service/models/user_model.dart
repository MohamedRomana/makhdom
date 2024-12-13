class UserModel {
  late final int id;
  late final String userType;
  late final String firstName;
  late final String fullName;
  late final String email;
  late final String fullPhone;
  late final String phone;
  late final String phoneCode;
  late final int cityId;
  late final String city;
  late final int sectionId;
  late final String sectionTitle;
  late final int userBenfit;
  late final int adminBenfit;
  late final int userNeed;
  late final int adminNeed;
  late final int userOrders;
  late final int providerOrders;
  late final String dateTime;
  late final String date;
  late final int rateAvg;
  late final int rateCount;
  late final bool available;
  late final bool isActive;
  late final bool isBlocked;
  late final String lang;
  late final String avatar;
  late final List<Addresses> addresses;
  late final List<UserRates> userRates;
  late final List<ProviderRates> providerRates;

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userType = json['user_type'];
    firstName = json['first_name'];
    fullName = json['full_name'];
    email = json['email'];
    fullPhone = json['full_phone'];
    phone = json['phone'];
    phoneCode = json['phone_code'];
    cityId = json['city_id'];
    city = json['city'];
    sectionId = json['section_id'];
    sectionTitle = json['section_title'];
    userBenfit = json['user_benfit'];
    adminBenfit = json['admin_benfit'];
    userNeed = json['user_need'];
    adminNeed = json['admin_need'];
    userOrders = json['user_orders'];
    providerOrders = json['provider_orders'];
    dateTime = json['date_time'];
    date = json['date'];
    rateAvg = json['rate_avg'];
    rateCount = json['rate_count'];
    available = json['available'];
    isActive = json['is_active'];
    isBlocked = json['is_blocked'];
    lang = json['lang'];
    avatar = json['avatar'];
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses.add(Addresses.fromJson(v));
      });
    }
    if (json['user_rates'] != null) {
      userRates = <UserRates>[];
      json['user_rates'].forEach((v) {
        userRates.add(UserRates.fromJson(v));
      });
    }
    if (json['provider_rates'] != null) {
      providerRates = <ProviderRates>[];
      json['provider_rates'].forEach((v) {
        providerRates.add(ProviderRates.fromJson(v));
      });
    }
  }
}

class ProviderRates {
  late final int id;
  late final String orderId;
  late final String userId;
  late final String userName;
  late final String providerId;
  late final String providerName;
  late final int rate;
  late final String desc;

  ProviderRates.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    userId = json['user_id'];
    userName = json['user_name'];
    providerId = json['provider_id'];
    providerName = json['provider_name'];
    rate = json['rate'];
    desc = json['desc'];
  }
}

class Addresses {
  late final int id;
  late final String title;
  late final String address;
  late final num lat;
  late final num lng;

  Addresses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    address = json['address'];
    lat = json['lat'];
    lng = json['lng'];
  }
}

class UserRates {
  late final int id;
  late final String orderId;
  late final String userId;
  late final String userName;
  late final String providerId;
  late final String providerName;
  late final num rate;
  late final String desc;

  UserRates.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    userId = json['user_id'];
    userName = json['user_name'];
    providerId = json['provider_id'];
    providerName = json['provider_name'];
    rate = json['rate'];
    desc = json['desc'];
  }
}
