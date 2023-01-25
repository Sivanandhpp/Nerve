import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nerve/main.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/globalvalues/sizedboxes.dart' as sb;
import '../../core/globalvalues/theme_color.dart';

class ScreenAbout extends StatelessWidget {
  const ScreenAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                userData.role == 'admin'
                    ? GestureDetector(
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
                              "About",
                              style: GoogleFonts.ubuntu(
                                color: ThemeColor.black,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     const Text(
                //       'About',
                //       style: TextStyle(
                //         color: ThemeColor.black,
                //         fontSize: 26,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //     InkWell(
                //       child: Container(
                //         decoration: BoxDecoration(
                //             color: ThemeColor.lightGrey,
                //             borderRadius: BorderRadius.circular(12)),
                //         padding: const EdgeInsets.all(12),
                //         child: const Icon(
                //           Icons.verified_user,
                //           color: Colors.white,
                //         ),
                //       ),
                //       onTap: () {
                //
                //       },
                //     ),
                //   ],
                // ),
                // sb.height20,
                Container(
                  width: double.infinity,
                  height: 380,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: ThemeColor.shadow,
                            blurRadius: 10,
                            spreadRadius: 0.2,
                            offset: Offset(0, 10)),
                      ],
                      color: ThemeColor.white,
                      borderRadius: BorderRadius.circular(30)),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.transparent,
                        child: ClipOval(
                          child: Image(
                            image: AssetImage('assets/images/logo.jpeg'),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'DEPARTMENT OF',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily:
                                    GoogleFonts.odorMeanChey().fontFamily),
                          ),
                          Text(
                            'COMPUTER HARDWARE ENGINEERING ',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily:
                                    GoogleFonts.odorMeanChey().fontFamily),
                          ),
                          Text(
                            'MODEL POLYTECHNIC COLLEGE, VADAKARA ',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily:
                                    GoogleFonts.odorMeanChey().fontFamily),
                          ),
                        ],
                      ),
                      Text(
                        'CONTACT LINKS',
                        style: GoogleFonts.ubuntu(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: ThemeColor.grey,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // InkWell(
                          //   child: const FaIcon(
                          //     FontAwesomeIcons.whatsapp,
                          //     size: 35,
                          //     color: ThemeColor.waGreen,
                          //   ),
                          //   onTap: () {},
                          // ),
                          InkWell(
                            child: const FaIcon(
                              FontAwesomeIcons.instagram,
                              size: 35,
                              color: ThemeColor.instaPurpleRed,
                            ),
                            onTap: () {
                              launchUrl(
                                  mode:
                                      LaunchMode.externalNonBrowserApplication,
                                  Uri(
                                      scheme: "https",
                                      host: "instagram.com",
                                      path: "modelpolytechniccollegevdk"));
                            },
                          ),
                          InkWell(
                            child: const FaIcon(
                              FontAwesomeIcons.facebook,
                              size: 35,
                              color: ThemeColor.primary,
                            ),
                            onTap: () {
                              launchUrl(
                                  mode:
                                      LaunchMode.externalNonBrowserApplication,
                                  Uri(
                                      scheme: "https",
                                      host: "facebook.com",
                                      path: "mptcv"));
                            },
                          ),
                          InkWell(
                            child: const FaIcon(
                              FontAwesomeIcons.linkedin,
                              size: 35,
                              color: ThemeColor.primary,
                            ),
                            onTap: () {
                              launchUrl(
                                  mode: LaunchMode.externalApplication,
                                  Uri(
                                      scheme: "https",
                                      host: "linkedin.com",
                                      path:
                                          "in/model-polytechnic-college-vadakara-9327a225a"));
                            },
                          ),
                          // InkWell(
                          //   child: const FaIcon(
                          //     FontAwesomeIcons.youtube,
                          //     size: 35,
                          //     color: ThemeColor.ytRed,
                          //   ),
                          //   onTap: () {},
                          // ),
                          InkWell(
                            child: const FaIcon(
                              FontAwesomeIcons.globe,
                              size: 35,
                              color: ThemeColor.instaPurpleRed,
                            ),
                            onTap: () {
                              launchUrl(
                                  mode: LaunchMode.externalApplication,
                                  Uri(
                                      scheme: "http",
                                      host: "mptvadakara.ihrd.ac.in"));
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                sb.height10,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Developers",
                          style: GoogleFonts.ubuntu(
                              color: ThemeColor.black,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    sb.height10,
                    Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: ThemeColor.shadow,
                              blurRadius: 100,
                              spreadRadius: 1,
                              offset: Offset(0, 10)),
                        ],
                        color: ThemeColor.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: const SizedBox(
                                    height: 70.0,
                                    width: 70.0,
                                    child: Image(
                                      image:
                                          AssetImage('assets/images/amal.jpeg'),
                                    ),
                                  ),
                                ),
                                sb.width20,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "Amal Raj",
                                      style: GoogleFonts.ubuntu(
                                          color: ThemeColor.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Software Developer",
                                      style: GoogleFonts.ubuntu(
                                          color: ThemeColor.grey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                launchUrl(
                                    mode: LaunchMode.externalApplication,
                                    Uri(
                                        scheme: "https",
                                        host: "amalrajkp18.github.io"));
                              },
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(10.0), //or 15.0
                                child: Container(
                                  height: 50.0,
                                  width: 50.0,
                                  color: ThemeColor.primary,
                                  child: const Icon(FontAwesomeIcons.bolt,
                                      color: Colors.white, size: 30.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    sb.height10,
                    Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: ThemeColor.shadow,
                              blurRadius: 100,
                              spreadRadius: 1,
                              offset: Offset(0, 10)),
                        ],
                        color: ThemeColor.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: const SizedBox(
                                    height: 70.0,
                                    width: 70.0,
                                    child: Image(
                                      image:
                                          AssetImage('assets/images/siva.jpg'),
                                    ),
                                  ),
                                ),
                                sb.width20,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "Siva Nandh",
                                      style: GoogleFonts.ubuntu(
                                          color: ThemeColor.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Software Engineer I",
                                      style: GoogleFonts.ubuntu(
                                          color: ThemeColor.grey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                launchUrl(
                                    mode: LaunchMode.externalApplication,
                                    Uri(
                                        scheme: "https",
                                        host: "sivanandhpp.github.io"));
                              },
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(10.0), //or 15.0
                                child: Container(
                                  height: 50.0,
                                  width: 50.0,
                                  color: ThemeColor.primary,
                                  child: const Icon(FontAwesomeIcons.bolt,
                                      color: Colors.white, size: 30.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
