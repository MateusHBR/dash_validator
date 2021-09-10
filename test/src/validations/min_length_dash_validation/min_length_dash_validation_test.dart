import 'package:dash_validator/src/validations/min_length_dash_validation/min_length_dash_validation.dart';
import 'package:test/test.dart';

void main() {
  group('Min Length Validation', () {
    test('should return true when field if null or empty', () async {
      String? sut = '';
      bool isValid = MinLengthDashValidation(
        errorMessage: '',
        minLength: 1,
      ).isValid(sut);
      expect(isValid, true);

      sut = null;
      isValid = MinLengthDashValidation(
        errorMessage: '',
        minLength: 1,
      ).isValid(sut);
      expect(isValid, true);
    });

    test('should return true if text length is bigger than minLength',
        () async {
      String? sut = 'test';
      bool isValid = MinLengthDashValidation(
        errorMessage: '',
        minLength: 3,
      ).isValid(sut);
      expect(isValid, true);
    });

    test('should return false if text length is less than minLength', () async {
      String? sut = 'test';
      bool isValid = MinLengthDashValidation(
        errorMessage: '',
        minLength: 5,
      ).isValid(sut);
      expect(isValid, false);
    });
  });
}
