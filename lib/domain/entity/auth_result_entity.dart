

import 'package:e_commerce/domain/entity/userEntity.dart';

class AuthResultEntity{
UserEntity? userEntity ;
String? token;

AuthResultEntity({this.userEntity,this.token});
}