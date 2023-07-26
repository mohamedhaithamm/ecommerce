import 'package:e_commerce/data/api/response/user.dart';

/// message : "success"
/// user : {"name":"ahmed","email":"ahmed@route.com","role":"user"}
/// token : "efhiwg8t89"

class LoginResponse {
  LoginResponse({
      this.message, 
      this.user, 
      this.token,
    this.statusMsg
  });

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  User? user;
  String? token;
  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

}

