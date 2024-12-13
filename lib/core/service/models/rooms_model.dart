class RoomsModel {
  late final int id;
  late final int otherId;
  late final int userId;
  late final String userName;
  late final String userPhone;
  late final int salerId;
  late final String salerName;
  late final String salerPhone;
  late final String lastMessage;
  late final String messageType;
  late final int senderId;
  late final bool senderLogin;
  late final String senderName;
  late final String senderPhone;
  late final String senderAvatar;
  late final bool seen;
  late final String duration;
  late final String date;
  late final int unseenCount;

  RoomsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    otherId = json['other_id'];
    userId = json['user_id'];
    userName = json['user_name'];
    userPhone = json['user_phone'];
    salerId = json['saler_id'];
    salerName = json['saler_name'];
    salerPhone = json['saler_phone'];
    lastMessage = json['last_message'];
    messageType = json['message_type'];
    senderId = json['sender_id'];
    senderLogin = json['sender_login'];
    senderName = json['sender_name'];
    senderPhone = json['sender_phone'];
    senderAvatar = json['sender_avatar'];
    seen = json['seen'];
    duration = json['duration'];
    date = json['date'];
    unseenCount = json['unseen_count'];
  }
}
