

class AllDepartmentModel {
 late final int id;
 late final String title;
 late final String desc;
 late final String address;
 late final double lat;
 late final double lng;
 late final int distance;
 late final bool isFavourite;
 late final int area;
 late final int roomsCount;
 late final int bathroomsCount;
 late final int floorsCount;
 late final int price;
 late final int meterPrice;
 late final int year;
late final  int seen;
late final  int salerId;
late final  String salerName;
late final  String salerPhone;
late final  String salerFullPhone;
late final  String salerAvatar;
late final  num salerRate;
late final  int salerRateCount;
late final  int sectionId;
late final  String sectionTitle;
late final  int viewId;
late final  String viewTitle;
late final  int finishId;
late final  String finishTitle;
late final  String firstImage;
late final  String dateTime;
late final  String date;
late final  String time;
late final  String updatedAt;
late final  List<Images> images;

 

  AllDepartmentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    desc = json['desc'];
    address = json['address'];
    lat = json['lat'];
    lng = json['lng'];
    distance = json['distance'];
    isFavourite = json['is_favourite'];
    area = json['area'];
    roomsCount = json['rooms_count'];
    bathroomsCount = json['bathrooms_count'];
    floorsCount = json['floors_count'];
    price = json['price'];
    meterPrice = json['meter_price'];
    year = json['year'];
    seen = json['seen'];
    salerId = json['saler_id'];
    salerName = json['saler_name'];
    salerPhone = json['saler_phone'];
    salerFullPhone = json['saler_full_phone'];
    salerAvatar = json['saler_avatar'];
    salerRate = json['saler_rate'];
    salerRateCount = json['saler_rate_count'];
    sectionId = json['section_id'];
    sectionTitle = json['section_title'];
    viewId = json['view_id'];
    viewTitle = json['view_title'];
    finishId = json['finish_id'];
    finishTitle = json['finish_title'];
    firstImage = json['first_image'];
    dateTime = json['date_time'];
    date = json['date'];
    time = json['time'];
    updatedAt = json['updated_at'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images.add(Images.fromJson(v));
      });
    }
  }
}

class Images {
late final  int id;
late final  String image;

  

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}
