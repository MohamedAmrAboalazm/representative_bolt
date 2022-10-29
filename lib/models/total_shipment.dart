class TotalShipmentModel {
  bool? status;
 var errNum;
 var msg;
  Data? data;

  TotalShipmentModel({this.status, this.errNum, this.msg, this.data});

  TotalShipmentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  var countShipment;
  var totalCollectionBalance;
  var totalCommission;

  Data({this.countShipment, this.totalCollectionBalance, this.totalCommission});

  Data.fromJson(Map<String, dynamic> json) {
    countShipment = json['count_Shipment'];
    totalCollectionBalance = json['total_collection_balance'];
    totalCommission = json['total_commission'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count_Shipment'] = this.countShipment;
    data['total_collection_balance'] = this.totalCollectionBalance;
    data['total_commission'] = this.totalCommission;
    return data;
  }
}
