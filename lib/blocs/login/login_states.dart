import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:relief/data/model/relief_user.dart';

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
  final ReliefUser user;

  LoginSuccess({@required this.user});

  @override
  List<Object> get props => [user];
}

class LoginError extends LoginState {
  final String errorMessageTag;

  LoginError({this.errorMessageTag});

  @override
  List<Object> get props => [errorMessageTag];
}

class LoginEmpty extends LoginState {
  @override
  List<Object> get props => [];
}

class AlreadyLoggedIn extends LoginState {
  @override
  List<Object> get props => [];
}
