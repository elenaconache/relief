import 'dart:async';

import 'package:dio/dio.dart';
import 'package:relief/data/model/api_error.dart';
import 'package:relief/data/model/base_api_response.dart';
import 'package:relief/data/model/login_body.dart';
import 'package:relief/data/model/register_body.dart';
import 'package:relief/data/model/registration_response.dart';
import 'package:relief/data/model/relief_user.dart';
import 'package:relief/data/model/social_login_body.dart';
import 'package:relief/data/network/rest_client.dart';

enum SocialLogin { FACEBOOK, GOOGLE }

class UsersRepository {
  UsersRepository();

  Future<BaseApiResponse<ReliefUser>> login(
      String email, String password) async {
    final dio = Dio();
    final client = RestClient(dio);

    return client
        .login(LoginBody(login: email, password: password))
        .then((value) {
      return BaseApiResponse<ReliefUser>()..data = value;
    }).catchError((error) {
      var errorResponse = BaseApiResponse<ReliefUser>();

      if (error is DioError) {
        print("Exception occured: $error");
        String message = "";
        int code = error.response.data["code"];
        switch (code) {
          case 2002:
            message = 'api_error_invalid_app';
            break;
          case 3000:
            message = 'api_error_login_disabled';
            break;
          case 3003:
            message = 'api_error_invalid_login';
            break;
          case 3044:
            message = 'api_error_multiple_login';
            break;
          case 8000:
            message = 'api_error_property_exceeded';
            break;
          case 3113:
            message = 'api_error_guest_login';
            break;
          default:
            message = ApiError.mapMessage(error);
            break;
        }
        errorResponse.error =
            ApiError(errorCode: code, errorMessageTag: message);
        print('error message from api: ${errorResponse.error}');
      }

      return errorResponse;
    });
  }

  Future<ReliefUser> socialLogin(String token, SocialLogin socialLogin) async {
    final dio = Dio();
    final client = RestClient(dio);

    if (socialLogin == SocialLogin.FACEBOOK) {
      var user =
          await client.loginWithFacebook(SocialLoginBody(accessToken: token));
      print(user);
      return user;
    } else if (socialLogin == SocialLogin.GOOGLE) {
      var user =
          await client.loginWithGoogle(SocialLoginBody(accessToken: token));
      print(user);
      return user;
    } else {
      return null;
    }
  }

  Future<BaseApiResponse<RegistrationResponse>> register(
      String email, String password, String name) {
    final dio = Dio();
    dio.options.followRedirects = false;
    dio.options.validateStatus = (status) {
      return status < 400;
    };
    final client = RestClient(dio);

    return client
        .register(RegisterBody(email: email, password: password, name: name))
        .then((value) {
      return BaseApiResponse<RegistrationResponse>()..data = value;
    }).catchError((error) {
      print("Exception occured: $error ${error.runtimeType}");
      print("Exception2: $error ${error.runtimeType}");
      var errorResponse = BaseApiResponse<RegistrationResponse>();

      if (error is DioError) {
        print("Exception occured: $error");
        String message = "";
        int code = error.response.data["code"];
        switch (code) {
          case 2002:
            message = 'api_error_invalid_app';
            break;
          case 3009:
            message = 'api_error_registrations_disabled';
            break;
          case 3033:
            message = 'api_error_already_exists';
            break;
          case 8000:
            message = 'api_error_length';
            break;
          default:
            message = ApiError.mapMessage(error);
            break;
        }
        errorResponse.error =
            ApiError(errorCode: code, errorMessageTag: message);
        print('error message from api: ${errorResponse.error}');
      }

      return errorResponse;
    });
  }
}
