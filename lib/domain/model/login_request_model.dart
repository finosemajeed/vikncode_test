class LoginRequestModel {
  String? username;
  String? password;
  bool? isMobile;

  LoginRequestModel({this.username, this.password, this.isMobile});

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    isMobile = json['is_mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data['is_mobile'] = isMobile;
    return data;
  }
}
