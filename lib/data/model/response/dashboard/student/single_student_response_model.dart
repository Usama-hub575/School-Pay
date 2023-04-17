class SingleStudentResponseModel {
  bool? status;
  ParentStudent? parentStudent;

  SingleStudentResponseModel({this.status, this.parentStudent});

  SingleStudentResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    parentStudent = json['parentStudent'] != null
        ? new ParentStudent.fromJson(json['parentStudent'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.parentStudent != null) {
      data['parentStudent'] = this.parentStudent!.toJson();
    }
    return data;
  }
}

class ParentStudent {
  int? id;
  int? parentId;
  int? studentId;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  Student? student;

  ParentStudent(
      {this.id,
      this.parentId,
      this.studentId,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.student});

  ParentStudent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parentId'];
    studentId = json['studentId'];
    deletedAt = json['deletedAt'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    student =
        json['student'] != null ? new Student.fromJson(json['student']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parentId'] = this.parentId;
    data['studentId'] = this.studentId;
    data['deletedAt'] = this.deletedAt;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.student != null) {
      data['student'] = this.student!.toJson();
    }
    return data;
  }
}

class Student {
  String? dob;
  String? admissionDate;
  int? id;
  String? studentRegNo;
  String? firstName;
  String? lastName;
  String? grade;
  String? parentPassport;
  String? parentEmiratesId;
  String? emiratesId;
  String? parentPhoneNumber;
  String? deletedAt;
  int? schoolId;
  String? parentFirstName;
  String? parentLastName;
  String? parentGender;
  String? parentNationality;
  String? parentReligion;
  String? area;
  String? region;
  String? streetAddress;
  String? email;
  String? phoneNumber;
  String? otherNumber;
  String? profile;
  String? religion;
  String? nationality;
  String? gender;
  int? totalBalanceAmount;
  String? dueDate;
  String? file;
  String? privacy;
  String? paynestNumber;
  String? parentRegNo;
  String? parentEmail;
  String? section;
  String? payeeType;
  String? lastTransactionDateTimeGst;
  String? createdAt;
  String? updatedAt;
  School? school;

  Student(
      {this.dob,
      this.admissionDate,
      this.id,
      this.studentRegNo,
      this.firstName,
      this.lastName,
      this.grade,
      this.parentPassport,
      this.parentEmiratesId,
      this.emiratesId,
      this.parentPhoneNumber,
      this.deletedAt,
      this.schoolId,
      this.parentFirstName,
      this.parentLastName,
      this.parentGender,
      this.parentNationality,
      this.parentReligion,
      this.area,
      this.region,
      this.streetAddress,
      this.email,
      this.phoneNumber,
      this.otherNumber,
      this.profile,
      this.religion,
      this.nationality,
      this.gender,
      this.totalBalanceAmount,
      this.dueDate,
      this.file,
      this.privacy,
      this.paynestNumber,
      this.parentRegNo,
      this.parentEmail,
      this.section,
      this.payeeType,
      this.lastTransactionDateTimeGst,
      this.createdAt,
      this.updatedAt,
      this.school});

