class ParentStudentResponse {
  bool? status;
  ParentStudent? parentStudent;

  ParentStudentResponse({this.status, this.parentStudent});

  ParentStudentResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    parentStudent = json['parentStudent'] != null
        ? ParentStudent.fromJson(json['parentStudent'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (parentStudent != null) {
      data['parentStudent'] = parentStudent!.toJson();
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
        json['student'] != null ? Student.fromJson(json['student']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['parentId'] = parentId;
    data['studentId'] = studentId;
    data['deletedAt'] = deletedAt;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (student != null) {
      data['student'] = student!.toJson();
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
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    school = json['school'] != null ? School.fromJson(json['school']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dob'] = dob;
    data['admissionDate'] = admissionDate;
    data['id'] = id;
    data['studentRegNo'] = studentRegNo;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['grade'] = grade;
    data['parentPassport'] = parentPassport;
    data['parentEmiratesId'] = parentEmiratesId;
    data['emiratesId'] = emiratesId;
    data['parentPhoneNumber'] = parentPhoneNumber;
    data['deletedAt'] = deletedAt;
    data['schoolId'] = schoolId;
    data['parentFirstName'] = parentFirstName;
    data['parentLastName'] = parentLastName;
    data['parentGender'] = parentGender;
    data['parentNationality'] = parentNationality;
    data['parentReligion'] = parentReligion;
    data['area'] = area;
    data['region'] = region;
    data['streetAddress'] = streetAddress;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['otherNumber'] = otherNumber;
    data['profile'] = profile;
    data['religion'] = religion;
    data['nationality'] = nationality;
    data['gender'] = gender;
    data['total_balance_amount'] = totalBalanceAmount;
    data['dueDate'] = dueDate;
    data['file'] = file;
    data['privacy'] = privacy;
    data['paynestNumber'] = paynestNumber;
    data['parentRegNo'] = parentRegNo;
    data['parentEmail'] = parentEmail;
    data['section'] = section;
    data['payeeType'] = payeeType;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (school != null) {
      data['school'] = school!.toJson();
    }
    return data;
  }
}

class School {
  int? id;
  String? name;
  String? deletedAt;
  String? addedBy;
  String? address;
  String? description;
  String? vat;
  int? paynestFee;
  String? aPIKey;
  String? merchantId;
  String? file;
  String? privacy;
  String? payeeType;
  String? createdAt;
  String? updatedAt;

  School({
    this.id,
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
    this.createdAt,
    this.updatedAt,
  });

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
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['deletedAt'] = deletedAt;
    data['addedBy'] = addedBy;
    data['address'] = address;
    data['description'] = description;
    data['vat'] = vat;
    data['paynestFee'] = paynestFee;
    data['APIKey'] = aPIKey;
    data['merchantId'] = merchantId;
    data['file'] = file;
    data['privacy'] = privacy;
    data['payeeType'] = payeeType;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
