import 'dart:async';

import 'package:dio/dio.dart';
import 'package:relief/data/model/login_body.dart';
import 'package:relief/data/model/relief_user.dart';
import 'package:relief/data/model/social_login_body.dart';
import 'package:relief/data/network/rest_client.dart';

enum SocialLogin { FACEBOOK, GOOGLE }

class UsersRepository {
  UsersRepository();

  Future<ReliefUser> login(String email, String password) async {
    final dio = Dio();
    final client = RestClient(dio);

    var user = await client.login(LoginBody(login: email, password: password));
    print(user);
    return user;
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
}
