import 'package:dash_validator/src/validations/max_length_dash_validation/max_length_dash_validation.dart';
import 'package:test/test.dart';

void main() {
  group('Max Length Validation', () {
    test('should return true when field if null or empty', () async {
      String? sut = '';
      bool isValid = MaxLengthDashValidation(
        errorMessage: '',
        maxLength: 1,
      ).isValid(sut);
      expect(isValid, true);

      sut = null;
      isValid = MaxLengthDashValidation(
        errorMessage: '',
        maxLength: 1,
      ).isValid(sut);
      expect(isValid, true);
    });

    test('should return true if text length is bigger than maxLength',
        () async {
      String? sut = 'test';
      bool isValid = MaxLengthDashValidation(
        errorMessage: '',
        maxLength: 5,
      ).isValid(sut);
      expect(isValid, true);
    });

    test('should return false if text length is less than maxLength', () async {
      String? sut = 'test';
      bool isValid = MaxLengthDashValidation(
        errorMessage: '',
        maxLength: 3,
      ).isValid(sut);
      expect(isValid, false);
    });
  });
}
