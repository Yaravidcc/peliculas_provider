class FormValidators {
  static RegExp emailValidator() {
    String userName = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))';
    String serverName = r'@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    String pattern = "$userName$serverName";
    RegExp regExp = RegExp(pattern);
    return regExp;
  }

  static RegExp passwordValidator() {
    // The password's first character must be a letter, it must contain at least 4 characters and no more than 15 characters
    // and no characters other than letters, numbers and the underscore may be used
    String pattern = r'^[a-zA-Z]\w{3,14}$';
    RegExp regExp = RegExp(pattern);
    return regExp;
  }
}
