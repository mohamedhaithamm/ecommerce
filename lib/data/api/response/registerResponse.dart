import 'package:e_commerce/domain/entity/auth_result_entity.dart';
import 'package:e_commerce/data/api/response/Error.dart';
import 'userDto.dart';

class RegisterResponse {
  String? message;
  UserDto? user;
  String? token;
    String? statusMsg;
    Error? error;


  RegisterResponse({this.message,this.error , this.statusMsg, this.user, this.token});

  factory RegisterResponse.fromJson(dynamic json) {
    return RegisterResponse(
      message: json['message'] as String?,
      // error: json['errors'],
      statusMsg: json['statusMsg'] as String?,
      user: json['user'] != null ?  UserDto.fromJson(json['user']) : null,
      error: json['errors'] != null ?  Error.fromJson(json['errors']) : null,
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'errors': error,
        'statusMsg': statusMsg,
        'user': user?.toJson(),
        'token': token,
      };
   AuthResultEntity toAuthResultEntity(){
     return AuthResultEntity(
       token: token,
       userEntity: user?.toUserEntity()
     );
   }
}
