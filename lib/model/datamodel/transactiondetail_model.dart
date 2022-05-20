// To parse this JSON data, do
//
//     final transactionDetailModel = transactionDetailModelFromJson(jsonString);



class TransactionDetailModel {

  int id;
  int schoolId;
  int parentId;
  int invoiceId;
  int studentId;
  DateTime payedOn;
  int amount;
  dynamic deletedAt;
  String? refNo;
  String? type;
  dynamic vat;
  dynamic paynestFee;
  dynamic country;
  dynamic bankResponse;
  int amountToPay;
  dynamic stringToBank;
  dynamic stringFromBank;
  DateTime? createdAt;
  DateTime? updatedAt;
  TransactionDetailStudent? student;
  TransactionDetailSchool? school;

  TransactionDetailModel({
    required this.id,
    required this.schoolId,
    required this.parentId,
    required this.invoiceId,
    required this.studentId,
    required this.payedOn,
    required this.amount,
    required this.deletedAt,
    required this.refNo,
    required this.type,
    required this.vat,
    required this.paynestFee,
    required this.country,
    required this.bankResponse,
    required this.amountToPay,
    required this.stringToBank,
    required this.stringFromBank,
    required this.createdAt,
    required this.updatedAt,
    required this.student,
    required this.school,
  });

}

class TransactionDetailSchool {
  TransactionDetailSchool({
    required this.id,
    required this.name,
    required this.deletedAt,
    required this.addedBy,
    required this.address,
    required this.description,
    required this.vat,
    required this.paynestFee,
    required this.apiKey,
    required this.merchantId,
    required this.file,
    required this.privacy,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  dynamic deletedAt;
  dynamic addedBy;
  String address;
  String description;
  double vat;
  int paynestFee;
  dynamic apiKey;
  int merchantId;
  String file;
  String privacy;
  DateTime? createdAt;
  DateTime? updatedAt;

}

class TransactionDetailStudent {
  TransactionDetailStudent({
    required this.dob,
    required this.admissionDate,
    required this.id,
    required this.studentRegNo,
    required this.firstName,
    required this.lastName,
    required this.grade,
    required this.parentEmiratesId,
    required this.parentPhoneNumber,
    required this.deletedAt,
    required this.schoolId,
    required this.totalBalanceAmount,
    required this.guardianFirstName,
    required this.guardianLastName,
    required this.guardianGender,
    required this.guardianEmiratesId,
    required this.guardianNationality,
    required this.guardianReligion,
    required this.area,
    required this.region,
    required this.streetAddress,
    required this.email,
    required this.phoneNumber,
    required this.otherNumber,
    required this.profile,
    required this.religion,
    required this.nationality,
    required this.gender,
    required this.dueDate,
    required this.file,
    required this.privacy,
    required this.createdAt,
    required this.updatedAt,
  });

  DateTime? dob;
  DateTime? admissionDate;
  int id;
  String studentRegNo;
  String firstName;
  String lastName;
  String grade;
  String parentEmiratesId;
  String parentPhoneNumber;
  dynamic deletedAt;
  int schoolId;
  String totalBalanceAmount;
  String guardianFirstName;
  String guardianLastName;
  String guardianGender;
  String guardianEmiratesId;
  String guardianNationality;
  String guardianReligion;
  String area;
  String region;
  String streetAddress;
  String email;
  String phoneNumber;
  String otherNumber;
  dynamic profile;
  String religion;
  String nationality;
  String gender;
  DateTime? dueDate;
  String? file;
  String privacy;
  DateTime? createdAt;
  DateTime? updatedAt;
}

