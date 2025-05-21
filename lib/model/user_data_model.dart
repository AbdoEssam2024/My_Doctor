class UserDataModel {
  String? status;
  int? userId;
  String? name;
  String? email;
  String? token;
  double? tokenExpires;

  UserDataModel(
      {this.status,
      this.userId,
      this.name,
      this.email,
      this.token,
      this.tokenExpires});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    token = json['token'];
    tokenExpires = json['token_expires'];
  }
}
