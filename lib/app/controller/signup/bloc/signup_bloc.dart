import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommercedeliveryapp/app/services/apiservices.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignUpButtonPressedEvent>(signUpButtonPressedEvent);
  }

  FutureOr<void> signUpButtonPressedEvent(
      SignUpButtonPressedEvent event, Emitter<SignupState> emit) async {
    try {
      bool success = await ApiServices().signUpUser(
          context: event.context,
          email: event.email,
          password: event.password,
          name: event.name,
          mobile: event.mobile);

      if (success) {
        emit(SignUpSuccessState());
      } else {
        emit(SignUpErrorState("Signup failed. Check your credentials."));
      }
    } on Exception catch (e) {
      if (e is DioException) {
        if (e.response != null) {
          log(e.response!.statusCode.toString() as num);
        }
      }
      emit(SignUpErrorState("An error occurred. Please try again later."));
    }
  }
}
