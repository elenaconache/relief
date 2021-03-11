import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:relief/data/model/user.dart';
import 'package:http/http.dart' as http;

class SocialSignInRepository {
  SocialSignInRepository();

  final facebookLogin = FacebookLogin();

  void signOutFromFacebook() {
    facebookLogin.logOut();
  }

  Future<ReliefUser> loginWithFacebook() async {
    await facebookLogin.logOut();

    final FacebookLoginResult result =
        await facebookLogin.logIn(['email', 'public_profile']);
    if (result.status == FacebookLoginStatus.loggedIn) {
      FacebookAccessToken myToken = result.accessToken;
      AuthCredential credential =
          FacebookAuthProvider.credential(myToken.token);
      await FirebaseAuth.instance.signInWithCredential(credential);
      final response = await http.get(
          'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${myToken.token}');
      var user = json.decode(response.body);
      print('user is $user');
      ReliefUser profile = ReliefUser(null, user['name'], null, user['email'],
          null, null, user['picture'], 0);
      return profile;
    } else if (result.status == FacebookLoginStatus.error) {
      print('result is ${result.errorMessage}');
    }
    return null;
  }
}
