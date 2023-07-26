import 'user.dart';

class RegisterResponse {
  String? message;
  User? user;
  String? token;
    String? statusMsg;

  RegisterResponse({this.message, this.statusMsg, this.user, this.token});

  factory RegisterResponse.fromJson(dynamic json) {
    return RegisterResponse(
      message: json['message'] as String?,
      statusMsg: json['statusMsg'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'statusMsg': statusMsg,
        'user': user?.toJson(),
        'token': token,
      };
}
