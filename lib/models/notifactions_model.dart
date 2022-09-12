class NotifactionsModel {
  bool? status;
  String? errNum;
  String? msg;
  List<NotificationRepresentative>? notificationRepresentative;

  NotifactionsModel(
      {this.status, this.errNum, this.msg, this.notificationRepresentative});

  NotifactionsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['notification_representative'] != null) {
      notificationRepresentative = <NotificationRepresentative>[];
      json['notification_representative'].forEach((v) {
        notificationRepresentative!
            .add(new NotificationRepresentative.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.notificationRepresentative != null) {
      data['notification_representative'] =
          this.notificationRepresentative!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NotificationRepresentative {
  int? id;
  String? title;
  String? body;
  int? isWatch;
  int? userId;
  String? createdAt;
  String? updatedAt;
  User? user;

  NotificationRepresentative(
      {this.id,
        this.title,
        this.body,
        this.isWatch,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.user});

  NotificationRepresentative.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    isWatch = json['is_watch'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['is_watch'] = this.isWatch;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? email;
  String? emailVerifiedAt;
  String? phoneNumber;
  int? isActive;
  String? userType;
  String? token;
  int? firebaseId;
  String? createdAt;
  String? updatedAt;
  UserData? userData;

  User(
      {this.id,
        this.email,
        this.emailVerifiedAt,
        this.phoneNumber,
        this.isActive,
        this.userType,
        this.token,
        this.firebaseId,
        this.createdAt,
        this.updatedAt,
        this.userData});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phoneNumber = json['phone_number'];
    isActive = json['is_active'];
    userType = json['user_type'];
    token = json['token'];
    firebaseId = json['firebase_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userData = json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['phone_number'] = this.phoneNumber;
    data['is_active'] = this.isActive;
    data['user_type'] = this.userType;
    data['token'] = this.token;
    data['firebase_id'] = this.firebaseId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.userData != null) {
      data['user_data'] = this.userData!.toJson();
    }
    return data;
  }
}

class UserData {
  int? id;
  String? name;
  String? address;
  String? photo;
  String? licensePhoto;
  String? fishPhoto;
  int? nationalId;
  String? wallet;
  int? salary;
  int? commission;
  int? isActive;
  String? cv;
  int? userId;
  int? cityId;
  String? createdAt;
  String? updatedAt;
  String? imagePath;
  String? licensePhotoPath;
  String? fishPhotoPath;
  String? cvPath;

  UserData(
      {this.id,
        this.name,
        this.address,
        this.photo,
        this.licensePhoto,
        this.fishPhoto,
        this.nationalId,
        this.wallet,
        this.salary,
        this.commission,
        this.isActive,
        this.cv,
        this.userId,
        this.cityId,
        this.createdAt,
        this.updatedAt,
        this.imagePath,
        this.licensePhotoPath,
        this.fishPhotoPath,
        this.cvPath});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    photo = json['photo'];
    licensePhoto = json['license_photo'];
    fishPhoto = json['fish_photo'];
    nationalId = json['national_id'];
    wallet = json['wallet'];
    salary = json['salary'];
    commission = json['commission'];
    isActive = json['is_active'];
    cv = json['cv'];
    userId = json['user_id'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imagePath = json['image_path'];
    licensePhotoPath = json['license_photo_path'];
    fishPhotoPath = json['fish_photo_path'];
    cvPath = json['cv_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['photo'] = this.photo;
    data['license_photo'] = this.licensePhoto;
    data['fish_photo'] = this.fishPhoto;
    data['national_id'] = this.nationalId;
    data['wallet'] = this.wallet;
    data['salary'] = this.salary;
    data['commission'] = this.commission;
    data['is_active'] = this.isActive;
    data['cv'] = this.cv;
    data['user_id'] = this.userId;
    data['city_id'] = this.cityId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_path'] = this.imagePath;
    data['license_photo_path'] = this.licensePhotoPath;
    data['fish_photo_path'] = this.fishPhotoPath;
    data['cv_path'] = this.cvPath;
    return data;
  }
}