  Student.fromJson(Map<String, dynamic> json) {
    dob = json['dob'];
    admissionDate = json['admissionDate'];
    id = json['id'];
    studentRegNo = json['studentRegNo'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    grade = json['grade'];
    parentPassport = json['parentPassport'];
    parentEmiratesId = json['parentEmiratesId'];
    emiratesId = json['emiratesId'];
    parentPhoneNumber = json['parentPhoneNumber'];
    deletedAt = json['deletedAt'];
    schoolId = json['schoolId'];
    parentFirstName = json['parentFirstName'];
    parentLastName = json['parentLastName'];
    parentGender = json['parentGender'];
    parentNationality = json['parentNationality'];
    parentReligion = json['parentReligion'];
    area = json['area'];
    region = json['region'];
    streetAddress = json['streetAddress'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    otherNumber = json['otherNumber'];
    profile = json['profile'];
    religion = json['religion'];
    nationality = json['nationality'];
    gender = json['gender'];
    totalBalanceAmount = json['total_balance_amount'];
    dueDate = json['dueDate'];
    file = json['file'];
    privacy = json['privacy'];
    paynestNumber = json['paynestNumber'];
    parentRegNo = json['parentRegNo'];
    parentEmail = json['parentEmail'];
    section = json['section'];
    payeeType = json['payeeType'];
    lastTransactionDateTimeGst = json['lastTransactionDateTimeGst'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    school =
        json['school'] != null ? new School.fromJson(json['school']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dob'] = this.dob;
    data['admissionDate'] = this.admissionDate;
    data['id'] = this.id;
    data['studentRegNo'] = this.studentRegNo;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['grade'] = this.grade;
    data['parentPassport'] = this.parentPassport;
    data['parentEmiratesId'] = this.parentEmiratesId;
    data['emiratesId'] = this.emiratesId;
    data['parentPhoneNumber'] = this.parentPhoneNumber;
    data['deletedAt'] = this.deletedAt;
    data['schoolId'] = this.schoolId;
    data['parentFirstName'] = this.parentFirstName;
    data['parentLastName'] = this.parentLastName;
    data['parentGender'] = this.parentGender;
    data['parentNationality'] = this.parentNationality;
    data['parentReligion'] = this.parentReligion;
    data['area'] = this.area;
    data['region'] = this.region;
    data['streetAddress'] = this.streetAddress;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['otherNumber'] = this.otherNumber;
    data['profile'] = this.profile;
    data['religion'] = this.religion;
    data['nationality'] = this.nationality;
    data['gender'] = this.gender;
    data['total_balance_amount'] = this.totalBalanceAmount;
    data['dueDate'] = this.dueDate;
    data['file'] = this.file;
    data['privacy'] = this.privacy;
    data['paynestNumber'] = this.paynestNumber;
    data['parentRegNo'] = this.parentRegNo;
    data['parentEmail'] = this.parentEmail;
    data['section'] = this.section;
    data['payeeType'] = this.payeeType;
    data['lastTransactionDateTimeGst'] = this.lastTransactionDateTimeGst;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.school != null) {
      data['school'] = this.school!.toJson();
    }
    return data;
  }
}

class School {
  int? id;
  String? name;
  Null? deletedAt;
  Null? addedBy;
  String? address;
  String? description;
  String? vat;
  int? paynestFee;
  String? aPIKey;
  String? merchantId;
  Null? file;
  String? privacy;
  String? payeeType;
  int? defaultLeanBankAccount;
  String? createdAt;
  String? updatedAt;

  School(
      {this.id,
      this.name,
      this.deletedAt,
      this.addedBy,
      this.address,
      this.description,
      this.vat,
      this.paynestFee,
      this.aPIKey,
      this.merchantId,
      this.file,
      this.privacy,
      this.payeeType,
      this.defaultLeanBankAccount,
      this.createdAt,
      this.updatedAt});

  School.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    deletedAt = json['deletedAt'];
    addedBy = json['addedBy'];
    address = json['address'];
    description = json['description'];
    vat = json['vat'];
    paynestFee = json['paynestFee'];
    aPIKey = json['APIKey'];
    merchantId = json['merchantId'];
    file = json['file'];
    privacy = json['privacy'];
    payeeType = json['payeeType'];
    defaultLeanBankAccount = json['defaultLeanBankAccount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['deletedAt'] = this.deletedAt;
    data['addedBy'] = this.addedBy;
    data['address'] = this.address;
    data['description'] = this.description;
    data['vat'] = this.vat;
    data['paynestFee'] = this.paynestFee;
    data['APIKey'] = this.aPIKey;
    data['merchantId'] = this.merchantId;
    data['file'] = this.file;
    data['privacy'] = this.privacy;
    data['payeeType'] = this.payeeType;
    data['defaultLeanBankAccount'] = this.defaultLeanBankAccount;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
