import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {}

class SplashInitial extends SplashState {
  @override
  List<Object> get props => [];
}

class TranslationsLoading extends SplashState {
  @override
  List<Object> get props => [];
}

class TranslationsSuccess extends SplashState {
  @override
  List<Object> get props => [];
}

class TranslationsError extends SplashState {
  @override
  List<Object> get props => [];
}
