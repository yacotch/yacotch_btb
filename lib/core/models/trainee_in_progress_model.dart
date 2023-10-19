class TraineeInProgressModel {
  int? courseId;
  Course? course;
  int? traineeId;
  Trainee? trainee;
  double? latitude;
  double? longitude;
  double? weight;
  int? length;
  int? completedHours;
  int? absenceCount;
  int? progress;
  bool? isFinished;
  List<Bmi>? bmi;

  TraineeInProgressModel(
      {this.courseId,
      this.course,
      this.traineeId,
      this.trainee,
      this.latitude,
      this.longitude,
      this.weight,
      this.length,
      this.completedHours,
      this.absenceCount,
      this.progress,
      this.isFinished,
      this.bmi});

  TraineeInProgressModel.fromJson(Map<String, dynamic> json) {
    courseId = json['courseId'];
    course = json['course'] != null ? Course.fromJson(json['course']) : null;
    traineeId = json['traineeId'];
    trainee =
        json['trainee'] != null ? Trainee.fromJson(json['trainee']) : null;
    latitude = json['latitude'];
    longitude = json['longitude'];
    weight = json['weight'];
    length = json['length'];
    completedHours = json['completedHours'];
    absenceCount = json['absenceCount'];
    progress = json['progress'];
    isFinished = json['isFinished'];

    if (json['bmi'] != null) {
      bmi = <Bmi>[];
      json['bmi'].forEach((v) {
        bmi!.add(Bmi.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['courseId'] = courseId;
    if (course != null) {
      data['course'] = course!.toJson();
    }
    data['traineeId'] = traineeId;
    if (trainee != null) {
      data['trainee'] = trainee!.toJson();
    }
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['weight'] = weight;
    data['length'] = length;
    data['completedHours'] = completedHours;
    data['absenceCount'] = absenceCount;
    data['progress'] = progress;
    data['isFinished'] = isFinished;
    if (bmi != null) {
      data['bmi'] = bmi!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Course {
  double? fee;
  String? imageUrl;
  int? trainingHoursCount;
  int? value;
  String? text;

  Course(
      {this.fee,
      this.imageUrl,
      this.trainingHoursCount,
      this.value,
      this.text});

  Course.fromJson(Map<String, dynamic> json) {
    fee = json['fee'];
    imageUrl = json['imageUrl'];
    trainingHoursCount = json['trainingHoursCount'];
    value = json['value'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fee'] = fee;
    data['imageUrl'] = imageUrl;
    data['trainingHoursCount'] = trainingHoursCount;
    data['value'] = value;
    data['text'] = text;
    return data;
  }
}

class Trainee {
  String? name;
  String? phoneNumber;
  Null? imageUrl;
  int? id;

  Trainee({this.name, this.phoneNumber, this.imageUrl, this.id});

  Trainee.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    imageUrl = json['imageUrl'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phoneNumber'] = phoneNumber;
    data['imageUrl'] = imageUrl;
    data['id'] = id;
    return data;
  }
}

class Bmi {
  String? date;
  double? bmi;

  Bmi({this.date, this.bmi});

  Bmi.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    bmi = json['bmi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['bmi'] = bmi;
    return data;
  }
}
