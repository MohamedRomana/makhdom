class NotificationModel {
  late final int id;
  late final String message;
  late final bool seen;
  late final String type;
  late final int orderId;
  late final int userId;
  late final int salerId;
  late final int serviceId;
  late final String orderStatus;
  late final String date;
  late final String time;
  late final String duration;

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    seen = json['seen'];
    type = json['type'];
    orderId = json['order_id'];
    userId = json['user_id'];
    salerId = json['saler_id'];
    serviceId = json['service_id'];
    orderStatus = json['order_status'];
    date = json['date'];
    time = json['time'];
    duration = json['duration'];
  }
}
