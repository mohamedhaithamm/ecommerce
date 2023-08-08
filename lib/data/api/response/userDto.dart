
import 'package:e_commerce/domain/entity/userEntity.dart';

class UserDto {
  String? name;
  String? email;


  UserDto({this.name, this.email});

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
        name: json['name'] as String?,
        email: json['email'] as String?,

      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,

      };

  UserEntity toUserEntity(){
    return UserEntity(
      email: email,
      name: name
    );
  }
}
