
class PayNowTransactionDetailModel {
  PayNowTransactionDetailModel({
    required this.student,
    required this.paidOn,
    required this.referenceNo,
    required this.amountPaid,
  });

  PayNowTransactionDetailStudent? student;
  DateTime? paidOn;
  String? referenceNo;
  String amountPaid;
}

class PayNowTransactionDetailStudent {
  PayNowTransactionDetailStudent({
    required this.id,
    required this.studentRegNo,
    required this.firstName,
    required this.lastName,
    required this.grade,
    required this.parentEmiratesId,
    required this.parentPhoneNumber,
    required this.dob,
    required this.admissionDate,
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

  int id;
  String studentRegNo;
  String firstName;
  String lastName;
  String grade;
  String parentEmiratesId;
  String parentPhoneNumber;
  DateTime dob;
  DateTime admissionDate;
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
  DateTime dueDate;
  dynamic file;
  String privacy;
  DateTime createdAt;
  DateTime updatedAt;
}
