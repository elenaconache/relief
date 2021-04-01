import 'package:cubit/cubit.dart';
import 'package:relief/blocs/login/login_states.dart';
import 'package:relief/data/model/base_api_response.dart';
import 'package:relief/data/model/relief_user.dart';
import 'package:relief/data/repository/shared_preferences_repository.dart';
import 'package:relief/data/repository/social_signin_repository.dart';
import 'package:relief/data/repository/users_repository.dart';

class LoginCubit extends CubitStream<LoginState> {
  LoginCubit(this._socialSignInRepository, this._usersRepository,
      this._preferencesRepository)
      : super(LoginInitial());

  final SocialSignInRepository _socialSignInRepository;
  final UsersRepository _usersRepository;
  final SharedPreferencesRepository _preferencesRepository;

  void signInWithFacebook() async {
    emit(LoginLoading());
    try {
      ReliefUser facebookUser =
          await _socialSignInRepository.loginWithFacebook();
      ReliefUser apiUser = await _usersRepository.socialLogin(
          facebookUser.token, SocialLogin.FACEBOOK);
      await _preferencesRepository.saveString(keyCurrentToken, apiUser.token);
      emit(LoginSuccess(user: apiUser));
    } catch (e) {
      print(e);
      emit(LoginError(errorMessageTag: "error_api_status"));
    }
  }

  void signInWithGoogle() async {
    emit(LoginLoading());
    try {
      ReliefUser googleUser = await _socialSignInRepository.loginWithGoogle();
      ReliefUser apiUser = await _usersRepository.socialLogin(
          googleUser.token, SocialLogin.GOOGLE);
      await _preferencesRepository.saveString(keyCurrentToken, apiUser.token);
      emit(LoginSuccess(user: apiUser));
    } catch (e) {
      print(e);
      emit(LoginError(errorMessageTag: "error_api_status"));
    }
  }

  void signInWithEmail(String email, String password) async {
    emit(LoginLoading());
    _usersRepository
        .login(email, password)
        .then((BaseApiResponse<ReliefUser> value) async {
      print(value);
      if (value.data != null) {
        await _preferencesRepository.saveString(
            keyCurrentToken, value.data.token);
        emit(LoginSuccess(user: value.data));
      } else {
        emit(LoginError(errorMessageTag: value.error.errorMessageTag));
      }
    });
  }
}
