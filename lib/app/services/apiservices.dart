import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommercedeliveryapp/utils/colors.dart';
import 'package:flutter_ecommercedeliveryapp/utils/constants/error_handling.dart';
import 'package:flutter_ecommercedeliveryapp/utils/constants/signupurl.dart';

class ApiServices {
  Dio dio = Dio();

//........Sign up.......//

  Future<bool> signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
    required String mobile,
  }) async {
    var data = {
      "name": name,
      "email": email,
      "password": password,
      "mobile": mobile,
    };

    try {
      final response = await dio.post(
        signUpUrl,
        data: jsonEncode(data),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      // ignore: use_build_context_synchronously
      handleApiError(
        response: response,
        context: context,
        onSuccess: () {
          showSuccessSnackBar(
            context,
            'Account created! Login with the same credentials!',
          );
        },
      );

      log(response.statusCode.toString());
      print(response.statusCode);

      return response.statusCode == 200;
    } on DioException {
      rethrow;
    }
  }
}
