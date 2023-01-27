import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/globalvalues/theme_color.dart';
import '../main/screen_doc.dart';

class SemSelect {
  popupSemSelector(String content, BuildContext context) {
    return showDialog<String>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        contentPadding: const EdgeInsets.all(20.0),
        title: Text(
          'Select Semester',
          style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold),
        ),
        content: SizedBox(
          height: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DisplayDoc(semester: "Sem I", content: content),
                        ),
                      );
                    },
                    child: Container(
                      width: 100,
                      height: 100,
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
                      child: Center(
                        child: Text(
                          'I',
                          style: TextStyle(
                              fontSize: 40,
                              fontFamily:
                                  GoogleFonts.odorMeanChey().fontFamily),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DisplayDoc(semester: "Sem II", content: content),
                        ),
                      );
                    },
                    child: Container(
                      width: 100,
                      height: 100,
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
                      child: Center(
                        child: Text(
                          'II',
                          style: TextStyle(
                              fontSize: 40,
                              fontFamily:
                                  GoogleFonts.odorMeanChey().fontFamily),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DisplayDoc(semester: "Sem III", content: content),
                        ),
                      );
                    },
                    child: Container(
                      width: 100,
                      height: 100,
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
                      child: Center(
                        child: Text(
                          'III',
                          style: TextStyle(
                              fontSize: 40,
                              fontFamily:
                                  GoogleFonts.odorMeanChey().fontFamily),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DisplayDoc(semester: "Sem IV", content: content),
                        ),
                      );
                    },
                    child: Container(
                      width: 100,
                      height: 100,
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
                      child: Center(
                        child: Text(
                          'IV',
                          style: TextStyle(
                              fontSize: 40,
                              fontFamily:
                                  GoogleFonts.odorMeanChey().fontFamily),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DisplayDoc(semester: "Sem V", content: content),
                        ),
                      );
                    },
                    child: Container(
                      width: 100,
                      height: 100,
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
                      child: Center(
                        child: Text(
                          'V',
                          style: TextStyle(
                              fontSize: 40,
                              fontFamily:
                                  GoogleFonts.odorMeanChey().fontFamily),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DisplayDoc(semester: "Sem VI", content: content),
                        ),
                      );
                    },
                    child: Container(
                      width: 100,
                      height: 100,
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
                      child: Center(
                        child: Text(
                          'VI',
                          style: TextStyle(
                              fontSize: 40,
                              fontFamily:
                                  GoogleFonts.odorMeanChey().fontFamily),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Center(
            child: TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: Text('Cancel',
                  style: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.bold, color: ThemeColor.ytRed)),
            ),
          ),
        ],
      ),
    );
  }
}
