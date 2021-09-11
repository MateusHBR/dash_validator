import 'package:dash_validator/src/validations/compare_dash_validation/compare_dash_validation.dart';
import 'package:test/test.dart';

void main() {
  group('Email validation', () {
    test('should return true when field is null or empty', () async {
      String? sut = '';
      bool isValid = CompareDashValidation(valueToCompare: 't').isValid(sut);
      expect(isValid, true);

      sut = null;
      isValid = CompareDashValidation(valueToCompare: 't').isValid(sut);
      expect(isValid, true);
    });

    test('should return true fields are equals', () async {
      final sut = 'test';

      final isValid = CompareDashValidation(
        valueToCompare: 'test',
      ).isValid(sut);

      expect(isValid, true);
    });

    test('should return false fields are not equals', () async {
      final sut = 'test1';

      final isValid = CompareDashValidation(
        valueToCompare: 'test2',
      ).isValid(sut);

      expect(isValid, false);
    });
  });
}
