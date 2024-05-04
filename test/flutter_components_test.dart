import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_components/primary_button.dart';

void main() {
  test("button testing", () {
    const primaryButton = PrimaryButton(
      text: "",
      buttonEnum: ButtonEnum.primaryElevatedButton,
    );
    return primaryButton;
  });
}
