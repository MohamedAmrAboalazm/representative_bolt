class StoreModel {
  bool? status;
  String? errNum;
  String? msg;
  List<Store>? store;

  StoreModel({this.status, this.errNum, this.msg, this.store});

  StoreModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['store'] != null) {
      store = <Store>[];
      json['store'].forEach((v) {
        store!.add(new Store.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.store != null) {
      data['store'] = this.store!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Store {
  int? id;
  String? name;

  Store({this.id,this.name});

  Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;

    return data;
  }
}

