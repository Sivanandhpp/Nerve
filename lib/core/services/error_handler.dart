import 'package:flutter/cupertino.dart';
import '../../screens/widgets/popup_error.dart';

class ErrorHandler {
  ErrorPopup errPop = ErrorPopup();
  fromErrorCode(e, BuildContext context) {
    if (e.code == 'weak-password') {
      errPop.popupError(
          'Too weak password', 'The password provided is too weak.', context);
    } else if (e.code == 'email-already-in-use') {
      errPop.popupError('Account already exists',
          'The account already exists for that email.', context);
    } else if (e.code == 'user-not-found') {
      errPop.popupError(
          'Invalid EMail!', 'No user found for that email.', context);
    } else if (e.code == 'wrong-password') {
      errPop.popupError(
          'Wrong Password!', 'Wrong password provided for that user.', context);
    } else {
      errPop.popupError('Error!', e.toString(), context);
    }
  }
}
