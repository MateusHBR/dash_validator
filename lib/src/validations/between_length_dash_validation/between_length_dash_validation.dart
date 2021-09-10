import '../../dash_validator_value.dart';

class BetweenLengthDashValidation extends DashValidatorValue<String> {
  @override
  final String errorMessage;
  final int minLength;
  final int maxLength;

  BetweenLengthDashValidation({
    required this.errorMessage,
    required this.minLength,
    required this.maxLength,
  });

  @override
  bool isValid(String? value) {
    assert(minLength < maxLength);

    if (value?.isEmpty ?? true) {
      return true;
    }

    if (value!.length > minLength && value.length < maxLength) {
      return true;
    }

    return false;
  }
}
