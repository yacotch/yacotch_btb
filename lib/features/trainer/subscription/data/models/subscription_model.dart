class SubscriptionModel {
  double? fee;
  String? colorCode;
  int? duration;
  String? creationTime;
  int? target;
  int? priceFrom;
  int? priceTo;
  int? requestsCount;
  int? itemsCount;
  List<UsedSubscription>? usedSubscriptions;
  bool? isActive;
  String? arName, enName, name;
  int? id;

  SubscriptionModel({
    this.arName,
    this.enName,
    this.name,
    this.isActive,
    this.id,
    this.fee,
    this.colorCode,
    this.duration,
    this.creationTime,
    this.target,
    this.priceFrom,
    this.priceTo,
    this.requestsCount,
    this.itemsCount,
    this.usedSubscriptions,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    var usedSubscriptionsList = json['usedSubscriptions'] as List;
    List<UsedSubscription> usedSubscriptions = usedSubscriptionsList
        .map((subscriptionJson) => UsedSubscription.fromJson(subscriptionJson))
        .toList();
    return SubscriptionModel(
      isActive: json['isActive'],
      arName: json['arName'],
      enName: json['enName'],
      name: json['name'],
      id: json['id'],
      fee: json['fee'],
      colorCode: json['colorCode'],
      duration: json['duration'],
      creationTime: json['creationTime'],
      target: json['target'],
      priceFrom: json['priceFrom'],
      priceTo: json['priceTo'],
      requestsCount: json['requestsCount'],
      itemsCount: json['itemsCount'],
      usedSubscriptions: usedSubscriptions,
    );
  }
}

class SubscriprtionUser {
  int? value;
  String? name;
  SubscriprtionUser({this.name, this.value});
  SubscriprtionUser.fromJson(Map<String, dynamic> data) {
    name = data['text'];
    value = data['value'];
  }
}

class UsedSubscription {
  int? subscriptionId;
  int? userId;
  SubscriprtionUser? user;
  String? creationTime;
  bool? isExpired;
  String? name;
  double? fee;
  int? duration;
  int? remainingDays;
  int? remainingRequests;
  int? remainingItems;
  num? id;

  UsedSubscription({
    this.subscriptionId,
    this.userId,
    this.user,
    this.creationTime,
    this.isExpired,
    this.name,
    this.fee,
    this.duration,
    this.remainingDays,
    this.remainingRequests,
    this.remainingItems,
    this.id,
  });

  UsedSubscription.fromJson(Map<String, dynamic> json) {
    SubscriprtionUser? user =
        json['user'] == null ? null : SubscriprtionUser.fromJson(json['user']);

    subscriptionId = json['subscriptionId'];
    userId = json['userId'];
    user = user;
    creationTime = json['creationTime'];
    isExpired = json['isExpired'];
    name = json['name'];

    fee = json['fee'];
    duration = json['duration'];
    remainingDays = json['remainingDays'];
    remainingRequests = json['remainingRequests'];
    remainingItems = json['remainingItems'];
    id = json['id'] as num;
  }
}
