import 'package:intl/intl.dart';
import 'package:nerve/main.dart';

addNotification(
  String title,
  String content,
) {
  DateTime now = DateTime.now();
  String time = DateFormat.Hms().format(now);
  String date = DateFormat.yMEd().format(now);

  final notificationReferance = dbReference.child('Notifications/$time');
  notificationReferance.set({
    'date': date,
    'time': time,
    'title': title,
    'content': content,
  });
}
