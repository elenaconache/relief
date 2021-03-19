import 'package:cubit/cubit.dart';
import 'package:relief/blocs/register/register_states.dart';
import 'package:relief/data/repository/users_repository.dart';

class RegisterCubit extends CubitStream<RegisterState> {
  RegisterCubit(this._usersRepository) : super(RegisterInitial());

  final UsersRepository _usersRepository;

/*  void signInWithEmail(String email, String password) async {
    emit(LoginLoading());
    _usersRepository.login(email, password).then((value) async {
      print(value);
      await _preferencesRepository.saveString(keyCurrentToken, value.token);
      emit(LoginSuccess(user: value));
    }).catchError((e) {
      print(e);
      emit(LoginError());
    });
  }*/
}
