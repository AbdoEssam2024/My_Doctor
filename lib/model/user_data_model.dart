class UserDataModel {
  int? userId;
  String? userName;
  String? userPassword;
  String? userEmail;
  int? userMobile;
  String? userBirth;
  int? userCode;
  int? userApprove;
  String? userGender;

  UserDataModel({
    this.userId,
    this.userName,
    this.userPassword,
    this.userEmail,
    this.userMobile,
    this.userBirth,
    this.userCode,
    this.userApprove,
    this.userGender,
  });

  UserDataModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userPassword = json['user_password'];
    userEmail = json['user_email'];
    userMobile = json['user_mobile'];
    userBirth = json['user_birth'];
    userCode = json['user_code'];
    userApprove = json['user_approve'];
    userGender = json['user_gender'];
  }
}
