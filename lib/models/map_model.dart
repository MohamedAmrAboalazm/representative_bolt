class MapModel {
  bool? status;
  String? errNum;
  String? msg;
  Maps? maps;

  MapModel({this.status, this.errNum, this.msg, this.maps});

  MapModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    maps = json['maps'] != null ? new Maps.fromJson(json['maps']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.maps != null) {
      data['maps'] = this.maps!.toJson();
    }
    return data;
  }
}

class Maps {
  Null? location;
  List<String>? distance;
  Null? status;
  String? shipmentId;
  int? representativeId;
  String? updatedAt;
  String? createdAt;
  int? id;

  Maps(
      {this.location,
        this.distance,
        this.status,
        this.shipmentId,
        this.representativeId,
        this.updatedAt,
        this.createdAt,
        this.id});

  Maps.fromJson(Map<String, dynamic> json) {
    location = json['location'];
    distance = json['distance'].cast<String>();
    status = json['status'];
    shipmentId = json['shipment_id'];
    representativeId = json['representative_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['location'] = this.location;
    data['distance'] = this.distance;
    data['status'] = this.status;
    data['shipment_id'] = this.shipmentId;
    data['representative_id'] = this.representativeId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
