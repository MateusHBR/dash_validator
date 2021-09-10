import '../../dash_validator_value.dart';

class RegExpDashValidation extends DashValidatorValue<String> {
  @override
  final String errorMessage;
  final RegExp regex;

  RegExpDashValidation({
    required this.regex,
    required this.errorMessage,
  });

  @override
  bool isValid(String? value) {
    if (value?.isEmpty ?? true) {
      return true;
    }

    if (regex.hasMatch(value!)) {
      return true;
    }

    return false;
  }
}
