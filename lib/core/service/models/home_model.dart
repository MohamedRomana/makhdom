class HomeModel {
  late final int id;
  late final String type;
  late final String title;
  late final String desc;
  late final int price;
  late final int salerId;
  late final String salerName;
  late final String salerPhone;
  late final String salerFullPhone;
  late final String salerAvatar;
  late final double salerRate;
  late final int salerRateCount;
  late final int cityId;
  late final String cityTitle;
  late final int sectionId;
  late final String sectionTitle;
  late final String firstImage;
  late final List<Images> images;
  late final List<SingleDatesFormat> singleDatesFormat;
  late final List<String> singleDates;
  late final List<SingleDatesWithTimes> singleDatesWithTimes;
  late final List<Dates> dates;

  HomeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    title = json['title'];
    desc = json['desc'];
    price = json['price'];
    salerId = json['saler_id'];
    salerName = json['saler_name'];
    salerPhone = json['saler_phone'];
    salerFullPhone = json['saler_full_phone'];
    salerAvatar = json['saler_avatar'];
    salerRate = json['saler_rate'];
    salerRateCount = json['saler_rate_count'];
    cityId = json['city_id'];
    cityTitle = json['city_title'];
    sectionId = json['section_id'];
    sectionTitle = json['section_title'];
    firstImage = json['first_image'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images.add(Images.fromJson(v));
      });
    }
    if (json['single_dates_format'] != null) {
      singleDatesFormat = <SingleDatesFormat>[];
      json['single_dates_format'].forEach((v) {
        singleDatesFormat.add(SingleDatesFormat.fromJson(v));
      });
    }
    singleDates = json['single_dates'].cast<String>();
    if (json['single_dates_with_times'] != null) {
      singleDatesWithTimes = <SingleDatesWithTimes>[];
      json['single_dates_with_times'].forEach((v) {
        singleDatesWithTimes.add(SingleDatesWithTimes.fromJson(v));
      });
    }
    if (json['dates'] != null) {
      dates = <Dates>[];
      json['dates'].forEach((v) {
        dates.add(Dates.fromJson(v));
      });
    }
  }
}

class Images {
  late final int id;
  late final String image;

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class SingleDatesFormat {
  late final String date;
  late final String year;
  late final String month;
  late final String monthF;
  late final String day;
  late final String dayF;
  late final String dayFShort;

  SingleDatesFormat.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    year = json['year'];
    month = json['month'];
    monthF = json['month_f'];
    day = json['day'];
    dayF = json['day_f'];
    dayFShort = json['day_f_short'];
  }
}

class SingleDatesWithTimes {
  late final String date;
  late final List<Times> times;

  SingleDatesWithTimes.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['times'] != null) {
      times = <Times>[];
      json['times'].forEach((v) {
        times.add(Times.fromJson(v));
      });
    }
  }
}

class Times {
  late final int id;
  late final String time;

  Times.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    time = json['time'];
  }
}

class Dates {
  late final int id;
  late final String date;
  late final String time;

  Dates.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    time = json['time'];
  }
}
