import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nerve/screens/main/screen_about.dart';
import 'package:provider/provider.dart';
import '../../core/globalvalues/sizedboxes.dart' as sb;
import '../../core/globalvalues/theme_color.dart';
import '../../core/services/auth_service.dart';

class DisabledAccount extends StatelessWidget {
  const DisabledAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                sb.height50,
                Text(
                  "Your account is disabled.",
                  style: GoogleFonts.ubuntu(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                sb.height10,
                Text(
                  "Contact admin or respective faculty.",
                  style: GoogleFonts.ubuntu(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                sb.height20,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: GestureDetector(
                    onTap: () async {
                      await authService.signOut();
                      // ignore: use_build_context_synchronously
                      // Navigator.pop(context);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                          color: ThemeColor.ytRed,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                        child: Text(
                          "Sign Out",
                          style:
                              TextStyle(fontSize: 15, color: ThemeColor.white),
                        ),
                      ),
                    ),
                  ),
                ),
                sb.height20,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: GestureDetector(
                    onTap: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ScreenAbout(topBar: true),
                          ));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                          color: ThemeColor.lightGrey,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                        child: Text(
                          "About",
                          style:
                              TextStyle(fontSize: 15, color: ThemeColor.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
