import 'package:dash_validator/src/validations/email_dash_validation/email_dash_validation.dart';
import 'package:test/test.dart';

void main() {
  test('should return true when field is null or empty', () async {
    String? sut = '';
    bool isValid = EmailDashValidation().isValid(sut);
    expect(isValid, true);

    sut = null;
    isValid = EmailDashValidation().isValid(sut);
    expect(isValid, true);
  });

  test('should return true when email is valid', () async {
    String? sut = 'mateushbr@email.com';
    bool isValid = EmailDashValidation().isValid(sut);
    expect(isValid, true);

    sut = 'valid_email@flutter.com.br';
    isValid = EmailDashValidation().isValid(sut);
    expect(isValid, true);
  });

  test('should return false when email is invalid valid', () async {
    String? sut = 'mateushbr@email.';
    bool isValid = EmailDashValidation().isValid(sut);
    expect(isValid, false);

    sut = '@flutter.com.br';
    isValid = EmailDashValidation().isValid(sut);
    expect(isValid, false);

    sut = 'flutter';
    isValid = EmailDashValidation().isValid(sut);
    expect(isValid, false);
  });
}
