part of 'signup_bloc.dart';

@immutable
abstract class SignupState {}

final class SignupInitial extends SignupState {}

final class LoadingState extends SignupState{
  
}

final class SignUpSuccessState extends SignupState {}

final class SignUpErrorState extends SignupState {
  final String error;

  SignUpErrorState(this.error);
}
