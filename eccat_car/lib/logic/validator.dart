import 'dart:io';

class InputValidator {
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Email';
    }
    if (!RegExp(r'^[\w-\.]+@gmail.com').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    // Perform DNS lookup to check if domain exists
    try {
      final result =  InternetAddress.lookup(value.split('@')[1]);
      if (result.then((res) => res.isEmpty) == true) {
        return 'Domain does not exist';
      }
    } catch (_) {
      return 'Domain does not exist';
    }
    return null;
  }

  static String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    if (!RegExp(r'^\+?[0-9]{8,}$').hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }
}
