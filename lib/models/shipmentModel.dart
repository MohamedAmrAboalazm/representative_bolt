class ShipmentModel {
  bool? status;
  var errNum;
  var msg;
  List<ShipmentRepresentative>? shipmentRepresentative;

  ShipmentModel(
      {this.status, this.errNum, this.msg, this.shipmentRepresentative});

  ShipmentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['Shipment_Representative'] != null) {
      shipmentRepresentative = <ShipmentRepresentative>[];
      json['Shipment_Representative'].forEach((v) {
        shipmentRepresentative!.add(new ShipmentRepresentative.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.shipmentRepresentative != null) {
      data['Shipment_Representative'] =
          this.shipmentRepresentative!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShipmentRepresentative {
  var id;
  var nameShipment;
  var description;
  var customerCode;
  var productPrice;
  var orderNumber;
 var count;
  var shippingPrice;
  var returnPrice;
 var weight;
 var size;
  var notes;
 var deliveryDate;
  List<String>? startMap;
  List<String>? endMap;
  var clientId;
  var areaId;
  var serviceTypeId;
  var storeId;
  var shipmentStatusId;
 var representativeId;
  var senderId;
 var additionalServiceId;
 var reasonId;
  var end;
  var statusShipments;
  var createdAt;
  var updatedAt;
  var totalShipment;
  var companyShipmentPrice;
  var representativeShipmentPrice;
  Client? client;
  List<Representative>? representative;
  ServiceType? serviceType;
  Shipmentstatu? shipmentstatu;
 var additionalservice;
  Store? store;
  User? user;

  ShipmentRepresentative(
      {this.id,
        this.nameShipment,
        this.description,
        this.customerCode,
        this.productPrice,
        this.orderNumber,
        this.count,
        this.shippingPrice,
        this.returnPrice,
        this.weight,
        this.size,
        this.notes,
        this.deliveryDate,
        this.startMap,
        this.endMap,
        this.clientId,
        this.areaId,
        this.serviceTypeId,
        this.storeId,
        this.shipmentStatusId,
        this.representativeId,
        this.senderId,
        this.additionalServiceId,
        this.reasonId,
        this.end,
        this.statusShipments,
        this.createdAt,
        this.updatedAt,
        this.totalShipment,
        this.companyShipmentPrice,
        this.representativeShipmentPrice,
        this.client,
        this.representative,
        this.serviceType,
        this.shipmentstatu,
        this.additionalservice,
        this.store,
        this.user});

  ShipmentRepresentative.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameShipment = json['name_shipment'];
    description = json['description'];
    customerCode = json['customer_code'];
    productPrice = json['product_price'];
    orderNumber = json['order_number'];
    count = json['count'];
    shippingPrice = json['shipping_price'];
    returnPrice = json['return_price'];
    weight = json['weight'];
    size = json['size'];
    notes = json['notes'];
    deliveryDate = json['delivery_date'];
    startMap = json['start_map'].cast<String>();
    endMap = json['end_map'].cast<String>();
    clientId = json['client_id'];
    areaId = json['area_id'];
    serviceTypeId = json['service_type_id'];
    storeId = json['store_id'];
    shipmentStatusId = json['shipment_status_id'];
    representativeId = json['representative_id'];
    senderId = json['sender_id'];
    additionalServiceId = json['additional_service_id'];
    reasonId = json['reason_id'];
    end = json['end'];
    statusShipments = json['status_shipments'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    totalShipment = json['total_shipment'];
    companyShipmentPrice = json['company_shipment_price'];
    representativeShipmentPrice = json['representative_shipment_price'];
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
    additionalservice = json['additionalservice'];
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
    data['return_price'] = this.returnPrice;
    data['weight'] = this.weight;
    data['size'] = this.size;
    data['notes'] = this.notes;
    data['delivery_date'] = this.deliveryDate;
    data['start_map'] = this.startMap;
    data['end_map'] = this.endMap;
    data['client_id'] = this.clientId;
    data['area_id'] = this.areaId;
    data['service_type_id'] = this.serviceTypeId;
    data['store_id'] = this.storeId;
    data['shipment_status_id'] = this.shipmentStatusId;
    data['representative_id'] = this.representativeId;
    data['sender_id'] = this.senderId;
    data['additional_service_id'] = this.additionalServiceId;
    data['reason_id'] = this.reasonId;
    data['end'] = this.end;
    data['status_shipments'] = this.statusShipments;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['total_shipment'] = this.totalShipment;
    data['company_shipment_price'] = this.companyShipmentPrice;
    data['representative_shipment_price'] = this.representativeShipmentPrice;
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
    data['additionalservice'] = this.additionalservice;
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
  var id;
  var name;
 var email2;
  var address;
  var phone;
 var phone2;
 var photo;
 var googleLocation;
 var userId;
 var cityId;
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
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_path'] = this.imagePath;
    return data;
  }
}

class Representative {
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
  Pivot? pivot;

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
        this.pivot});

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
    return data;
  }
}

class Pivot {
  var shipmentId;
  var representativeId;
  var commission;

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

class ServiceType {
  var id;
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
  var id;
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
  var phone;
  var photo;
  var googleLocation;
  var flyerStock;
  var pickUpFee;
  var minimumSundayPickUp;
  var shipmentType;
  var status;
  var userId;
  var cityId;
  var branchId;
  var paymentTypeId;
  var createdAt;
  var updatedAt;
  var imagePath;

  UserData(
      {this.id,
        this.name,
        this.address,
        this.phone,
        this.photo,
        this.googleLocation,
        this.flyerStock,
        this.pickUpFee,
        this.minimumSundayPickUp,
        this.shipmentType,
        this.status,
        this.userId,
        this.cityId,
        this.branchId,
        this.paymentTypeId,
        this.createdAt,
        this.updatedAt,
        this.imagePath});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    photo = json['photo'];
    googleLocation = json['google_location'];
    flyerStock = json['flyer_stock'];
    pickUpFee = json['pick_up_fee'];
    minimumSundayPickUp = json['minimum_sunday_pick_up'];
    shipmentType = json['shipment_type'];
    status = json['status'];
    userId = json['user_id'];
    cityId = json['city_id'];
    branchId = json['branch_id'];
    paymentTypeId = json['payment_type_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imagePath = json['image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['photo'] = this.photo;
    data['google_location'] = this.googleLocation;
    data['flyer_stock'] = this.flyerStock;
    data['pick_up_fee'] = this.pickUpFee;
    data['minimum_sunday_pick_up'] = this.minimumSundayPickUp;
    data['shipment_type'] = this.shipmentType;
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['city_id'] = this.cityId;
    data['branch_id'] = this.branchId;
    data['payment_type_id'] = this.paymentTypeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_path'] = this.imagePath;
    return data;
  }
}
