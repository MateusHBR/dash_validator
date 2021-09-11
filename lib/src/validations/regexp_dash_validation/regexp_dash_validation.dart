import '../../dash_validator_value.dart';

class RegExpDashValidation extends DashValidatorValue<String> {
  @override
  final String errorMessage;
  final RegExp regexp;

  RegExpDashValidation({
    required this.regexp,
    required this.errorMessage,
  });

  @override
  bool isValid(String? value) {
    if (value?.isEmpty ?? true) {
      return true;
    }

    if (regexp.hasMatch(value!)) {
      return true;
    }

    return false;
  }
}
