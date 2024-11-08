abstract class AppRegexs {
  static const emailValidationRegex = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const passwordValidationRegex = r"^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).*$";
  static const canadianPhoneRegex = r'^\+1\d{10}$';
  static const oneSepecialCharacterRegex = r'[!@#$%^&*(),.?":{}|<>]';
  static const oneNumberRegex = r'[0-9]';
  static const usernamePattern = r'^[a-zA-Z0-9]{3,15}$';
}
