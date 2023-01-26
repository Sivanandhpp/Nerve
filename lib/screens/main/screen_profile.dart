import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nerve/core/services/auth_service.dart';
import 'package:nerve/core/services/routing_service.dart';
import 'package:nerve/core/services/storage_service.dart';
import 'package:nerve/main.dart';
import 'package:nerve/screens/main/screen_about.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/globalvalues/sizedboxes.dart' as sb;
import '../../core/globalvalues/theme_color.dart';

class ScreenProfile extends StatefulWidget {
  const ScreenProfile({super.key});

  @override
  State<ScreenProfile> createState() => _ScreenProfileState();
}

class _ScreenProfileState extends State<ScreenProfile> {
  bool isLoading = false;
  bool updatedProfile = false;
  String profileUrl = 'null';
  String selectedFileName = '';
  String selectedFilePath = '';
  Storage storage = Storage();
  Widget getAvatar() {
    if (isLoading) {
      return const CircleAvatar(
        radius: 70,
        backgroundColor: Colors.white,
        child: ClipOval(
            child: CircularProgressIndicator(
          color: ThemeColor.primary,
        )),
      );
    }

    return CircleAvatar(
      radius: 75,
      backgroundColor: ThemeColor.white,
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: userData.profile,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const CircleAvatar(
            radius: 70,
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Image(
                image: AssetImage('assets/images/avatar.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
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
                    GestureDetector(
                      onTap: () {
                        if (updatedProfile) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RoutingService(),
                              ));
                        } else {
                          Navigator.pop(context);
                        }
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
                        ],
                      ),
                    ),
                    userData.role == 'admin'
                        ? Shimmer.fromColors(
                            direction: ShimmerDirection.ltr,
                            baseColor: ThemeColor.primary,
                            highlightColor: ThemeColor.instaPurpleRed,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ThemeColor.primary, width: 2),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20))),
                              child: const Text(
                                "Admin",
                                style: TextStyle(
                                    color: ThemeColor.primary,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: ThemeColor.black, width: 2),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                            child: const Text(
                              "User/Student",
                              style: TextStyle(
                                  color: ThemeColor.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                  ],
                ),
                sb.height20,
                GestureDetector(
                  onTap: () async {
                    final results = await FilePicker.platform.pickFiles(
                      allowCompression: true,
                      allowMultiple: false,
                      type: FileType.image,
                    );
                    if (results == null) {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('No Image Selected')));
                    } else {
                      setState(() {
                        isLoading = true;
                        selectedFileName = results.files.single.name;
                        selectedFilePath = results.files.single.path!;
                        String fileName =
                            "${userData.userid}_${userData.name}_$selectedFileName";
                        storage
                            .uploadProfileImg(
                                selectedFilePath, fileName, context)
                            .then((value) {
                          setState(() {
                            isLoading = false;
                            updatedProfile = true;
                          });
                        });
                      });
                    }
                  },
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      isLoading
                          ? const CircleAvatar(
                              radius: 70,
                              backgroundColor: Colors.white,
                              child: ClipOval(
                                  child: CircularProgressIndicator(
                                color: ThemeColor.primary,
                              )),
                            )
                          : CircleAvatar(
                              radius: 75,
                              backgroundColor: ThemeColor.white,
                              child: ClipOval(
                                child: CachedNetworkImage(
                                  imageUrl: userData.profile,
                                  imageBuilder: (context, imageProvider) =>
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
                                  errorWidget: (context, url, error) =>
                                      const CircleAvatar(
                                    radius: 70,
                                    backgroundColor: Colors.white,
                                    child: ClipOval(
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/avatar.jpg'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: ThemeColor.primary,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Icon(
                          FontAwesomeIcons.camera,
                          size: 20,
                          color: ThemeColor.white,
                        ),
                      )
                    ],
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
                sb.height50,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: GestureDetector(
                    onTap: () async {
                      await authService.signOut();
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
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
                sb.height10,
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
                sb.height80,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
