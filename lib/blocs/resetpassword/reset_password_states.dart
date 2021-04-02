import 'package:equatable/equatable.dart';

abstract class ResetPasswordState extends Equatable {}

class ResetPasswordInitial extends ResetPasswordState {
  @override
  List<Object> get props => [];
}

class ResetPasswordLoading extends ResetPasswordState {
  @override
  List<Object> get props => [];
}

class ResetPasswordSuccess extends ResetPasswordState {
  @override
  List<Object> get props => [];
}

class ResetPasswordError extends ResetPasswordState {
  final String errorMessageTag;

  ResetPasswordError({this.errorMessageTag});

  @override
  List<Object> get props => [errorMessageTag];
}
