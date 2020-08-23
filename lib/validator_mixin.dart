class ValidationMixing {
  String validateEmail(val) {
    if (val.isEmpty) {
      return "* Required";
    } else if (!RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(val)) {
      return "Email address not valid";
    }
    return null;
  }

  String validatePassword(val) {
    if (val.isEmpty) {
      return "*Required";
    } else if (val.length < 8) {
      return "Minimum 8 characters required";
    } else {
      return null;
    }
  }

  String isEmptyValidation(val) {
    if (val.isNotEmpty) return null;
    return "* Required";
  }
}
