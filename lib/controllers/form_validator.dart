class FormValidator {
  final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  String? validateEmail(String? email) {
    if (email!.isEmpty) {
      return 'Please enter your email address.';
    } else if (!emailRegex.hasMatch(email)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password!.isEmpty) {
      return 'Please enter your password.';
    } else if (password.length < 6) {
      return 'Password must be at least 6 characters long.';
    }

    return null;
  }

  String? validateConfirmPassword(String? confirmPassword, String password) {
    if (confirmPassword!.isEmpty) {
      return 'Please enter your password confirmation.';
    } else if (confirmPassword != password) {
      return 'Password must match';
    }
    return null;
  }
}
