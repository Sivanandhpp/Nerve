import 'package:flutter/material.dart';
import 'package:nerve/core/globalvalues/theme_color.dart';
import 'package:nerve/core/services/routing_service.dart';
import 'package:nerve/screens/widgets/main_button.dart';
import '../../core/services/sharedpref_service.dart';
import '../../core/globalvalues/sizedboxes.dart' as sb;

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 40.0, bottom: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const Text(
              //   "NERVE",
              //   style: TextStyle(
              //     color: ThemeColor.purpleBG,
              //     fontSize: 40,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: const SizedBox(
                  // height: 70.0,
                  width: double.infinity,
                  child: Image(
                    image: AssetImage('assets/images/welcome.jpg'),
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: const [
                    Text(
                      "Let's get started",
                      style: TextStyle(
                        color: ThemeColor.purpleBG,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    sb.height10,
                    Text(
                      "Never a better time than now to start!",
                      style: TextStyle(
                        color: ThemeColor.purpleBG,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              MainButton(
                text: "Get Started",
                onTap: () {
                  SharedPreferencesService().setFirstSeen();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RoutingService()),
                  );
                },
                backgroundColor: ThemeColor.purpleBG,
                textColor: ThemeColor.white,
              ),
              // GestureDetector(
              //   onTap: () {
              //     setFirstSeen('2021');
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => LoginPage()),
              //     );
              //   },
              //   child: Container(
              //     width: double.infinity,
              //     height: 80,
              //     decoration: BoxDecoration(
              //         color: ThemeColor.purpleBG,
              //         borderRadius: BorderRadius.circular(20)),
              //     child: const Center(
              //       child: Text(
              //         "Get Started",
              //         style: TextStyle(fontSize: 20, color: ThemeColor.white),
              //       ),
              //     ),
              //   ),
              // ),

              // GestureDetector(
              //   onTap: () {
              //     setFirstSeen('2015');
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => WrapperScreen()),
              //     );
              //   },
              //   child: Container(
              //     width: double.infinity,
              //     height: 60,
              //     decoration: BoxDecoration(
              //         color: ThemeColor.scaffoldBgColor,
              //         borderRadius: BorderRadius.circular(20)),
              //     child: const Center(
              //       child: Text(
              //         "Revision 2015",
              //         style: TextStyle(fontSize: 20, color: ThemeColor.black),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
