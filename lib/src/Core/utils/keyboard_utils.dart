import 'package:flutter/cupertino.dart';

class KeyboardUtils {
  KeyboardUtils._();

  static bool isKeyboardShowing() {
    if (WidgetsBinding.instance != null) {
      return WidgetsBinding.instance.window.viewInsets.bottom > 0;
    } else {
      return false;
    }
  }

  static closeKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static closeKeyboardIfOpened(BuildContext context) {
    if (isKeyboardShowing()) {
      closeKeyboard(context);
    }
  }
}
