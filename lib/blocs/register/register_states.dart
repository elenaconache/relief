import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:relief/data/model/registration_response.dart';

abstract class RegisterState extends Equatable {}

class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterLoading extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterSuccess extends RegisterState {
  final RegistrationResponse response;

  RegisterSuccess({@required this.response});

  @override
  List<Object> get props => [response];
}

class RegisterError extends RegisterState {
  final String errorMessageTag;

  RegisterError({@required this.errorMessageTag});

  @override
  List<Object> get props => [errorMessageTag];
}
