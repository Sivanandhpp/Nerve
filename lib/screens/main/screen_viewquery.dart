import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import '../../core/globalvalues/sizedboxes.dart' as sb;
import 'package:google_fonts/google_fonts.dart';
import '../../core/globalvalues/theme_color.dart';
import '../../main.dart';

class ViewQueryScreen extends StatefulWidget {
  const ViewQueryScreen({super.key});

  @override
  State<ViewQueryScreen> createState() => _ViewQueryScreenState();
}

class _ViewQueryScreenState extends State<ViewQueryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            left: 0, right: 10, top: 10, bottom: 10),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Student Queries",
                        style: GoogleFonts.ubuntu(
                          color: ThemeColor.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                sb.height10,
                FirebaseAnimatedList(
                  query: dbReference.child("queries"),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  sort: (b, a) {
                    return a.key.toString().compareTo(b.key.toString());
                  },
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Name: ${snapshot.child('name').value.toString()}",
                                    style: GoogleFonts.ubuntu(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: ThemeColor.primary),
                                  ),
                                  Text(
                                    "Batch: ${snapshot.child('batch').value.toString()}",
                                    style: GoogleFonts.ubuntu(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              sb.height10,
                              Text(
                                "Subject: ${snapshot.child('subject').value.toString()}",
                                style: GoogleFonts.ubuntu(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              sb.height10,
                              Text(
                                snapshot.child('query').value.toString(),
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
                      ],
                    );
                  },
                ),
                sb.height80
              ],
            ),
          ),
        ),
      ),
    );
  }
}
