class NotificationModel {
  String? id;
  String? creationTime;
  String? arMessage;
  String? enMessage;
  String? userName;
  String? userPhone;
  int? notificationModelType;
  int? msgType;
  String? hiddenData;
  String? message;

  NotificationModel({
    this.id,
    this.creationTime,
    this.arMessage,
    this.enMessage,
    this.userName,
    this.userPhone,
    this.notificationModelType,
    this.msgType,
    this.hiddenData,
    this.message,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      creationTime: json['creationTime'],
      arMessage: json['arMessage'],
      enMessage: json['enMessage'],
      userName: json['userName'],
      userPhone: json['userPhone'],
      notificationModelType: json['notificationModelType'],
      msgType: json['msgType'],
      hiddenData: json['hiddenData'],
      message: json['message'],
    );
  }
}
