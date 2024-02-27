part of 'signin_bloc.dart';

@immutable
abstract class SigninEvent {}

// ignore: must_be_immutable
class SignInButtonPressedEvent extends SigninEvent {
  String email;
  String password;
  BuildContext context;
  SignInButtonPressedEvent({
    required this.email,
    required this.password,
    required this.context,
  });


}

class SignOutRequestedEvent extends SigninEvent{}
