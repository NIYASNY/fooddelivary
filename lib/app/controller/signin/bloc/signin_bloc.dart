import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommercedeliveryapp/app/services/apiservices.dart';
import 'package:flutter_ecommercedeliveryapp/app/view/home/home_screen.dart';
import 'package:flutter_ecommercedeliveryapp/utils/colors.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninInitial()) {
    on<SignInButtonPressedEvent>(signInButtonPressedEvent);
    on<SignOutRequestedEvent>(signOutRequestedEvent);
  }

  FutureOr<void> signInButtonPressedEvent(
      SignInButtonPressedEvent event, Emitter<SigninState> emit) async {
    emit(SignInLoadingState());
    try {
      bool authSuccess =
          await ApiServices().signInUser(event.email, event.password);

      if (authSuccess) {
        emit(SignInSuccessState());
      } else {
        emit(SignInErrorState("Signup failed. Check your credentials."));
      }
    } on Exception catch (e) {
      if (e is DioException) {
        if (e.response != null) {
          log(e.response!.statusCode.toString() as num);
          showErrorSnackBar(event.context, e.toString());
        }
      }
      emit(SignInErrorState("An error occurred. Please try again later."));
    }
  }

  FutureOr<void> signOutRequestedEvent(
      SignOutRequestedEvent event, Emitter<SigninState> emit) {
    emit(SignInLoadingState());
    try {
      Future.delayed(const Duration(seconds: 1), () {
        return emit(SigninInitial());
      });
    } catch (e) {
      emit(SignInErrorState(e.toString()));
    }
  }
}
