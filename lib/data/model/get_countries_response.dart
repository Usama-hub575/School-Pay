class GetCountriesResponse {
  bool? status;
  List<Countries>? countries;

  GetCountriesResponse({this.status, this.countries});

  GetCountriesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['countries'] != null) {
      countries = <Countries>[];
      json['countries'].forEach((v) {
        countries!.add(Countries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (countries != null) {
      data['countries'] = countries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Countries {
  int? id;
  String? flag;
  String? iso;
  String? name;
  String? nicename;
  String? iso3;
  String? numcode;
  String? phonecode;
  String? createdAt;
  String? updatedAt;

  Countries(
      {this.id,
      this.flag,
      this.iso,
      this.name,
      this.nicename,
      this.iso3,
      this.numcode,
      this.phonecode,
      this.createdAt,
      this.updatedAt});

  Countries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    flag = json['flag'];
    iso = json['iso'];
    name = json['name'];
    nicename = json['nicename'];
    iso3 = json['iso3'];
    numcode = json['numcode'];
    phonecode = json['phonecode'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['flag'] = flag;
    data['iso'] = iso;
    data['name'] = name;
    data['nicename'] = nicename;
    data['iso3'] = iso3;
    data['numcode'] = numcode;
    data['phonecode'] = phonecode;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
