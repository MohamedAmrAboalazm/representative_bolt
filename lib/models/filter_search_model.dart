class FilterModel {
  bool? status;
 var errNum;
 var msg;
  List<ShipmentStatus>? shipmentStatus;

  FilterModel({this.status, this.errNum, this.msg, this.shipmentStatus});

  FilterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['Shipment_status'] != null) {
      shipmentStatus = <ShipmentStatus>[];
      json['Shipment_status'].forEach((v) {
        shipmentStatus!.add(new ShipmentStatus.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.shipmentStatus != null) {
      data['Shipment_status'] =
          this.shipmentStatus!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShipmentStatus {
  int? id;
 var nameShipment;
 var description;
  int? customerCode;
  int? productPrice;
  int? orderNumber;
  var count;
  var shippingPrice;
  var discountValue;
  int? returnPrice;
  int? weight;
  var size;
 var notes;
  var deliveryDate;
  List<String>? startMap;
  List<String>? endMap;
  int? clientId;
  int? startAreaId;
  int? endAreaId;
  int? serviceTypeId;
  int? storeId;
  int? shipmentStatusId;
  int? senderId;
  var reasonId;
  int? end;
  int? statusShipments;
  int? breakable;
 var createdAt;
 var updatedAt;
 var totalShipment;
 var companyShipmentPrice;
 var representativeShipmentPrice;
  var area;
  Client? client;
  List<Representative>? representative;
  ServiceType? serviceType;
  Shipmentstatu? shipmentstatu;
  Store? store;
  User? user;

  ShipmentStatus(
      {this.id,
        this.nameShipment,
        this.description,
        this.customerCode,
        this.productPrice,
        this.orderNumber,
        this.count,
        this.shippingPrice,
        this.discountValue,
        this.returnPrice,
        this.weight,
        this.size,
        this.notes,
        this.deliveryDate,
        this.startMap,
        this.endMap,
        this.clientId,
        this.startAreaId,
        this.endAreaId,
        this.serviceTypeId,
        this.storeId,
        this.shipmentStatusId,
        this.senderId,
        this.reasonId,
        this.end,
        this.statusShipments,
        this.breakable,
        this.createdAt,
        this.updatedAt,
        this.totalShipment,
        this.companyShipmentPrice,
        this.representativeShipmentPrice,
        this.area,
        this.client,
        this.representative,
        this.serviceType,
        this.shipmentstatu,
        this.store,
        this.user});

  ShipmentStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameShipment = json['name_shipment'];
    description = json['description'];
    customerCode = json['customer_code'];
    productPrice = json['product_price'];
    orderNumber = json['order_number'];
    count = json['count'];
    shippingPrice = json['shipping_price'];
    discountValue = json['discount_value'];
    returnPrice = json['return_price'];
    weight = json['weight'];
    size = json['size'];
    notes = json['notes'];
    deliveryDate = json['delivery_date'];
    startMap = json['start_map'].cast<String>();
    endMap = json['end_map'].cast<String>();
    clientId = json['client_id'];
    startAreaId = json['start_area_id'];
    endAreaId = json['end_area_id'];
    serviceTypeId = json['service_type_id'];
    storeId = json['store_id'];
    shipmentStatusId = json['shipment_status_id'];
    senderId = json['sender_id'];
    reasonId = json['reason_id'];
    end = json['end'];
    statusShipments = json['status_shipments'];
    breakable = json['breakable'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    totalShipment = json['total_shipment'];
    companyShipmentPrice = json['company_shipment_price'];
    representativeShipmentPrice = json['representative_shipment_price'];
    area = json['area'];
    client =
    json['client'] != null ? new Client.fromJson(json['client']) : null;
    if (json['representative'] != null) {
      representative = <Representative>[];
      json['representative'].forEach((v) {
        representative!.add(new Representative.fromJson(v));
      });
    }
    serviceType = json['service_type'] != null
        ? new ServiceType.fromJson(json['service_type'])
        : null;
    shipmentstatu = json['shipmentstatu'] != null
        ? new Shipmentstatu.fromJson(json['shipmentstatu'])
        : null;
    store = json['store'] != null ? new Store.fromJson(json['store']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_shipment'] = this.nameShipment;
    data['description'] = this.description;
    data['customer_code'] = this.customerCode;
    data['product_price'] = this.productPrice;
    data['order_number'] = this.orderNumber;
    data['count'] = this.count;
    data['shipping_price'] = this.shippingPrice;
    data['discount_value'] = this.discountValue;
    data['return_price'] = this.returnPrice;
    data['weight'] = this.weight;
    data['size'] = this.size;
    data['notes'] = this.notes;
    data['delivery_date'] = this.deliveryDate;
    data['start_map'] = this.startMap;
    data['end_map'] = this.endMap;
    data['client_id'] = this.clientId;
    data['start_area_id'] = this.startAreaId;
    data['end_area_id'] = this.endAreaId;
    data['service_type_id'] = this.serviceTypeId;
    data['store_id'] = this.storeId;
    data['shipment_status_id'] = this.shipmentStatusId;
    data['sender_id'] = this.senderId;
    data['reason_id'] = this.reasonId;
    data['end'] = this.end;
    data['status_shipments'] = this.statusShipments;
    data['breakable'] = this.breakable;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['total_shipment'] = this.totalShipment;
    data['company_shipment_price'] = this.companyShipmentPrice;
    data['representative_shipment_price'] = this.representativeShipmentPrice;
    data['area'] = this.area;
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    if (this.representative != null) {
      data['representative'] =
          this.representative!.map((v) => v.toJson()).toList();
    }
    if (this.serviceType != null) {
      data['service_type'] = this.serviceType!.toJson();
    }
    if (this.shipmentstatu != null) {
      data['shipmentstatu'] = this.shipmentstatu!.toJson();
    }
    if (this.store != null) {
      data['store'] = this.store!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Client {
  int? id;
 var name;
  var email2;
 var address;
 var phone;
  var phone2;
  var photo;
  var googleLocation;
  var userId;
  var cityId;
  var employeeId;
 var createdAt;
 var updatedAt;
 var imagePath;

  Client(
      {this.id,
        this.name,
        this.email2,
        this.address,
        this.phone,
        this.phone2,
        this.photo,
        this.googleLocation,
        this.userId,
        this.cityId,
        this.employeeId,
        this.createdAt,
        this.updatedAt,
        this.imagePath});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email2 = json['email_2'];
    address = json['address'];
    phone = json['phone'];
    phone2 = json['phone_2'];
    photo = json['photo'];
    googleLocation = json['google_location'];
    userId = json['user_id'];
    cityId = json['city_id'];
    employeeId = json['employee_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imagePath = json['image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email_2'] = this.email2;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['phone_2'] = this.phone2;
    data['photo'] = this.photo;
    data['google_location'] = this.googleLocation;
    data['user_id'] = this.userId;
    data['city_id'] = this.cityId;
    data['employee_id'] = this.employeeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_path'] = this.imagePath;
    return data;
  }
}

class Representative {
  int? id;
 var name;
 var address;
  var cv;
  var photo;
  var faceIDCardPic;
  var backIDCardPic;
  int? salary;
  int? wallet;
  int? commission;
  int? userId;
  int? cityId;
 var createdAt;
 var updatedAt;
 var imagePath;
 var licensePhotoPath;
 var fishPhotoPath;
 var cvPath;
  Pivot? pivot;
  User? user;

  Representative(
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
        this.cvPath,
        this.pivot,
        this.user});

  Representative.fromJson(Map<String, dynamic> json) {
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
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
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
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? shipmentId;
  int? representativeId;
  int? commission;

  Pivot({this.shipmentId, this.representativeId, this.commission});

  Pivot.fromJson(Map<String, dynamic> json) {
    shipmentId = json['shipment_id'];
    representativeId = json['representative_id'];
    commission = json['commission'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shipment_id'] = this.shipmentId;
    data['representative_id'] = this.representativeId;
    data['commission'] = this.commission;
    return data;
  }
}

class User {
  int? id;
 var email;
 var userName;
  var emailVerifiedAt;
 var phoneNumber;
  int? isActive;
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
  int? id;
 var name;
 var address;
  var cv;
  var photo;
  var faceIDCardPic;
  var backIDCardPic;
  int? salary;
  int? wallet;
  int? commission;
  int? userId;
  int? cityId;
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

class ServiceType {
  int? id;
 var type;
 var createdAt;
 var updatedAt;

  ServiceType({this.id, this.type, this.createdAt, this.updatedAt});

  ServiceType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Shipmentstatu {
  int? id;
 var name;
 var createdAt;
 var updatedAt;

  Shipmentstatu({this.id, this.name, this.createdAt, this.updatedAt});

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

class Store {
  int? id;
 var name;
  var phone;
  var address;
  int? brancheId;
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

class ProductData {
  int? id;
 var name;
  int? height;
  int? width;
  int? length;
  int? size;
  int? subCategoryId;
 var createdAt;
 var updatedAt;
  Pivot? pivot;

  ProductData(
      {this.id,
        this.name,
        this.height,
        this.width,
        this.length,
        this.size,
        this.subCategoryId,
        this.createdAt,
        this.updatedAt,
        this.pivot});

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    height = json['height'];
    width = json['width'];
    length = json['length'];
    size = json['size'];
    subCategoryId = json['sub_category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['height'] = this.height;
    data['width'] = this.width;
    data['length'] = this.length;
    data['size'] = this.size;
    data['sub_category_id'] = this.subCategoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class AdditionalServiceData {
  int? id;
 var type;
 var createdAt;
 var updatedAt;
  Pivot? pivot;

  AdditionalServiceData(
      {this.id, this.type, this.createdAt, this.updatedAt, this.pivot});

  AdditionalServiceData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}


