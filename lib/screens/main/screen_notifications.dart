import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nerve/main.dart';
import 'package:nerve/screens/main/screen_addnotifi.dart';
import 'package:nerve/screens/widgets/image_viewer.dart';
import 'package:nerve/screens/widgets/pdf_viewer.dart';
import '../../core/globalvalues/sizedboxes.dart' as sb;
import '../../core/globalvalues/theme_color.dart';
import '../../core/services/database_service.dart';

class ScreenNotification extends StatefulWidget {
  const ScreenNotification({super.key});

  @override
  State<ScreenNotification> createState() => _ScreenNotificationState();
}

DatabaseService dbService = DatabaseService();

class _ScreenNotificationState extends State<ScreenNotification> {
  Widget headWithPower() {
    if (userData.role == "admin") {
      return Row(
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
              padding: const EdgeInsets.all(12),
              child: const Icon(
                FontAwesomeIcons.plus,
                size: 35,
                color: ThemeColor.black,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddNotification()),
              );
            },
          ),
        ],
      );
    }
    return Row(
      children: [
        Text(
          'Notifications',
          style: GoogleFonts.ubuntu(
            color: ThemeColor.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget titleWithDel(snapshot) {
    if (userData.role == "admin") {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            snapshot.child('title').value.toString(),
            style: GoogleFonts.ubuntu(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          InkWell(
            child: const Icon(FontAwesomeIcons.trash),
            onTap: () {
              dbReference.child('notifications/${snapshot.key}').remove();
            },
          )
        ],
      );
    }

    return Text(
      snapshot.child('title').value.toString(),
      style: GoogleFonts.ubuntu(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }

  Widget isImageAvailable(snapshot) {
    if (snapshot.child('url').value == "null") {
      return Container();
    } else if (snapshot.child('extension').value == ".pdf") {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PdfViewer(
                  src: snapshot.child('url').value.toString(),
                  pdfName: snapshot.child('title').value.toString()),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: const SizedBox(
            height: 80.0,
            width: 80.0,
            child: Image(
              image: AssetImage("assets/images/pdf.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageViewer(
                src: snapshot.child('url').value.toString(),
                imgName: snapshot.child('title').value.toString()),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: SizedBox(
          height: 80.0,
          width: 80.0,
          child: Image(
            image: NetworkImage(snapshot.child('url').value.toString()),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                headWithPower(),
                sb.height10,
                FirebaseAnimatedList(
                  query: dbReference.child("notifications"),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  defaultChild: const Center(
                    child: CircularProgressIndicator(
                      color: ThemeColor.primary,
                    ),
                  ),
                  itemBuilder: (context, snapshot, animation, index) {
                    return Column(
                      children: [
                        sb.height10,
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  color: ThemeColor.shadow,
                                  blurRadius: 10,
                                  spreadRadius: 0.1,
                                  offset: Offset(0, 10)),
                            ],
                            color: ThemeColor.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              isImageAvailable(snapshot),
                              sb.width10,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    titleWithDel(snapshot),
                                    sb.height10,
                                    Text(
                                      snapshot
                                          .child('content')
                                          .value
                                          .toString(),
                                      style: GoogleFonts.ubuntu(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 1,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          snapshot
                                              .child('date')
                                              .value
                                              .toString(),
                                          style: const TextStyle(
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
                sb.height80,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
