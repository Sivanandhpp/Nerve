import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nerve/core/services/notification_service.dart';
import 'package:nerve/main.dart';
import '../../core/globalvalues/sizedboxes.dart' as sb;
import '../../core/globalvalues/theme_color.dart';

class ScreenNotification extends StatefulWidget {
  const ScreenNotification({super.key});

  @override
  State<ScreenNotification> createState() => _ScreenNotificationState();
}

DateTime _now = DateTime.now();
final String _dateCreated = DateFormat.yMEd().format(_now);
String _time = DateFormat.Hms().format(_now);
final TextEditingController _messageTitle = TextEditingController();
final TextEditingController _messageContent = TextEditingController();

class _ScreenNotificationState extends State<ScreenNotification> {
  final database = dbReference.child('Notifications');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Notifications',
                      style: GoogleFonts.ubuntu(
                        color: ThemeColor.black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            color: ThemeColor.lightGrey,
                            borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.all(12),
                        child: const FaIcon(
                          FontAwesomeIcons.message,
                        ),
                      ),
                      onTap: () {
                        messageAddPopUp(context);
                      },
                    ),
                  ],
                ),
                sb.height20,
                FirebaseAnimatedList(
                  query: database,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  defaultChild: const Center(
                    child: CircularProgressIndicator(),
                  ),
                  itemBuilder: (context, snapshot, animation, index) {
                    return Container(
                      margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: ThemeColor.black),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.child('title').value.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            sb.height10,
                            Text(
                              snapshot.child('content').value.toString(),
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            sb.height10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  snapshot.child('date').value.toString(),
                                  style: const TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> messageAddPopUp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Center(
              child: Text(
                'Add Notifications',
                style: GoogleFonts.ubuntu(
                  color: ThemeColor.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    controller: _messageTitle,
                    maxLines: 1,
                    maxLength: 20,
                    decoration: const InputDecoration(
                      hintText: 'Message Title',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4.0),
                        ),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    controller: _messageContent,
                    decoration: const InputDecoration(
                      hintText: 'Message Content',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4.0),
                        ),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    addNotification(
                      _time,
                      _dateCreated,
                      _messageTitle.text,
                      _messageContent.text,
                    );
                    Navigator.pop(context);
                    _messageContent.clear();
                    _messageTitle.clear();
                  },
                  child: const Text('Upload Message'),
                ),
              )
            ],
          );
        });
  }
}
