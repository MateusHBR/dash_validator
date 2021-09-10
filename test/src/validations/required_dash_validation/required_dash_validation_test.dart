import 'package:dash_validator/src/validations/required_dash_validation/required_dash_validation.dart';
import 'package:test/test.dart';

void main() {
  group('Required Validation', () {
    test('should return true on validate if field is not null or empty', () {
      final sut = 'test';

      final isValid = RequiredDashValidation().isValid(sut);

      expect(isValid, true);
    });

    test('should return false on validate if field is empty', () {
      final sut = '';

      final isValid = RequiredDashValidation().isValid(sut);

      expect(isValid, false);
    });

    test('should return false on validate if field is null', () {
      final sut = null;

      final isValid = RequiredDashValidation().isValid(sut);

      expect(isValid, false);
    });
  });
}
