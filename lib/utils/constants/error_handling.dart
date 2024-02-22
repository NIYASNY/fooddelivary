import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


void handleApiError({
  required VoidCallback onSuccess,
  required BuildContext context,
  required Response<dynamic> response,
}) {
  if (response.statusCode == 200) {
    onSuccess();
  } else {
    // Handle different error codes accordingly
    String errorMessage = "An error occurred";
    if (response.statusCode == 404) {
      errorMessage = "Resource not found";
    } else if (response.statusCode == 401) {
      errorMessage = "Unauthorized";
    } else if (response.statusCode == 500) {
      errorMessage = "Internal server error";
    } else {
      // Handle other status codes
      errorMessage = "Error: ${response.statusCode}";
    }
    
    // Show error message using a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
      ),
    );
  }
}
