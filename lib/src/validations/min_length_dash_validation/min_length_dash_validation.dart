import '../../dash_validator_value.dart';

class MinLengthDashValidation extends DashValidatorValue<String> {
  @override
  final String errorMessage;
  final int minLength;

  MinLengthDashValidation({
    required this.errorMessage,
    required this.minLength,
  });

  @override
  bool isValid(String? value) {
    if (value?.isEmpty ?? true) {
      return true;
    }

    if (value!.length > minLength) {
      return true;
    }

    return false;
  }
}
