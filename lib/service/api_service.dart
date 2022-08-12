import 'dart:convert';
import 'dart:developer';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class APIService {
  GetStorage storage = GetStorage();
  static var client = http.Client();
  static var baseurl = Uri.parse("https://api.paynestschools.ae");
  static var paymentGateway = Uri.parse('https://paynestschools.ae/pl');
 // static var baseurl = Uri.parse("https://payschool.azurewebsites.net");
  static var baseurl1 = "discoveritech.com";

  static var login = "/api/parent/auth/login";
  static var sendOTP = "/api/parent/sendOtp";
  static var verifyOTP = "/api/parent/verifyotp";
  static var register = "/api/parent/auth/signup";
  static var myStudents = "/api/parent/students";
  static var allSchools = "/api/school/allSchools";
  static var allStudents = "/api/student/all";
  static var addStudents = "/api/parent/addStudent";
  static var addStudentByPaynestNumber = "/api/parent/addStudentByPaynestNumber";
  static var pinUpdate = "/api/parent/update";
  static var resetPassword = "/api/parent/resetpassword";
  static var forgotPassword = "/api/parent/forgotPassword";
  static var updateProfile = "/api/parent/updateProfile";
  static var getCountries = "/api/countries";
  static var addStudentByFirstName = "/api/parent/addStudentByFName";
  static var addStudentByParentRegistrationNumber = "/api/parent/addStudentByPRN";
  static var addStudentByStudentRegistrationNumber = "/api/parent/addStudentBySRN";

  ///Fetch Transaction
  static var transaction = "/api/transaction/all";
  static var verifyPin = "/api/parent/verifyPin";
  static var partialPay = "/api/parent/updateFeeBalance";
  static var payNow = "/schoolpay-transactions/PaymentInitiator.php";

  /// To set payment data to server
  // static var createTransaction = "/api/transaction";
  static var createTransaction = "/api/transaction/mobile";
  static var updateBankResponse = "/api/transaction/setBankResponse";
  static var searchByLastName =
      "/api/student/getByLName?LName={last_name}&schoolId={school_id}";
  static var searchByFirstName =
      "/api/student/getByFName?FName={first_name}&schoolId={school_id}";
  static var searchByPID = "/api/student/getByPID?PID={pid}&schoolId={school_id}";
  static var searchBySID =
      "/api/student/getBySID?SID={sid}&schoolId={school_id}";

  Map<String, String> headers = {"Content-Type": "application/json"};

  /// * Login * ///
  Future apiLogin(data) async {
    var endPoint = Uri.parse("$baseurl$login");
    var response = await client.post(
      endPoint,
      headers: headers,
      body: data,
    );
    print("Login Data");
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.body;
    }
  }

  /// * Send OTP * ///
  Future apiSendOTP(data) async {
    var endPoint = Uri.parse("$baseurl$sendOTP");
    var response = await client.post(
      endPoint,
      headers: headers,
      body: data,
    );
    // print("Login Data");
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.body;
    }
  }

  /// * Register * ///
  Future apiResister(data) async {
    var endPoint = Uri.parse("$baseurl$register");
    var response = await client.post(
      endPoint,
      headers: headers,
      body: data,
    );
    // print("Login Data");
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.body;
    }
  }

  /// * Get Countries * ///
  Future apiGetCountries() async {
    var endPoint = Uri.parse("$baseurl$getCountries");
    var response = await client.get(
      endPoint,
    );
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.body;
    }
  }

  /// * Verify OTP * ///
  Future apiVerifyOTP(data) async {
    var endPoint = Uri.parse("$baseurl$verifyOTP");
    var response = await client.post(
      endPoint,
      headers: {
        "Content-Type": "application/json",
      },
      body: data,
    );
    // print("Login Data");
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.body;
    }
  }

  /// * Fetch MyStudents already added students * ///
  Future apiMyStudents(data) async {
    var endPoint = Uri.parse("$baseurl$myStudents");
    var response = await client.post(
      endPoint,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer " + storage.read('accessToken'),
      },
      body: data,
    );
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.body;
    }
  }

  /// * Student List * ///
  Future apiStudentList() async {
    var endPoint = Uri.parse("$baseurl$allStudents");
    var response = await client.get(
      endPoint,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer " + storage.read('accessToken'),
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.body;
    }
  }

  Future search({
    required int schoolId,
    required String queryParam,
    required String searchBy,
  }) async {
    var endPoint;
    String query;
    if (searchBy == 'first') {
      query =
          searchByFirstName.replaceAll('{first_name}', queryParam).replaceAll(
                '{school_id}',
                schoolId.toString(),
              );
      endPoint = Uri.parse("$baseurl$query");
    } else if (searchBy == 'last') {
      query = searchByLastName.replaceAll('{last_name}', queryParam).replaceAll(
            '{school_id}',
            schoolId.toString(),
          );
      endPoint = Uri.parse("$baseurl$query");
    } else if (searchBy == 'parent') {
      query = searchByPID.replaceAll('{pid}', queryParam).replaceAll(
            '{school_id}',
            schoolId.toString(),
          );
      endPoint = Uri.parse("$baseurl$query");
    } else if (searchBy == 'sid') {
      query = searchBySID.replaceAll('{sid}', queryParam).replaceAll(
            '{school_id}',
            schoolId.toString(),
          );
      endPoint = Uri.parse("$baseurl$query");
    }

    var response = await client.get(
      endPoint,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer " + storage.read('accessToken'),
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.body;
    }
  }

  /// * Schools List * ///
  Future apiSchoolList() async {
    var endPoint = Uri.parse("$baseurl$allSchools");
    var response = await client.get(
      endPoint,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer " + storage.read('accessToken'),
      },
    );
    print('this is school');
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.body;
    }
  }

  /// * Parent Add Student * ///
  Future apiAddStudent(data) async {
    print("Student data");
    print(data);
    var endPoint = Uri.parse("$baseurl$addStudents");
    var response = await client.post(
      endPoint,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Bearer " + storage.read('accessToken'),
      },
      body: data,
    );
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.body;
    }
  }

  /// * Parent Add Student BY First Name * ///
  Future apiAddStudentByFirstName(data) async {
    print("Student data");
    print(data);
    var endPoint = Uri.parse("$baseurl$addStudentByFirstName");
    var response = await client.post(
      endPoint,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Bearer " + storage.read('accessToken'),
      },
      body: data,
    );
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.body;
    }
  }

  /// * Parent Add Student BY First Name * ///
  Future apiAddStudentByParentRegistrationNumber(data) async {
    print("Student data");
    print(data);
    var endPoint = Uri.parse("$baseurl$addStudentByParentRegistrationNumber");
    var response = await client.post(
      endPoint,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Bearer " + storage.read('accessToken'),
      },
      body: data,
    );
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.body;
    }
  }

  /// * Parent Add Student BY First Name * ///
  Future apiAddStudentByStudentRegistrationNumber(data) async {
    print("Student data");
    print(data);
    var endPoint = Uri.parse("$baseurl$addStudentByStudentRegistrationNumber");
    var response = await client.post(
      endPoint,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Bearer " + storage.read('accessToken'),
      },
      body: data,
    );
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.body;
    }
  }


  /// * Parent Add Student By PayNest Number * ///
  Future addStudentWithPaynestNumber(data) async {
    print("Student data");
    print(data);
    var endPoint = Uri.parse("$baseurl$addStudentByPaynestNumber");
    var response = await client.post(
      endPoint,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Bearer " + storage.read('accessToken'),
      },
      body: data,
    );
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.body;
    }
  }

  /// * Update or add Pin * ///
  Future apiPinUpdate(data) async {
    print("Student data");
    print(data);
    var endPoint = Uri.parse("$baseurl$pinUpdate");
    var response = await client.put(
      endPoint,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer " + storage.read('accessToken'),
      },
      body: data,
    );
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.body;
    }
  }

  /// * ResetPassword * ///
  Future apiResetPassword(data) async {
    var endPoint = Uri.parse("$baseurl$resetPassword");
    var response = await client.post(
      endPoint,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer " + storage.read('accessToken'),
      },
      body: data,
    );
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.body;
    }
  }


  /// * ForgotPassword * ///
  Future apiForgotPassword(data) async {
    var endPoint = Uri.parse("$baseurl$forgotPassword");
    var response = await client.post(
      endPoint,
      headers: {
        "Content-Type": "application/json",
      },
      body: data,
    );
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.body;
    }
  }



  /// * UpdateProfile * ///
  Future apiUpdateProfile(data) async {
    var endPoint = Uri.parse("$baseurl$updateProfile");
    var response = await client.put(
      endPoint,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer " + storage.read('accessToken'),
      },
      body: data,
    );
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.body;
    }
  }

  /// * Fetch all previous Transactions * ///
  Future apiTransactionList(data) async {
    var endPoint = Uri.parse("$baseurl$transaction");
    var response = await client.post(
      endPoint,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Bearer " + storage.read('accessToken'),
      },
      body: data,
    );
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.body;
    }
  }

  /// * Verify Pin * ///
  Future apiVerifyPin(data) async {
    var endPoint = Uri.parse("$baseurl$verifyPin");
    var response = await client.post(
      endPoint,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer " + storage.read('accessToken'),
      },
      body: data,
    );
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.body;
    }
  }

  /// * Half Fee payment * ///
  Future apiPartialPay(data) async {
    var endPoint = Uri.parse("$baseurl$partialPay");
    var response = await client.put(
      endPoint,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer " + storage.read('accessToken'),
      },
      body: data,
    );
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.body;
    }
  }

  /// *  payment * ///
  // Future web(data) async {
  //   final queryParameters = {
  //     'c': data,
  //   };
  //   var endPoidsfnt = Uri.https("$baseurl1", '',queryParameters);
  //   var endPoint = Uri.parse("$endPoidsfnt$partialPay");
  //   var response = await client.post(endPoint,body: data);
  //   print(response.body);
  //   if(response.statusCode == 200){
  //     return response.body;
  //   }else{
  //     return response.body;
  //   }
  // }

  Future apiPayNow(queryParams) async {
    var endPoint = Uri.https(
      'discoveritech.com',
      payNow,
    );
    var response = await client.get(
      endPoint,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer " + storage.read('accessToken'),
      },
    );
    if (response.statusCode == 200) {
      print("Pay Response ***");
      // print(response.body);
      log(response.body);
      return response.body;
    } else {
      return response.body;
    }
  }

  /// Sending Data of student to server for which payment is made
  Future apiCreateTransaction(queryParams) async {
    var endPoint = Uri.https(
      "api.paynestschools.ae",
      createTransaction,
    );
    print(endPoint);
    var response = await client.post(
      endPoint,
      body: queryParams,
      headers: {
        "Content-Type" : "application/x-www-form-urlencoded",
        "Authorization": "Bearer " + storage.read('accessToken'),
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      print("CreateTrans Response ***");
      print(response.body);
      log(response.body);
      return response.body;
    } else {
      return response.body;
    }
  }

  Future multipart(String url,
      {Map? headers, formData, encoding, bool withToken = true}) async {
    print('----Multipart REQUEST----\nURL --> $url\nBody --> $formData');
    final header = await appendHeader(headers: headers, withToken: withToken);
    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields.addAll(formData);
    request.headers.addAll(header);
    final response = await request.send();
    final streamString = await response.stream.bytesToString();
    var encoded = json.decode(streamString);
  }

  Future apiTransactionEnquery(queryParams) async {
    var endPoint = Uri.https(
      'payschool.azurewebsites.net',
      'https://test.cbdonline.ae/CyberSourceMerchantAPI/MerchantSettlementService.svc/restService/',
    );
    print(endPoint);
    var response = await client.post(
      endPoint,
      body: queryParams,
      headers: {
        'Content-type': 'text/xml',
        "Authorization": "Bearer " + storage.read('accessToken'),
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      print("CreateTrans Response ***");
      print(response.body);
      log(response.body);
      return response.body;
    } else {
      return response.body;
    }
  }

  /// * Update Bank Response * ///
  Future apiUpdateBankResponse(data) async {
    var endPoint = Uri.parse("$baseurl$updateBankResponse");
    var response = await client.post(
      endPoint,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer " + storage.read('accessToken'),
      },
      body: data,
    );
    print("Bank Response");
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.body;
    }
  }

  Future<Map<String, String>> appendHeader(
      {Map? headers, bool refresh = false, withToken = true}) async {
    try {
      headers ??= <String, String>{};
      headers["Authorization"] = 'Bearer ' + storage.read('accessToken');
    } catch (e) {
      print(e.toString());
    }

    return headers as Map<String, String>;
  }
}
