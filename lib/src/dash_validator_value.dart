abstract class DashValidatorValue<T> {
  String get errorMessage;

  bool isValid(T? value);

  String? call(T? value) {
    return isValid(value) ? null : errorMessage;
  }
}
