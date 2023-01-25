import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nerve/main.dart';
import 'package:nerve/screens/main/screen_profile.dart';
import 'package:nerve/screens/widgets/popup_sem_select.dart';
import '../../core/globalvalues/sizedboxes.dart' as sb;
import '../../core/globalvalues/theme_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SemSelect semsel = SemSelect();
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome back',
                          style: GoogleFonts.ubuntu(
                            color: ThemeColor.black,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          userData.name,
                          style: GoogleFonts.ubuntu(
                            color: ThemeColor.secondary,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      child: userData.profile == 'null'
                          ? Container(
                              padding: const EdgeInsets.all(12),
                              child: const CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                child: ClipOval(
                                  child: Image(
                                    image:
                                        AssetImage("assets/images/avatar.jpg"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              padding: const EdgeInsets.all(12),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                child: ClipOval(
                                  child: Image(
                                    image: NetworkImage(userData.profile),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ScreenProfile()),
                        );
                      },
                    )
                  ],
                ),
                sb.height20,
                GestureDetector(
                  onTap: () => semsel.popupSemSelector("Syllabus", context),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: ThemeColor.shadow,
                            blurRadius: 100,
                            spreadRadius: 1,
                            offset: Offset(0, 10)),
                      ],
                      color: ThemeColor.primary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: -1,
                          bottom: -1,
                          child: SizedBox(
                            width: 250,
                            // height: 100,
                            // decoration: const BoxDecoration(
                            //     shape: BoxShape.circle,
                            //     color: ThemeColor.secondary),
                            child: Center(
                                child: Image.asset(
                              'assets/images/study.png',
                              fit: BoxFit.cover,
                            )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Syllabus",
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: ThemeColor.white),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Batch ${userData.batch}",
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: ThemeColor.white),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Revision ${userData.revision}",
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: ThemeColor.white),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 140,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: ThemeColor.secondary,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: Text(
                                      "View",
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 13,
                                          color: ThemeColor.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                sb.height20,
                GestureDetector(
                  onTap: () => semsel.popupSemSelector("Lab Manual", context),
                  child: Container(
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
                      color: ThemeColor.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Lab Manual",
                            style: GoogleFonts.ubuntu(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                                color: ThemeColor.secondary,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                "View",
                                style: GoogleFonts.ubuntu(
                                    fontSize: 13, color: ThemeColor.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                sb.height10,
                GestureDetector(
                  onTap: () =>
                      semsel.popupSemSelector("Question Paper", context),
                  child: Container(
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
                      color: ThemeColor.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Question Paper",
                            style: GoogleFonts.ubuntu(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                                color: ThemeColor.secondary,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                "View",
                                style: GoogleFonts.ubuntu(
                                    fontSize: 13, color: ThemeColor.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                sb.height10,
                GestureDetector(
                  onTap: () => semsel.popupSemSelector("Notes", context),
                  child: Container(
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
                      color: ThemeColor.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Notes",
                            style: GoogleFonts.ubuntu(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                                color: ThemeColor.secondary,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                "View",
                                style: GoogleFonts.ubuntu(
                                    fontSize: 13, color: ThemeColor.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
