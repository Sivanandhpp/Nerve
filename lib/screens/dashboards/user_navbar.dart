import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/globalvalues/theme_color.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class UserNavBar extends StatefulWidget {
  const UserNavBar({super.key});

  @override
  State<UserNavBar> createState() => _UserNavBarState();
}

class _UserNavBarState extends State<UserNavBar> {
  var home = ThemeColor.primary;
  var upload = ThemeColor.black;
  var gpaCal = ThemeColor.black;
  var about = ThemeColor.black;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (context, int newIndex, _) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(20),
            color: ThemeColor.white,
            child: SizedBox(
              width: double.infinity,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      indexChangeNotifier.value = 0;
                      setState(() {
                        home = ThemeColor.primary;
                        upload = ThemeColor.black;
                        gpaCal = ThemeColor.black;
                        about = ThemeColor.black;
                      });
                    },
                    child: SizedBox(
                      width: 70,
                      height: 70,
                      child: Icon(
                        FontAwesomeIcons.house,
                        size: 35.0,
                        color: home,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      indexChangeNotifier.value = 1;
                      setState(() {
                        home = ThemeColor.black;
                        upload = ThemeColor.primary;
                        gpaCal = ThemeColor.black;
                        about = ThemeColor.black;
                      });
                    },
                    child: SizedBox(
                      width: 70,
                      height: 70,
                      child: Icon(
                        FontAwesomeIcons.upload,
                        size: 35.0,
                        color: upload,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      indexChangeNotifier.value = 2;
                      setState(() {
                        home = ThemeColor.black;
                        upload = ThemeColor.black;
                        gpaCal = ThemeColor.primary;
                        about = ThemeColor.black;
                      });
                    },
                    child: SizedBox(
                      width: 70,
                      height: 70,
                      child: Icon(
                        FontAwesomeIcons.solidCompass,
                        size: 35.0,
                        color: gpaCal,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      indexChangeNotifier.value = 3;
                      setState(() {
                        home = ThemeColor.black;
                        upload = ThemeColor.black;
                        gpaCal = ThemeColor.black;
                        about = ThemeColor.primary;
                      });
                    },
                    child: SizedBox(
                      width: 70,
                      height: 70,
                      child: Icon(
                        FontAwesomeIcons.circleInfo,
                        size: 35.0,
                        color: about,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}



// BottomNavigationBar(
//           backgroundColor: ThemeColor.scaffoldBgColor,
//           currentIndex: newIndex,
//           onTap: (index) {
//             indexChangeNotifier.value = index;
//           },
//           elevation: 0,
//           type: BottomNavigationBarType.fixed,
//           selectedItemColor: ThemeColor.primary,
//           selectedIconTheme: const IconThemeData(color: ThemeColor.primary),
//           unselectedItemColor: Colors.grey,
//           unselectedIconTheme: const IconThemeData(color: ThemeColor.grey),
//           showUnselectedLabels: false,
//           showSelectedLabels: false,
//           // selectedFontSize: 12,
//           // unselectedFontSize: 10,
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.home,
//                 size: 30,
//               ),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.drive_folder_upload_outlined,
//                 size: 30,
//               ),
//               label: 'About',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.info,
//                 size: 30,
//               ),
//               label: 'About',
//             ),
//           ],
//         );