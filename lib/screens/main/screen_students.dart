import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nerve/core/services/database_service.dart';
import 'package:nerve/main.dart';
import 'package:nerve/screens/main/screen_viewquery.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/globalvalues/sizedboxes.dart' as sb;
import '../../core/globalvalues/theme_color.dart';

class ViewStudents extends StatefulWidget {
  ViewStudents({Key? key}) : super(key: key);

  @override
  State<ViewStudents> createState() => _ViewStudentsState();
}

int currentYr = DateTime.now().year;

class _ViewStudentsState extends State<ViewStudents> {
  Widget alertBoxContents(DataSnapshot snapshot) {
    if (snapshot.child('status').value == 'disabled') {
      return GestureDetector(
        onTap: () {
          dbService.updateDatabaseUser(
              'status', 'active', snapshot.key.toString(), context);
          Navigator.pop(context);
        },
        child: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: ThemeColor.waGreen,
              borderRadius: BorderRadius.circular(10)),
          child: const Center(
            child: Text(
              "Enable user",
              style: TextStyle(fontSize: 15, color: ThemeColor.white),
            ),
          ),
        ),
      );
    } else if (snapshot.child('role').value == 'admin') {
      return GestureDetector(
        onTap: () {
          dbService.updateDatabaseUser(
              'role', 'user', snapshot.key.toString(), context);
          Navigator.pop(context);
        },
        child: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: ThemeColor.ytRed, borderRadius: BorderRadius.circular(10)),
          child: const Center(
            child: Text(
              "Remove admin",
              style: TextStyle(fontSize: 15, color: ThemeColor.white),
            ),
          ),
        ),
      );
    } else if (snapshot.child('status').value == 'verified') {
      return Column(
        children: [
          GestureDetector(
            onTap: () {
              dbService.updateDatabaseUser(
                  'role', 'admin', snapshot.key.toString(), context);
              Navigator.pop(context);
            },
            child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  color: ThemeColor.secondary,
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                child: Text(
                  "Make admin",
                  style: TextStyle(fontSize: 15, color: ThemeColor.white),
                ),
              ),
            ),
          ),
          sb.height10,
          GestureDetector(
            onTap: () {
              dbService.updateDatabaseUser(
                  'status', 'disabled', snapshot.key.toString(), context);
              Navigator.pop(context);
            },
            child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  color: ThemeColor.ytRed,
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                child: Text(
                  "Disable user",
                  style: TextStyle(fontSize: 15, color: ThemeColor.white),
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          GestureDetector(
            onTap: () {
              dbService.updateDatabaseUser(
                  'status', 'verified', snapshot.key.toString(), context);
              Navigator.pop(context);
            },
            child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  color: ThemeColor.waGreen,
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                child: Text(
                  "Verify user",
                  style: TextStyle(fontSize: 15, color: ThemeColor.white),
                ),
              ),
            ),
          ),
          sb.height10,
          GestureDetector(
            onTap: () {
              dbService.updateDatabaseUser(
                  'status', 'disabled', snapshot.key.toString(), context);
              dbService.updateDatabaseUser(
                  'role', 'user', snapshot.key.toString(), context);
              Navigator.pop(context);
            },
            child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  color: ThemeColor.ytRed,
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                child: Text(
                  "Disable user",
                  style: TextStyle(fontSize: 15, color: ThemeColor.white),
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget userStatus(DataSnapshot snapshot) {
    if (snapshot.child('status').value == 'disabled') {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
            border: Border.all(color: ThemeColor.ytRed, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: const Text(
          "Disabled",
          style: TextStyle(
              color: ThemeColor.ytRed,
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
      );
    } else if (snapshot.child('role').value == 'admin') {
      return Shimmer.fromColors(
        direction: ShimmerDirection.ltr,
        baseColor: ThemeColor.primary,
        highlightColor: ThemeColor.lightBlue,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
              border: Border.all(color: ThemeColor.primary, width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: const Text(
            "Admin",
            style: TextStyle(
                color: ThemeColor.primary,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        ),
      );
    } else if (snapshot.child('status').value == 'verified') {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
            border: Border.all(color: ThemeColor.waGreen, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: const Text(
          "Verified",
          style: TextStyle(
              color: ThemeColor.waGreen,
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
            border: Border.all(color: ThemeColor.black, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: const Text(
          "Active",
          style: TextStyle(
              color: ThemeColor.black,
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
      );
    }
  }

  DatabaseService dbService = DatabaseService();
  String dropdownBatch = currentYr.toString();
  List<int> batch = [currentYr, currentYr - 1, currentYr - 2, currentYr - 3];
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
                    Text(
                      'Students',
                      style: GoogleFonts.ubuntu(
                        color: ThemeColor.black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        child: const Icon(
                          FontAwesomeIcons.solidEnvelope,
                          size: 35,
                          color: ThemeColor.black,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ViewQueryScreen()),
                        );
                      },
                    ),
                  ],
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
                    color: ThemeColor.secondary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                    child: DropdownButton(
                      underline: Container(
                        color: Colors.white,
                      ),
                      hint: Text(
                        "Selected batch: ${dropdownBatch}",
                        style: GoogleFonts.ubuntu(
                            color: ThemeColor.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      style: GoogleFonts.ubuntu(color: ThemeColor.white),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      dropdownColor: ThemeColor.scaffoldBgColor,
                      isExpanded: true,
                      icon: const Icon(
                        Icons.arrow_downward,
                        color: ThemeColor.white,
                      ),
                      items: batch.map<DropdownMenuItem<String>>((int value) {
                        return DropdownMenuItem<String>(
                          value: value.toString(),
                          child: Text(
                            "Batch: ${value.toString()}",
                            style: GoogleFonts.ubuntu(
                                color: ThemeColor.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownBatch = value!;
                        });
                      },
                    ),
                  ),
                ),
                sb.height10,
                FirebaseAnimatedList(
                  query: dbReference.child('users'),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  sort: (a, b) {
                    return a
                        .child('name')
                        .value
                        .toString()
                        .compareTo(b.child('name').value.toString());
                  },
                  defaultChild: const Center(
                    child: CircularProgressIndicator(
                      color: ThemeColor.primary,
                    ),
                  ),
                  itemBuilder: (context, snapshot, animation, index) {
                    if (snapshot.child('batch').value == dropdownBatch) {
                      return Column(
                        children: [
                          sb.height10,
                          GestureDetector(
                            onTap: () {
                              if (snapshot.key == userData.userid) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        behavior: SnackBarBehavior.floating,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15.0))),
                                        backgroundColor: ThemeColor.primary,
                                        content: Text(
                                          "You can't edit your own info",
                                          style: TextStyle(
                                              color: ThemeColor.white),
                                        )));
                              } else {
                                showDialog(
                                  context: context,
                                  builder: ((context) => AlertDialog(
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0))),
                                        contentPadding:
                                            const EdgeInsets.all(20.0),
                                        title: Center(
                                          child: Text(
                                            "Verify or Disable",
                                            style: GoogleFonts.ubuntu(
                                                color: ThemeColor.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        content: SizedBox(
                                          height: 130,
                                          width: double.infinity,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                "Selected user: ${snapshot.child('name').value.toString()}\n",
                                                style: GoogleFonts.ubuntu(
                                                    color: ThemeColor.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              alertBoxContents(snapshot),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          Center(
                                            child: TextButton(
                                              onPressed: () => Navigator.pop(
                                                  context, 'Cancel'),
                                              child: Text('Cancel',
                                                  style: GoogleFonts.ubuntu(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: ThemeColor.ytRed)),
                                            ),
                                          ),
                                        ],
                                      )),
                                );
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 10.0),
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                        color: ThemeColor.shadow,
                                        blurRadius: 10,
                                        spreadRadius: 0.1,
                                        offset: Offset(0, 10)),
                                  ],
                                  color: ThemeColor.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        child: SizedBox(
                                          height: 50,
                                          width: 50,
                                          child: CachedNetworkImage(
                                            imageUrl: snapshot
                                                .child('profile')
                                                .value
                                                .toString(),
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            placeholder: (context, url) =>
                                                const CircularProgressIndicator(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              child: const Image(
                                                height: 50,
                                                width: 50,
                                                image: AssetImage(
                                                    "assets/images/avatar.jpg"),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      sb.width10,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot
                                                .child('name')
                                                .value
                                                .toString(),
                                            style: GoogleFonts.ubuntu(
                                              color: ThemeColor.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            snapshot
                                                .child('email')
                                                .value
                                                .toString(),
                                            style: GoogleFonts.ubuntu(
                                              color: ThemeColor.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            snapshot
                                                .child('phone')
                                                .value
                                                .toString(),
                                            style: GoogleFonts.ubuntu(
                                              color: ThemeColor.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  userStatus(snapshot),
                                  // Container(
                                  //   width: 70,
                                  //   height: 35,
                                  //   decoration: BoxDecoration(
                                  //       color: ThemeColor.secondary,
                                  //       borderRadius:
                                  //           BorderRadius.circular(20)),
                                  //   child: const Icon(
                                  //     FontAwesomeIcons.check,
                                  //     color: ThemeColor.white,
                                  //   ),
                                  // )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
