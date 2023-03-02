class Country {
  int? id;
  String? flag;
  String? iso;
  String? name;
  String? niceName;
  String? iso3;
  String? numCode;
  String? phoneCode;
  String? createdAt;
  String? updatedAt;

  Country({
    this.id,
    this.flag,
    this.iso,
    this.name,
    this.niceName,
    this.iso3,
    this.numCode,
    this.phoneCode,
    this.createdAt,
    this.updatedAt,
  });

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? -1;
    flag = json['flag'] ?? '';
    iso = json['iso'] ?? '';
    name = json['name'] ?? '';
    niceName = json['niceName'] ?? '';
    iso3 = json['iso3'] ?? '';
    numCode = json['numCode'] ?? '';
    phoneCode = json['phoneCode'] ?? '';
    createdAt = json['createdAt'] ?? '';
    updatedAt = json['updatedAt'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['flag'] = flag;
    data['iso'] = iso;
    data['name'] = name;
    data['niceName'] = niceName;
    data['iso3'] = iso3;
    data['numCode'] = numCode;
    data['phoneCode'] = phoneCode;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
