import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/base_error.dart';
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
  static ApiManger getInstance() {
    _instance ??= ApiManger._();
    return _instance!;
  }

  Future<Either<BaseError, RegisterResponse>> register(String name,
      String email, String phone, String password, String rePassword) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
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
      var registerResponse =
          RegisterResponse.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200 && response.statusCode < 300) {
        return Right(registerResponse);
      } else {
        return Left(BaseError(
            errorMessage: registerResponse.message != null
                ? registerResponse.error!.msg!
                : registerResponse.message!));
      }
    } else {
      return left(
          BaseError(errorMessage: 'Please Check The Internet Connection'));
    }
  }

  Future<Either<BaseError, LoginResponse>> login(
      String email, String password) async {
    var url = Uri.https(Constants.baseUrl, Constants.loginApi);

    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var requestBody = LoginRequest(email: email, password: password);

      var response = await http.post(url, body: requestBody.toJson());
      var loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200 && response.statusCode < 300) {
        return Right(loginResponse);
      } else {
        return Left(BaseError(errorMessage: loginResponse.message!));
      }
    } else {
      return left(
          BaseError(errorMessage: 'Please Check The Internet Connection'));
    }
  }
}
