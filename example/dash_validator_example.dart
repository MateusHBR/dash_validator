import 'package:dash_validator/dash_validator.dart';

void main() {
  final emailToValidate = 'test@email.com';

  final errorMessage =
      DashValidator().required().email().validate(emailToValidate);

  print(errorMessage);
}
