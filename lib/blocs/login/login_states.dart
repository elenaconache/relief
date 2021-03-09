import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginError extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginEmpty extends LoginState {
  @override
  List<Object> get props => [];
}

class AlreadyLoggedIn extends LoginState {
  @override
  List<Object> get props => [];
}
