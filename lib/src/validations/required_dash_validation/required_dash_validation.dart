import '../../dash_validator_value.dart';

const String requiredFieldMessage = 'The field is required.';

class RequiredDashValidation extends DashValidatorValue<String> {
  @override
  final String errorMessage;

  RequiredDashValidation({
    this.errorMessage = requiredFieldMessage,
  });

  @override
  bool isValid(String? value) {
    if (value?.isEmpty ?? true) {
      return false;
    }

    return true;
  }
}
