<<<<<<< HEAD
class NotificationModel {
  String? id;
  String? creationTime;
  String? message;

  NotificationModel(
      {this.id, this.creationTime, this.message});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    creationTime = json['creationTime'];
    message = json['message'];
  }

}
=======
class NotificationModel {
  String? id;
  String? creationTime;
  String? message;

  NotificationModel(
      {this.id, this.creationTime, this.message});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    creationTime = json['creationTime'];
    message = json['message'];
  }

}
>>>>>>> 94fdc12b5108c23e5c2b11fad95c268d9cb37739
