import 'package:cubit/cubit.dart';
import 'package:relief/blocs/login/login_states.dart';
import 'package:relief/data/model/relief_user.dart';
import 'package:relief/data/repository/social_signin_repository.dart';

class LoginCubit extends CubitStream<LoginState> {
  LoginCubit(this.socialSignInRepository) : super(LoginInitial());

  final SocialSignInRepository socialSignInRepository;

  void signInWithFacebook() async {
    emit(LoginLoading());
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

  void signInWithGoogle() async {
    emit(LoginLoading());
    socialSignInRepository.loginWithGoogle().then((value) {
      print(value);
      emit(LoginSuccess(user: value));
    }).catchError((e) {
      print(e);
      emit(LoginError());
    });
  }
}
