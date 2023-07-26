import 'dart:convert';
import 'package:e_commerce/data/api/constants.dart';
import 'package:e_commerce/data/api/request/LoginRequest.dart';
import 'package:e_commerce/data/api/request/register_request.dart';
import 'package:e_commerce/data/api/response/LoginResponse.dart';
import 'package:e_commerce/data/api/response/registerResponse.dart';
import 'package:http/http.dart' as http;

class ApiManger {
  //private constructor
  ApiManger._();

  static ApiManger? _instance;
  static ApiManger getInstance(){
    _instance ??= ApiManger._();
    return _instance!;
  }



   Future<RegisterResponse> register(String name, String email,
      String phone, String password, String rePassword) async {
    Uri url = Uri.https(Constants.baseUrl, Constants.registerApi);

    var requestBody = RegisterRequest(
      name: name,
      email: email,
      phone: phone,
      password: password,
      rePassword: rePassword,
    );

    // hint
    var response = await http.post(url, body: requestBody.toJson());

    //hint
    return RegisterResponse.fromJson(jsonDecode(response.body));
  }

  Future<LoginResponse> login(String email , String password)async{
     var url = Uri.https(Constants.baseUrl,Constants.loginApi);
     var requestBody = LoginRequest(
       email: email,
       password: password
     );
     var response = await http.post(url,body: requestBody.toJson());
     return LoginResponse.fromJson(jsonDecode(response.body));
  }

}
