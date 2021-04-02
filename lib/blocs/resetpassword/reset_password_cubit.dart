import 'package:cubit/cubit.dart';
import 'package:relief/blocs/resetpassword/reset_password_states.dart';
import 'package:relief/data/model/base_api_response.dart';
import 'package:relief/data/repository/users_repository.dart';

class ResetPasswordCubit extends CubitStream<ResetPasswordState> {
  ResetPasswordCubit(this._usersRepository) : super(ResetPasswordInitial());

  final UsersRepository _usersRepository;

  void resetPassword(String email) async {
    emit(ResetPasswordLoading());
    _usersRepository
        .restorePassword(email)
        .then((BaseApiResponse<bool> value) async {
      print(value);
      if (value.data != null) {
        emit(ResetPasswordSuccess());
      } else {
        emit(ResetPasswordError(errorMessageTag: value.error.errorMessageTag));
      }
    });
  }
}
