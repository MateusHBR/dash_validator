import '../../dash_validator_value.dart';

const String emailFieldMessage = 'The email is invalid.';

class EmailDashValidation extends DashValidatorValue<String> {
  @override
  final String errorMessage;

  EmailDashValidation({
    this.errorMessage = emailFieldMessage,
  });

  @override
  bool isValid(String? value) {
    if (value?.isEmpty ?? true) {
      return true;
    }

    final emailRegex = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
    );

    if (emailRegex.hasMatch(value!)) {
      return true;
    }

    return false;
  }
}
