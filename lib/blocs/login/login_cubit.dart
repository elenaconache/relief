import 'package:cubit/cubit.dart';
import 'package:relief/blocs/login/login_states.dart';

class LoginCubit extends CubitStream<LoginState> {
  LoginCubit() : super(LoginInitial());
}
