part of 'signin_bloc.dart';

@immutable
abstract class SigninState {}

final class SigninInitial extends SigninState {}

final class SignInSuccessState extends SigninState {}

final class SignInErrorState extends SigninState {
  final String error;

  SignInErrorState(this.error);
}

final class SignInLoadingState extends SigninState {}
