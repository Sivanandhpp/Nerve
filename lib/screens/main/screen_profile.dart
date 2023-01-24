import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nerve/core/services/auth_service.dart';
import 'package:nerve/main.dart';
import 'package:provider/provider.dart';
import '../../core/globalvalues/sizedboxes.dart' as sb;
import '../../core/globalvalues/theme_color.dart';

class ScreenProfile extends StatefulWidget {
  const ScreenProfile({super.key});

  @override
  State<ScreenProfile> createState() => _ScreenProfileState();
}

class _ScreenProfileState extends State<ScreenProfile> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
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
                            "Profile",
                            style: GoogleFonts.ubuntu(
                              color: ThemeColor.black,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          child: const Icon(
                            FontAwesomeIcons.penToSquare,
                            size: 30,
                            color: ThemeColor.black,
                          ),
                        ),
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const AddNotification()),
                          // );
                        },
                      ),
                    ],
                  ),
                ),
                sb.height20,
                const Center(
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.transparent,
                    child: ClipOval(
                      child: Image(
                        image: AssetImage('assets/images/avatar.jpg'),
                      ),
                    ),
                  ),
                ),
                sb.height20,
                Text(
                  userData.name,
                  style: GoogleFonts.ubuntu(
                    color: ThemeColor.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                sb.height10,
                Text(
                  "Mail ID: ${userData.email}",
                  style: GoogleFonts.ubuntu(
                    color: ThemeColor.black,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                sb.height10,
                Text(
                  "Phone No: ${userData.phoneNo}",
                  style: GoogleFonts.ubuntu(
                    color: ThemeColor.black,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                sb.height10,
                Text(
                  "Batch: ${userData.batch} | Revision: ${userData.revision}",
                  style: GoogleFonts.ubuntu(
                    color: ThemeColor.black,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await authService.signOut();
                  },
                  child: Container(
                    margin: EdgeInsets.all(40),
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                        color: ThemeColor.ytRed,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text(
                        "Sign Out",
                        style: TextStyle(fontSize: 15, color: ThemeColor.white),
                      ),
                    ),
                  ),
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
