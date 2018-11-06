class LoginVo {
  String token;
  int lockTime;

  LoginVo({this.token, this.lockTime});

  factory LoginVo.fromJson(Map<String, dynamic> json) {
    return LoginVo(
      token: json['token'],
      lockTime: json['lockTime'],
    );
  }
}
