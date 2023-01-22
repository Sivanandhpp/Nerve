import 'package:nerve/main.dart';

addNotification(
  String time,
  String date,
  String title,
  String content,
) {
  final notificationReferance = dbReference.child('Notifications/$time');
  notificationReferance.set({
    'date': date,
    'title': title,
    'content': content,
  });
}
