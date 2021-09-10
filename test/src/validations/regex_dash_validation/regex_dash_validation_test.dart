import 'package:test/test.dart';

import 'package:dash_validator/src/validations/regex_dash_validation/regex_dash_validation.dart';

void main() {
  group('Regexp Validation', () {
    test('should return true when field is null or empty', () async {
      String? sut = '';
      bool isValid = RegExpDashValidation(
        errorMessage: '',
        regexp: RegExp(''),
      ).isValid(sut);
      expect(isValid, true);

      sut = null;
      isValid = RegExpDashValidation(
        errorMessage: '',
        regexp: RegExp(''),
      ).isValid(sut);
      expect(isValid, true);
    });

    test('should return true if regex is valid', () async {
      final emailRegex = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
      );

      String? sut = 'mateushbr@email.com';
      bool isValid = RegExpDashValidation(
        errorMessage: '',
        regexp: emailRegex,
      ).isValid(sut);
      expect(isValid, true);

      sut = 'valid_email@flutter.com.br';
      isValid = RegExpDashValidation(
        errorMessage: '',
        regexp: emailRegex,
      ).isValid(sut);
      expect(isValid, true);
    });

    test('should return false if regex is in valid', () async {
      final emailRegex = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
      );

      String? sut = 'mateushbr.com';
      bool isValid = RegExpDashValidation(
        errorMessage: '',
        regexp: emailRegex,
      ).isValid(sut);
      expect(isValid, false);

      sut = '@flutter.com.br';
      isValid = RegExpDashValidation(
        errorMessage: '',
        regexp: emailRegex,
      ).isValid(sut);
      expect(isValid, false);
    });
  });
}
