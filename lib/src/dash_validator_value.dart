abstract class DashValidatorValue {
  String get errorMessage;

  bool isValid(String? value);

  String? call(String? value) {
    return isValid(value) ? null : errorMessage;
  }
}
