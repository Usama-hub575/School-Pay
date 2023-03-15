part of 'register_detail_page_bloc.dart';

// ignore: must_be_immutable
class RegisterDetailPageState extends Equatable {
  RegisterDetailPageStatus status;
  List<String> gender = ['Male', 'Female'];
  String? selectedFilter;
  bool isEmiratesSelected = true;
  bool isPassportSelected = false;
  String selectedCountry = "Select Country";
  String countryCode = "AE";
  String flag = '';

  RegisterDetailPageState({
    this.status = RegisterDetailPageStatus.init,
    this.gender = const ['Male', 'Female'],
    this.selectedFilter = 'Male',
    this.isEmiratesSelected = true,
    this.isPassportSelected = false,
    this.selectedCountry = "Select Country",
    this.countryCode = "AE",
    this.flag = '',
  });

  RegisterDetailPageState copyWith({
    RegisterDetailPageStatus? status,
    List<String>? gender,
    String? selectedFilter,
    bool? isEmiratesSelected,
    bool? isPassportSelected,
    String? selectedCountry,
    String? countryCode,
    String? flag,
  }) {
    return RegisterDetailPageState(
      status: status ?? this.status,
      countryCode: countryCode ?? this.countryCode,
      flag: flag ?? this.flag,
      gender: gender ?? this.gender,
      isEmiratesSelected: isEmiratesSelected ?? this.isEmiratesSelected,
      isPassportSelected: isPassportSelected ?? this.isPassportSelected,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      selectedFilter: selectedFilter ?? this.selectedFilter,
    );
  }

  @override
  List<Object?> get props => [
        countryCode,
        flag,
        gender,
        isEmiratesSelected,
        isPassportSelected,
        selectedCountry,
        selectedFilter,
        status,
      ];
}
