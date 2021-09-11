import 'package:dash_validator/dash_validator.dart';
import 'package:test/test.dart';

void main() {
  test('should validate calling all fields from list', () {
    final sut = DashValidatorSpy(isValid: true);

    DashValidator().addSingle(validator: sut).validate('value');

    expect(sut.calledValidation, 1);
  });

  test('should validate calling all fields from list', () {
    final sut = DashValidatorSpy(isValid: true);

    DashValidator().addMultiple(validators: [sut, sut, sut]).validate('value');

    expect(sut.calledValidation, 3);
  });

  test('should validate calling all fields from list', () {
    final sut = DashValidatorSpy(isValid: true);

    DashValidator().addMultiple(validators: [sut, sut, sut]).validate('value');

    expect(sut.calledValidation, 3);
  });

  test('should return the first error message from the list', () {
    final dashValidatorSpy = DashValidatorSpy(isValid: false);

    String? sut = DashValidator()
        .addSingle(validator: dashValidatorSpy)
        .required()
        .validate('value');
    expect(sut, defaultErrorMessage);

    sut = DashValidator()
        .required()
        .addSingle(validator: dashValidatorSpy)
        .validate('');
    expect(sut, requiredFieldMessage);

    sut = DashValidator()
        .required()
        .email()
        .addSingle(validator: dashValidatorSpy)
        .validate('value');
    expect(sut, emailFieldMessage);
  });

  group('builders', () {
    test(
        'DashValidator.addMultiple should return DashValidator with all validators from the list',
        () {
      final sut = DashValidator().addMultiple(validators: [
        RequiredDashValidation(),
        RequiredDashValidation(),
      ]);

      expect(sut.validators.length, 2);

      expect(
        sut.validators[0],
        isA<RequiredDashValidation>(),
      );

      expect(
        sut.validators[1],
        isA<RequiredDashValidation>(),
      );
    });

    test(
        'DashValidator.addSingle should return DashValidator with only the first validator from list',
        () {
      final sut = DashValidator().addSingle(
        validator: RequiredDashValidation(),
      );

      expect(sut.validators.length, 1);

      expect(
        sut.validators[0],
        isA<RequiredDashValidation>(),
      );
    });

    test(
        'DashValidator.required should return DashValidator with RequiredDashValidation in validators list',
        () {
      final sut = DashValidator().required();

      expect(sut.validators.length, 1);
      expect(
        sut.validators[0],
        isA<RequiredDashValidation>(),
      );
    });

    test(
        'DashValidator.email should return DashValidator with EmailDashValidation in validators list',
        () {
      final sut = DashValidator().email();

      expect(sut.validators.length, 1);
      expect(
        sut.validators[0],
        isA<EmailDashValidation>(),
      );
    });

    test(
        'DashValidator.regExp should return DashValidator with RegExpDashValidation in validators list',
        () {
      final sut = DashValidator().regExp(
        errorMessage: 'any',
        regexp: RegExp('any'),
      );

      expect(sut.validators.length, 1);
      expect(
        sut.validators[0],
        isA<RegExpDashValidation>(),
      );
    });

    test(
        'DashValidator.maxLength should return DashValidator with MaxLengthDashValidation in validators list',
        () {
      final sut = DashValidator().maxLength(
        errorMessage: 'any',
        length: 4,
      );

      expect(sut.validators.length, 1);
      expect(
        sut.validators[0],
        isA<MaxLengthDashValidation>(),
      );
    });

    test(
        'DashValidator.minLength should return DashValidator with MinLengthDashValidation in validators list',
        () {
      final sut = DashValidator().minLength(
        errorMessage: 'any',
        length: 4,
      );

      expect(sut.validators.length, 1);
      expect(
        sut.validators[0],
        isA<MinLengthDashValidation>(),
      );
    });

    test(
        'DashValidator.between should return DashValidator with RangeDashValidation in validators list',
        () {
      final sut = DashValidator().range(
        errorMessage: 'any',
        minLength: 4,
        maxLength: 6,
      );

      expect(sut.validators.length, 1);
      expect(
        sut.validators[0],
        isA<RangeDashValidation>(),
      );
    });

    test(
        'DashValidator.compare should return DashValidator with CompareDashValidation in validators list',
        () {
      final sut = DashValidator().compare(valueToCompare: 'other');

      expect(sut.validators.length, 1);
      expect(
        sut.validators[0],
        isA<CompareDashValidation>(),
      );
    });
  });
}

const defaultErrorMessage = 'error message';

class DashValidatorSpy extends DashValidatorValue<String> {
  int calledValidation = 0;

  final bool _isValid;

  DashValidatorSpy({required bool isValid}) : _isValid = isValid;

  @override
  String? call(String? value) {
    calledValidation++;
    return super.call(value);
  }

  @override
  String get errorMessage => defaultErrorMessage;

  @override
  bool isValid(String? value) {
    return _isValid;
  }
}
