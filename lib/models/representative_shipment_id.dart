class RepresenativeShipmentDetails {
  bool? status;
 var errNum;
 var msg;
  List<Detali>? detali;

  RepresenativeShipmentDetails(
      {this.status, this.errNum, this.msg, this.detali});

  RepresenativeShipmentDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['detali'] != null) {
      detali = <Detali>[];
      json['detali'].forEach((v) {
        detali!.add(new Detali.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.detali != null) {
      data['detali'] = this.detali!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Detali {
  var id;
  var userId;
  var shipmentId;
  var shipmentStatusId;
  var storeId;
 var createdAt;
 var updatedAt;
  Shipmentstatu? shipmentstatu;
  User? user;
  Store? store;

  Detali(
      {this.id,
        this.userId,
        this.shipmentId,
        this.shipmentStatusId,
        this.storeId,
        this.createdAt,
        this.updatedAt,
        this.shipmentstatu,
        this.user,
        this.store});

  Detali.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    shipmentId = json['shipment_id'];
    shipmentStatusId = json['shipment_status_id'];
    storeId = json['store_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    shipmentstatu = json['shipmentstatu'] != null
        ? new Shipmentstatu.fromJson(json['shipmentstatu'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    store = json['store'] != null ? new Store.fromJson(json['store']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['shipment_id'] = this.shipmentId;
    data['shipment_status_id'] = this.shipmentStatusId;
    data['store_id'] = this.storeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.shipmentstatu != null) {
      data['shipmentstatu'] = this.shipmentstatu!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.store != null) {
      data['store'] = this.store!.toJson();
    }
    return data;
  }
}

class Shipmentstatu {
  var id;
 var name;
 var createdAt;
 var updatedAt;

  Shipmentstatu(
      {this.id,
        this.name,
        this.createdAt,
        this.updatedAt,});

  Shipmentstatu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Rescheduled {
  var id;
 var date;
  var count;
 var note;
  var totalPrice;
  var shipmentStatusId;
  var shipmentId;
  var userId;
 var createdAt;
 var updatedAt;

  Rescheduled(
      {this.id,
        this.date,
        this.count,
        this.note,
        this.totalPrice,
        this.shipmentStatusId,
        this.shipmentId,
        this.userId,
        this.createdAt,
        this.updatedAt});

  Rescheduled.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    count = json['count'];
    note = json['note'];
    totalPrice = json['total_price'];
    shipmentStatusId = json['shipment_status_id'];
    shipmentId = json['shipment_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['count'] = this.count;
    data['note'] = this.note;
    data['total_price'] = this.totalPrice;
    data['shipment_status_id'] = this.shipmentStatusId;
    data['shipment_id'] = this.shipmentId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class User {
  var id;
 var email;
 var userName;
  var emailVerifiedAt;
 var phoneNumber;
  var isActive;
 var userType;
 var token;
  var firebaseId;
 var createdAt;
 var updatedAt;
  UserData? userData;

  User(
      {this.id,
        this.email,
        this.userName,
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
    userName = json['user_name'];
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
    data['user_name'] = this.userName;
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
  var id;
 var name;
 var address;
  var cv;
  var photo;
  var faceIDCardPic;
  var backIDCardPic;
  var salary;
  var wallet;
  var commission;
  var userId;
  var cityId;
 var createdAt;
 var updatedAt;
 var imagePath;
 var licensePhotoPath;
 var fishPhotoPath;
 var cvPath;

  UserData(
      {this.id,
        this.name,
        this.address,
        this.cv,
        this.photo,
        this.faceIDCardPic,
        this.backIDCardPic,
        this.salary,
        this.wallet,
        this.commission,
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
    cv = json['cv'];
    photo = json['photo'];
    faceIDCardPic = json['face_ID_card_pic'];
    backIDCardPic = json['back_ID_card_pic'];
    salary = json['salary'];
    wallet = json['wallet'];
    commission = json['commission'];
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
    data['cv'] = this.cv;
    data['photo'] = this.photo;
    data['face_ID_card_pic'] = this.faceIDCardPic;
    data['back_ID_card_pic'] = this.backIDCardPic;
    data['salary'] = this.salary;
    data['wallet'] = this.wallet;
    data['commission'] = this.commission;
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

class Store {
  var id;
 var name;
  var phone;
  var address;
  var brancheId;
  var employeeId;
 var createdAt;
 var updatedAt;

  Store(
      {this.id,
        this.name,
        this.phone,
        this.address,
        this.brancheId,
        this.employeeId,
        this.createdAt,
        this.updatedAt});

  Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    brancheId = json['branche_id'];
    employeeId = json['employee_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['branche_id'] = this.brancheId;
    data['employee_id'] = this.employeeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
