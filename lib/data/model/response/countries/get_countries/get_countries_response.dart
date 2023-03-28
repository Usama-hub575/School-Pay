import 'package:paynest_flutter_app/export.dart';

class CountriesResponse {
  bool? status;
  List<CountryDetails>? country;

  CountriesResponse({
    this.status,
    this.country,
  });

  CountriesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['countries'] != null) {
      country = <CountryDetails>[];
      json['countries'].forEach(
        (v) {
          country!.add(CountryDetails.fromJson(v));
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
