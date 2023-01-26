import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/globalvalues/theme_color.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class AdminNavBar extends StatefulWidget {
  const AdminNavBar({super.key});

  @override
  State<AdminNavBar> createState() => _AdminNavBarState();
}

class _AdminNavBarState extends State<AdminNavBar> {
  var home = ThemeColor.primary;
  var notification = ThemeColor.black;
  var upload = ThemeColor.black;
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
                        notification = ThemeColor.black;
                        upload = ThemeColor.black;
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
                        upload = ThemeColor.black;
                        notification = ThemeColor.primary;
                        about = ThemeColor.black;
                      });
                    },
                    child: SizedBox(
                      width: 70,
                      height: 70,
                      child: Icon(
                        FontAwesomeIcons.solidCompass,
                        size: 35.0,
                        color: notification,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      indexChangeNotifier.value = 2;
                      setState(() {
                        home = ThemeColor.black;
                        notification = ThemeColor.black;
                        upload = ThemeColor.primary;
                        about = ThemeColor.black;
                      });
                    },
                    child: SizedBox(
                      width: 70,
                      height: 70,
                      child: Icon(
                        FontAwesomeIcons.cloudArrowUp,
                        size: 35.0,
                        color: upload,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      indexChangeNotifier.value = 3;
                      setState(() {
                        home = ThemeColor.black;
                        notification = ThemeColor.black;
                        upload = ThemeColor.black;
                        about = ThemeColor.primary;
                      });
                    },
                    child: SizedBox(
                      width: 70,
                      height: 70,
                      child: Icon(
                        FontAwesomeIcons.solidEnvelope,
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
