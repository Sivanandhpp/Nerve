import 'package:flutter/cupertino.dart';
import 'package:nerve/core/globalvalues/user_data.dart';
import 'package:nerve/core/services/error_handler.dart';
import '../../main.dart';

class DatabaseService {
  ErrorHandler errHandler = ErrorHandler();
  Future<Post> getDatabaseUser(String uid) async {
    await dbReference.child('users/$uid').once().then(
          (value) => userData.snapshotToClass(uid, value.snapshot),
        );
    return userData;
  }

  setDatabaseUser(String uid, String name, String email, String phoneNo,
      String password, String batch, String revision, String role) {
    final userReferance = dbReference.child('users/$uid');

    userReferance.set({
      'name': name,
      'email': email,
      'phone': phoneNo,
      'password': password,
      'batch': batch,
      'revision': revision,
      'role': role
    });
  }

  setDatabaseValue(String key, String value, String uid) {
    final userReferance = dbReference.child('users/$uid');

    userReferance.update({key: value});
  }

  Future<void> addNotification(
    String title,
    String content,
    String url,
    String fileExt,
    DateTime now,
    BuildContext context
  ) async {
    try {
     

      String time = "${now.hour}:${now.minute}:${now.second}";
      String date = "${now.day}/${now.month}/${now.year}";

      final notificationReferance = dbReference.child('notifications/$time');
      notificationReferance.set({
        'date': date,
        'time': time,
        'title': title,
        'content': content,
        'url':url,
        'extension':fileExt
      });
    } catch (e) {
      errHandler.fromErrorCode(e, context);
    }
  }
}
