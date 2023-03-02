import '../get_countries_data/get_countries_data.dart';

class CountriesResponse {
  bool? status;
  List<Country>? country;

  CountriesResponse({
    this.status,
    this.country,
  });

  CountriesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['countries'] != null) {
      country = <Country>[];
      json['countries'].forEach(
        (v) {
          country!.add(Country.fromJson(v));
        },
      );
    }
  }

  static CountriesResponse empty() {
    return CountriesResponse(
      status: false,
      country: [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    if (country != null) {
      data['countries'] = country!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
