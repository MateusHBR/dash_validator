import 'validations/validations.dart';
import 'dash_validator_value.dart';

class DashValidation {
  final List<DashValidatorValue> _validators = [];

  DashValidation();

  List<DashValidatorValue> get validators => _validators;

  String? validate(String? value) {
    for (final validator in _validators) {
      final errorMessage = validator(value);

      if (errorMessage?.isNotEmpty ?? false) {
        return errorMessage;
      }
    }

    return null;
  }

  DashValidation addSingle({
    required DashValidatorValue validator,
  }) {
    _validators.add(validator);

    return this;
  }

  DashValidation addMultiple({
    required List<DashValidatorValue> validators,
  }) {
    _validators.addAll(validators);

    return this;
  }

  DashValidation required({
    String errorMessage = requiredFieldMessage,
  }) {
    _validators.add(
      RequiredDashValidation(errorMessage: errorMessage),
    );

    return this;
  }

  DashValidation email({
    String errorMessage = emailFieldMessage,
  }) {
    _validators.add(
      EmailDashValidation(errorMessage: errorMessage),
    );

    return this;
  }

  DashValidation regExp({
    required String errorMessage,
    required RegExp regexp,
  }) {
    _validators.add(
      RegExpDashValidation(
        errorMessage: errorMessage,
        regexp: regexp,
      ),
    );

    return this;
  }

  DashValidation maxLength({
    required String errorMessage,
    required int length,
  }) {
    _validators.add(
      MaxLengthDashValidation(errorMessage: errorMessage, maxLength: length),
    );

    return this;
  }

  DashValidation minLength({
    required String errorMessage,
    required int length,
  }) {
    _validators.add(
      MinLengthDashValidation(errorMessage: errorMessage, minLength: length),
    );

    return this;
  }

  DashValidation betweenLength({
    required String errorMessage,
    required int maxLength,
    required int minLength,
  }) {
    _validators.add(
      BetweenLengthDashValidation(
        errorMessage: errorMessage,
        minLength: minLength,
        maxLength: maxLength,
      ),
    );

    return this;
  }
}
