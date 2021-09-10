import '../../dash_validator_value.dart';

class MaxLengthDashValidation extends DashValidatorValue<String> {
  @override
  final String errorMessage;
  final int maxLength;

  MaxLengthDashValidation({
    required this.errorMessage,
    required this.maxLength,
  });

  @override
  bool isValid(String? value) {
    if (value?.isEmpty ?? true) {
      return true;
    }

    if (value!.length < maxLength) {
      return true;
    }

    return false;
  }
}
