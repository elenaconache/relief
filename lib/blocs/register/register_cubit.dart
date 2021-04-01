import 'package:cubit/cubit.dart';
import 'package:relief/blocs/register/register_states.dart';
import 'package:relief/data/model/base_api_response.dart';
import 'package:relief/data/model/registration_response.dart';
import 'package:relief/data/repository/users_repository.dart';

class RegisterCubit extends CubitStream<RegisterState> {
  RegisterCubit(this._usersRepository) : super(RegisterInitial());

  final UsersRepository _usersRepository;

  void register(String email, String password, String name) async {
    emit(RegisterLoading());
    _usersRepository.register(email, password, name).then((BaseApiResponse<RegistrationResponse> value) async {
      if(value.data != null){
        emit(RegisterSuccess(response: value.data));
      }else{
        emit(RegisterError(errorMessageTag: value.error.errorMessageTag));
      }
    });
  }
}
