import 'package:equatable/equatable.dart';

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
  // final ReliefUser user;

  // LoginSuccess({@required this.user});

  @override
  List<Object> get props => [
        /*user*/
      ];
}

class RegisterError extends RegisterState {
  @override
  List<Object> get props => [];
}
