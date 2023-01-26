import 'package:flutter/material.dart';
import 'package:nerve/core/services/database_service.dart';
import '../../core/globalvalues/sizedboxes.dart' as sb;
import 'package:google_fonts/google_fonts.dart';

import '../../core/globalvalues/theme_color.dart';

class QueryScreen extends StatefulWidget {
  const QueryScreen({super.key});

  @override
  State<QueryScreen> createState() => _QueryScreenState();
}

class _QueryScreenState extends State<QueryScreen> {
  DatabaseService dbService = DatabaseService();
  final TextEditingController _queryTextController = TextEditingController();
  final TextEditingController _subjectTextController = TextEditingController();
  String query = "Write your query";
  String subject = "Subject";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Queries',
                    style: GoogleFonts.ubuntu(
                      color: ThemeColor.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // InkWell(
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //         color: ThemeColor.lightGrey,
                  //         borderRadius: BorderRadius.circular(12)),
                  //     padding: const EdgeInsets.all(12),
                  //     child: const Icon(
                  //       Icons.verified_user,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  //   onTap: () async {
                  //     await spInstance.setBool('seen', false);
                  //   },
                  // )
                ],
              ),
              sb.height20,
              Container(
                padding: const EdgeInsets.all(10.0),
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: ThemeColor.shadow,
                        blurRadius: 10,
                        spreadRadius: 0.1,
                        offset: Offset(0, 10)),
                  ],
                  color: ThemeColor.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                    "Questions, concerns or requests you may have regarding the application and academic matters, including requests for profile changes.",
                    style: GoogleFonts.ubuntu(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: ThemeColor.white),
                    textAlign: TextAlign.center),
              ),
              sb.height20,
              Container(
                width: double.infinity,
                height: 60,
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
                child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                    child: TextField(
                      controller: _subjectTextController,
                      onChanged: (value) {
                        subject = value;
                      },
                      showCursor: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        alignLabelWithHint: true,
                        hintText: subject,
                        hintStyle: GoogleFonts.ubuntu(color: ThemeColor.black),
                      ),
                    )),
              ),
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
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: TextField(
                    // expands: true,
                    maxLines: 5,
                    controller: _queryTextController,
                    onChanged: (value) {
                      query = value;
                    },
                    showCursor: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      alignLabelWithHint: true,
                      hintText: query,
                      hintStyle: GoogleFonts.ubuntu(color: ThemeColor.black),
                    ),
                  ),
                ),
              ),
              sb.height20,
              GestureDetector(
                onTap: () {
                  dbService.addQuery(subject, query, context).then((value) =>
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Query submitted sucessfully'))));
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                      color: ThemeColor.primary,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "Submit Query",
                      style: GoogleFonts.ubuntu(color: ThemeColor.white),
                    ),
                  ),
                ),
              ),
              sb.height20,
              Text("Queries will be reviewed by faculties.",
                  style: GoogleFonts.ubuntu(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: ThemeColor.black),
                  textAlign: TextAlign.center),
              sb.height80,
            ],
          ),
        ),
      )),
    );
  }
}