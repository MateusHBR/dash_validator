import 'package:dash_validator/src/validations/between_length_dash_validation/between_length_dash_validation.dart';
import 'package:test/test.dart';

void main() {
  group('Between Length Validation', () {
    test('should return true when field if null or empty', () async {
      String? sut = '';
      bool isValid = BetweenLengthDashValidation(
        errorMessage: '',
        minLength: 0,
        maxLength: 1,
      ).isValid(sut);
      expect(isValid, true);

      sut = null;
      isValid = BetweenLengthDashValidation(
        errorMessage: '',
        minLength: 0,
        maxLength: 1,
      ).isValid(sut);
      expect(isValid, true);
    });

    test('should return true if text length is between minLength and maxLength',
        () async {
      String? sut = 'test';
      bool isValid = BetweenLengthDashValidation(
        errorMessage: '',
        minLength: 2,
        maxLength: 5,
      ).isValid(sut);
      expect(isValid, true);
    });

    test('should return false if text length is bigger than maxLength',
        () async {
      String? sut = 'test';
      bool isValid = BetweenLengthDashValidation(
        errorMessage: '',
        minLength: 1,
        maxLength: 3,
      ).isValid(sut);
      expect(isValid, false);
    });

    test('should return false if text length is less than minLength', () async {
      String? sut = 'test';
      bool isValid = BetweenLengthDashValidation(
        errorMessage: '',
        minLength: 6,
        maxLength: 9,
      ).isValid(sut);
      expect(isValid, false);
    });

    test('should throws an Asset if minLenght is bigger than maxLength',
        () async {
      String? sut = 'test';

      final Matcher throwsAssertionError = throwsA(isA<AssertionError>());

      expect(
        () => BetweenLengthDashValidation(
          errorMessage: '',
          minLength: 6,
          maxLength: 5,
        ).isValid(sut),
        throwsAssertionError,
      );
    });
  });
}
