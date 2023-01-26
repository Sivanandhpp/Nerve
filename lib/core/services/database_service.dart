import 'package:flutter/cupertino.dart';
import 'package:nerve/core/globalvalues/user_data.dart';
import 'package:nerve/core/services/error_handler.dart';
import '../../main.dart';

class DatabaseService {
  ErrorHandler errHandler = ErrorHandler();
  Future<UserData> getDatabaseUser(String uid) async {
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
      'role': role,
      'profile': 'null'
    });
  }

  Future<void> updateDatabaseUser(
      String key, String value, String uid, BuildContext context) async {
    try {
      final userReferance = dbReference.child('users/$uid');

      userReferance.update({key: value});
    } catch (e) {
      errHandler.fromErrorCode(e, context);
    }
  }

  Future<void> addNotification(String title, String content, String url,
      String fileExt, DateTime now, BuildContext context) async {
    try {
      String notiRef =
          "${now.year}${now.month.toString().padLeft(2, "0")}${now.day.toString().padLeft(2, "0")}${now.hour.toString().padLeft(2, "0")}${now.minute.toString().padLeft(2, "0")}${now.second.toString().padLeft(2, "0")}";
      String time = "${now.hour.toString().padLeft(2,"0")}:${now.minute.toString().padLeft(2,"0")}:${now.second.toString().padLeft(2,"0")}";
      String date = "${now.day.toString().padLeft(2,"0")}/${now.month.toString().padLeft(2,"0")}/${now.year}";

      final notificationReferance = dbReference.child('notifications/$notiRef');
      notificationReferance.set({
        'date': date,
        'time': time,
        'title': title,
        'content': content,
        'url': url,
        'extension': fileExt
      });
    } catch (e) {
      errHandler.fromErrorCode(e, context);
    }
  }

  Future<void> addQuery(
      String subject, String query, BuildContext context) async {
    try {
      DateTime now = DateTime.now();
      String queryRef =
          "${now.year}${now.month.toString().padLeft(2, "0")}${now.day.toString().padLeft(2, "0")}${now.hour.toString().padLeft(2, "0")}${now.minute.toString().padLeft(2, "0")}${now.second.toString().padLeft(2, "0")}";
      String time = "${now.hour.toString().padLeft(2,"0")}:${now.minute.toString().padLeft(2,"0")}:${now.second.toString().padLeft(2,"0")}";
      String date = "${now.day.toString().padLeft(2,"0")}/${now.month.toString().padLeft(2,"0")}/${now.year}";
      dbReference.child('queries/$queryRef').set({
        'subject': subject,
        'query': query,
        'uid': userData.userid,
        'name': userData.name,
        'batch': userData.batch,
        'phone': userData.phoneNo,
        'date': date,
        'time': time,
      });
    } catch (e) {
      errHandler.fromErrorCode(e, context);
    }
  }
}
