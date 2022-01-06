class Validation {
  static String? emailValidator(String? val) {
    return val!.isEmpty ? "Enter an email" : null;
  }

  static String? passwordValidator(String? val) {
    return val!.length < 6 ? "Enter password 6+ chars long" : null;
  }

  static String? firstNameValidator(String? val) {
    return val!.isEmpty ? "Enter first name" : null;
  }
}
