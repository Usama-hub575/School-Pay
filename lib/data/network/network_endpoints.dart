//Production Url

class EndPoints {
  var baseUrl = Uri.parse("https://api.paynestschools.ae");
  var paymentGatewayUrl = Uri.parse('https://paynestschools.ae/pl');
  final String _privacyPolicy = "https://paynest.ae/privacy-policy.html";
  final String _login = "/api/parent/auth/login";
  final String _sendOTP = "/api/parent/sendOtpOnRegister";
  final String _verifyOTP = "/api/parent/verifyotp";
  final String _register = "/api/parent/auth/signup";
  final String _myStudents = "/api/parent/students";
  final String _allSchools = "/api/school/allSchools";
  final String _allStudents = "/api/student/all";
  final String _addStudents = "/api/parent/addStudent";
  final String _addStudentByPayNestNumber =
      "/api/parent/addStudentByPaynestNumber";
  final String _pinUpdate = "/api/parent/update";
  final String _resetPassword = "/api/parent/resetpassword";
  final String _resetPasswordByOTP = "/api/parent/resetPasswordByOtp";
  final String _studentById = "/api/parent/studentById?studentId={student_id}";
  final String _forgotPassword = "/api/parent/forgotPassword";
  final String _updateProfile = "/api/parent/updateProfile";
  final String _getCountries = "/api/countries";
  final String _addStudentByFirstName = "/api/parent/addStudentByFName";
  final String _addStudentByParentRegistrationNumber =
      "/api/parent/addStudentByPRN";
  final String _addStudentByStudentRegistrationNumber =
      "/api/parent/addStudentBySRN";
  final String _getUserDataAfterProfileUpdate =
      "/api/parent/getInfo?parentId={parentId}";

  ///Fetch Transaction
  final String _transaction = "/api/transaction/all";
  final String _verifyPin = "/api/parent/verifyPin";
  final String _partialPay = "/api/parent/updateFeeBalance";
  final String _payNow = "/schoolpay-transactions/PaymentInitiator.php";

  ///Lean Payment
  final String _leanPayment = "/api/parent/getLeanData";
  final String _createLeanPaymentIntent = "/api/parent/createLeanPaymentIntent";

  /// To set payment data to server

  final String _createTransaction = "/api/transaction/mobile";
  final String _updateBankResponse = "/api/transaction/setBankResponse";
  final String _searchByLastName =
      "/api/student/getByLName?LName={last_name}&schoolId={school_id}";
  final String _searchByFirstName =
      "/api/student/getByFName?FName={first_name}&schoolId={school_id}";
  final String _searchByPID =
      "/api/student/getByPID?PID={pid}&schoolId={school_id}";
  final String _searchBySID =
      "/api/student/getBySID?SID={sid}&schoolId={school_id}";

  ///Getters

  String getPrivacyPolicyEndPoint() => _privacyPolicy;

  String getCountriesEndPoint() => baseUrl.toString() + _getCountries;

  String getLoginEndPoint() => baseUrl.toString() + _login;

  String getSendOTPEndPoint() => baseUrl.toString() + _sendOTP;

  String getVerifyOTPEndPoint() => baseUrl.toString() + _verifyOTP;

  String getRegisterEndPoint() => baseUrl.toString() + _register;

  String getMyStudentsEndPoint() => baseUrl.toString() + _myStudents;

  String getAllSchoolsEndPoint() => baseUrl.toString() + _allSchools;

  String getAllStudentsEndPoint() => baseUrl.toString() + _allStudents;

  String getAddStudentsEndPoint() => baseUrl.toString() + _addStudents;

  String getAddStudentByPayNestNumberEndPoint() =>
      baseUrl.toString() + _addStudentByPayNestNumber;

  String getPinUpdateEndPoint() => baseUrl.toString() + _pinUpdate;

  String getResetPasswordEndPoint() => baseUrl.toString() + _resetPassword;

  String getResetPasswordByOTPEndPoint() =>
      baseUrl.toString() + _resetPasswordByOTP;

  String getStudentByIDEndPoint() => baseUrl.toString() + _studentById;

  String getForgotPasswordEndPoint() => baseUrl.toString() + _forgotPassword;

  String getUpdateProfileEndPoint() => baseUrl.toString() + _updateProfile;

  String getAddStudentByFirstNameEndPoint() =>
      baseUrl.toString() + _addStudentByFirstName;

  String getAddStudentByParentRegistrationNumberEndPoint() =>
      baseUrl.toString() + _addStudentByParentRegistrationNumber;

  String getAddStudentByStudentRegistrationNumberEndPoint() =>
      baseUrl.toString() + _addStudentByStudentRegistrationNumber;

  String getUserDataAfterProfileUpdateEndPoint() =>
      baseUrl.toString() + _getUserDataAfterProfileUpdate;

  ///Payment Transaction

  String getTransactionEndPoint() => baseUrl.toString() + _transaction;

  String getVerifyPinEndPoint() => baseUrl.toString() + _verifyPin;

  String getPartialPayEndPoint() => baseUrl.toString() + _partialPay;

  String getPayNowEndPoint() => baseUrl.toString() + _payNow;

  ///Lean Payment

  String getLeanPaymentEndPoint() => baseUrl.toString() + _leanPayment;

  String getCreateLeanPaymentIntentEndPoint() =>
      baseUrl.toString() + _createLeanPaymentIntent;

  /// To set payment data to server

  String getCreateTransactionEndPoint() =>
      baseUrl.toString() + _createTransaction;

  String getUpdateBankResponseEndPoint() =>
      baseUrl.toString() + _updateBankResponse;

  String getSearchByLastNameEndPoint() =>
      baseUrl.toString() + _searchByLastName;

  String getSearchByFirstNameEndPoint() =>
      baseUrl.toString() + _searchByFirstName;

  String getSearchByPIDEndPoint() => baseUrl.toString() + _searchByPID;

  String getSearchBySIDEndPoint() => baseUrl.toString() + _searchBySID;



  Map<String, String> headers = {"Content-Type": "application/json"};
}
