import 'validations/validations.dart';
import 'dash_validator_value.dart';

class DashValidator {
  final List<DashValidatorValue> _validators = [];

  DashValidator();

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

  DashValidator addSingle({
    required DashValidatorValue validator,
  }) {
    _validators.add(validator);

    return this;
  }

  DashValidator addMultiple({
    required List<DashValidatorValue> validators,
  }) {
    _validators.addAll(validators);

    return this;
  }

  DashValidator required({
    String errorMessage = requiredFieldMessage,
  }) {
    _validators.add(
      RequiredDashValidation(errorMessage: errorMessage),
    );

    return this;
  }

  DashValidator email({
    String errorMessage = emailFieldMessage,
  }) {
    _validators.add(
      EmailDashValidation(errorMessage: errorMessage),
    );

    return this;
  }

  DashValidator regExp({
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

  DashValidator maxLength({
    required String errorMessage,
    required int length,
  }) {
    _validators.add(
      MaxLengthDashValidation(errorMessage: errorMessage, maxLength: length),
    );

    return this;
  }

  DashValidator minLength({
    required String errorMessage,
    required int length,
  }) {
    _validators.add(
      MinLengthDashValidation(errorMessage: errorMessage, minLength: length),
    );

    return this;
  }

  DashValidator range({
    required String errorMessage,
    required int maxLength,
    required int minLength,
  }) {
    _validators.add(
      RangeDashValidation(
        errorMessage: errorMessage,
        minLength: minLength,
        maxLength: maxLength,
      ),
    );

    return this;
  }
}
