import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:relief/data/model/relief_user.dart';
import 'package:http/http.dart' as http;
import 'package:relief/dependency_injection.dart';

class SocialSignInRepository {
  SocialSignInRepository();

  Future<void> logoutFromGoogle() async {
    getIt.get<GoogleSignIn>().disconnect();
  }

  Future<ReliefUser> loginWithGoogle() async {
    await logoutFromGoogle(); //todo remove once login implementation is finished
    final GoogleSignInAccount googleUser =
        await getIt.get<GoogleSignIn>().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final FirebaseUser user =
        (await FirebaseAuth.instance.signInWithCredential(credential));
    print("signed in " + user.displayName);
    ReliefUser profile = ReliefUser(
        uid: null,
        username: user.displayName,
        password: null,
        email: user.email,
        countryTag: null,
        pictureUrl: user.photoUrl,
        availableSessions: 0,
        token: googleAuth.accessToken);
    return profile;
  }

  void logoutFromFacebook() {
    getIt.get<FacebookLogin>().logOut();
  }

  Future<ReliefUser> loginWithFacebook() async {
    await getIt.get<FacebookLogin>().logOut();

    final FacebookLoginResult result =
        await getIt.get<FacebookLogin>().logIn(['email', 'public_profile']);
    if (result.status == FacebookLoginStatus.loggedIn) {
      FacebookAccessToken myToken = result.accessToken;
      AuthCredential credential =
          FacebookAuthProvider.getCredential(accessToken: myToken.token);
      await FirebaseAuth.instance.signInWithCredential(credential);
      final response = await http.get(
          'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${myToken.token}');
      var user = json.decode(response.body);
      print('user is $user');
      ReliefUser profile = ReliefUser(
          uid: null,
          username: user['name'],
          password: null,
          email: user['email'],
          countryTag: null,
          pictureUrl: user['picture']['data']['url'],
          availableSessions: 0,
          token: myToken.token);
      return profile;
    } else if (result.status == FacebookLoginStatus.error) {
      print('result is ${result.errorMessage}');
    }
    return null;
  }
}
