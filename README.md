<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->
# Dash Validation
Is a Dart package without dependencies created to provides a easy way to validate fields.

## Features

- [x] Interface to create custom validation;
- [x] Required valiadation;
- [x] Email validation;
- [x] MaxLength validation;
- [x] MinLength validation;
- [x] BetweenLength validation;
- [x] RegExp validation;
- [x] Compare to another value validation;

## Getting started

1. Add the package dependency to your project:
```yaml
dependencies:
  # Use the latest version available. Any is just a placeholder
  dash_validator: any
```

2. Import the package to the file that you need to use.

3. Add to the place that you need to validate
```dart
TextFormField(
  decoration: InputDecoration(
    labelText: 'Email',
  ),
  validator: Validatorless.required().email().validate,
),
TextFormField(
  decoration: InputDecoration(
    labelText: 'Password',
  ),
  validator: Validatorless
    .required(errorMessage: 'Password ir required')
    .betweenLength(errorMessage: 'Field length must be between 2 and 5', maxLength: 5, minLength: 2)
    .validate,
),
```

## Dash Validators

We provides some initial validators, and you can contribute to growth together!


Class                          |       Shortcut         |                         Description                          |
-------------------------------|------------------------|--------------------------------------------------------------|
`none`                         |   `.addMultiple([])`   | Ensures all classes that extends DashValidator is validated  |
`none`                         |   `.addSingle()`       | Ensures the class that extends DashValidator is validated    |
`RequiredDashValidation`       |   `.required()`        | Ensures the value is not `null` or empty                     |
`EmailDashValidation`          |   `.email()`           | Ensures the value is a validly formatted email address       |
`RegExpDashValidation`         |   `.regExp()`          | Ensures the value is validated by a custom Regular Expression|
`MaxLengthDashValidation`      |   `.maxLength()`       | Ensures the value length is lesser than the length informed  |
`MinLengthDashValidation`      |   `.minLength()`       | Ensures the value length is bigger than the length informed  |
`RangeDashValidation`          |   `.range()`           | Ensures the value length is between the length informed      |
`CompareDashValidation`        |   `.compare()`         | Ensures the value is compared to another passed by parameter |

## Custom Validators

The `DashValidator` supports custom validators being added through classes extending the `DashValidatorValue<T>`.

### Example of Custom Validator

```dart
class CustomDashValidator extends DashValidatorValue<String> {
  //Here you can set your error message
  @override
  final String errorMessage;

  CustomDashValidator({
    required this.errorMessage,
  });

  @override
  bool isValid(String? value) {
    if (value?.isEmpty ?? true) {
      return true;
    }

    //Here you can add the logic to know if your field is valid or not

    return false;
  }
}

...

void main() {
  // start app

  final valueToValidate = 'custom validation';

  final errorMessage = DashValidator()
                        .addSingle(validator: CustomDashValidator(errorMessage: 'My custom error message'))
                        .validate(valueToValidate)
} 

...

//If you are using Flutter, you can add directly to TextFormField

TextFormField(
  decoration: InputDecoration(
    labelText: 'Email',
  ),
  validator: Validatorless
              .required(errorMessage: 'Email is required')
              .email()
              .addMultiple(validators: [CustomDashValidator(errorMessage: 'My custom error message')])
              .validate
), //In multiple validation you can add multiple validation classes in the array of validators
```

