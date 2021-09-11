import '../../dash_validator_value.dart';

const String compareFieldMessage = 'This value is not equal to the other';

class CompareDashValidation extends DashValidatorValue<String> {
  @override
  final String errorMessage;
  final String valueToCompare;
  final bool ignoreCase;

  CompareDashValidation({
    this.errorMessage = compareFieldMessage,
    required this.valueToCompare,
    this.ignoreCase = false,
  });

  @override
  bool isValid(String? value) {
    if (value?.isEmpty ?? true) {
      return true;
    }

    if (ignoreCase) {
      if (value!.toLowerCase() == valueToCompare.toLowerCase()) {
        return true;
      }
    }

    if (value == valueToCompare) {
      return true;
    }

    return false;
  }
}
