class ValidationMixing {
  String validateEmail(val) {
    bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(val);
    if (emailValid) return null;
    return "Email address not valid";
  }

  String validatePassword(val) {
    if (val.length >= 2 && val!=null) return null;
    return "Password too short";
  }

  String isEmptyValidation(val) {
    if (val.isNotEmpty) return null;
    return "Cannot be empty";
  }
}
