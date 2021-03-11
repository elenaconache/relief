import 'package:cubit/cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:relief/blocs/login/login_states.dart';
import 'package:relief/data/model/user.dart';
import 'package:relief/data/repository/social_signin_repository.dart';

class LoginCubit extends CubitStream<LoginState> {
  LoginCubit(this.socialSignInRepository) : super(LoginInitial());

  final SocialSignInRepository socialSignInRepository;

  void signIn() async {
    emit(LoginLoading());
    await Firebase.initializeApp();
    try {
      ReliefUser facebookUser =
          await socialSignInRepository.loginWithFacebook();
      print(facebookUser);
      emit(LoginSuccess(user: facebookUser));
    } catch (e) {
      print(e);
      emit(LoginError());
    }
  }
}
