// To parse this JSON data, do
//
//     final transactionListModel = transactionListModelFromJson(jsonString);
// TransactionListModel transactionListModelFromJson(String str) => TransactionListModel.fromJson(json.decode(str));
//
// String transactionListModelToJson(TransactionListModel data) => json.encode(data.toJson());

class SingleStudentModel {
  int id;
  int parentId;
  int studentId;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  Student? student;

  SingleStudentModel({
    required this.id,
    required this.parentId,
    required this.studentId,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.student,
  });
}

class Student {
  DateTime dob;
  DateTime admissionDate;
  int id;
  String studentRegNo;
  String firstName;
  String lastName;
  String grade;
  String parentEmiratesId;
  dynamic parentPhoneNumber;
  dynamic deletedAt;
  int schoolId;
  double totalBalanceAmount;
  dynamic guardianFirstName;
  dynamic guardianLastName;
  dynamic guardianGender;
  dynamic guardianEmiratesId;
  dynamic guardianNationality;
  dynamic guardianReligion;
  dynamic area;
  dynamic region;
  dynamic streetAddress;
  dynamic email;
  String? phoneNumber;
  dynamic otherNumber;
  dynamic profile;
  dynamic religion;
  dynamic nationality;
  dynamic gender;
  dynamic dueDate;
  dynamic file;
  String? privacy;
  DateTime? createdAt;
  DateTime? updatedAt;
  School? school;

  Student({
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
    required this.school,
  });
}

class School {
  int id;
  String name;
  dynamic deletedAt;
  dynamic addedBy;
  String address;
  String description;
  dynamic vat;
  int paynestFee;
  String? apiKey;
  String? merchantId;
  dynamic file;
  String? privacy;
  DateTime createdAt;
  DateTime updatedAt;

  School({
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
}
