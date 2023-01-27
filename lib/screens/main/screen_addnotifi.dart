import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nerve/core/globalvalues/sizedboxes.dart' as sb;
import 'package:nerve/core/globalvalues/theme_color.dart';
import 'package:file_picker/file_picker.dart';
import 'package:nerve/core/services/database_service.dart';
import 'package:nerve/core/services/storage_service.dart';

String selectedFileName = "Select a file";
String selectedFilePath = "null";
String selectedFileExtension = "null";
bool isLoading = false;
String content = "Add content";
String title = "Add title";

class AddNotification extends StatefulWidget {
  const AddNotification({super.key});
  @override
  State<AddNotification> createState() => _AddNotificationState();
}

class _AddNotificationState extends State<AddNotification> {
  final TextEditingController _titleTextController = TextEditingController();
  final TextEditingController _contentTextController = TextEditingController();
  Storage storage = Storage();
  DatabaseService dbService = DatabaseService();
  Widget isLoadingWid() {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: ThemeColor.white),
      );
    } else {
      return Text(
        "Add Notification",
        style: GoogleFonts.ubuntu(fontSize: 15, color: ThemeColor.white),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.scaffoldBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                GestureDetector(
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
                        "Add Notification",
                        style: GoogleFonts.ubuntu(
                          color: ThemeColor.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                sb.height20,
                // BLUE CONTAINER START
                Container(
                  width: double.infinity,
                  height: 145,
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
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                selectedFileName,
                                style: GoogleFonts.ubuntu(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: ThemeColor.white),
                              ),
                              Text(
                                title,
                                style: GoogleFonts.ubuntu(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: ThemeColor.white),
                              ),
                              Text(
                                content,
                                style: GoogleFonts.ubuntu(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: ThemeColor.white),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () async {
                            final results = await FilePicker.platform.pickFiles(
                                allowCompression: true,
                                allowMultiple: false,
                                type: FileType.custom,
                                allowedExtensions: [
                                  'pdf',
                                  'jpg',
                                  'png',
                                  'jpeg'
                                ]);
                            if (results == null) {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15.0))),
                                      backgroundColor: ThemeColor.primary,
                                      content: Text(
                                        'No File Selected',
                                        style:
                                            TextStyle(color: ThemeColor.white),
                                      )));
                            }
                            setState(() {
                              selectedFileName = results!.files.single.name;
                              selectedFilePath = results.files.single.path!;
                              selectedFileExtension =
                                  ".${selectedFileName.split('.').last}";
                            });
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: ThemeColor.secondary),
                            child: const Center(
                              child: Icon(
                                Icons.attach_file,
                                size: 30,
                                color: ThemeColor.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // BLUE CONTAINER END
                sb.height20,
                // TEXT FIELD TITILE
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
                    color: ThemeColor.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 5),
                      child: TextField(
                        controller: _titleTextController,
                        onChanged: (value) {
                          title = value;
                        },
                        showCursor: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          alignLabelWithHint: true,
                          hintText: title,
                          hintStyle:
                              GoogleFonts.ubuntu(color: ThemeColor.black),
                        ),
                      )),
                ),
                sb.height10,
                // TEXT FIELD CONTENT
                Container(
                  width: double.infinity,
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
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 5),
                      child: TextField(
                        // expands: true,
                        maxLines: 5,
                        controller: _contentTextController,
                        onChanged: (value) {
                          content = value;
                        },
                        showCursor: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          alignLabelWithHint: true,
                          hintText: content,
                          hintStyle:
                              GoogleFonts.ubuntu(color: ThemeColor.black),
                        ),
                      )),
                ),

                sb.height20,
                GestureDetector(
                  onTap: () {
                    DateTime now = DateTime.now();
                    if (title == "Add title" || title.length < 3) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          backgroundColor: ThemeColor.primary,
                          content: Text(
                            "Add a title before submitting",
                            style: TextStyle(color: ThemeColor.white),
                          )));
                    } else if (content == "Add content" || content.length < 3) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          backgroundColor: ThemeColor.primary,
                          content: Text(
                            "Add a content before submitting",
                            style: TextStyle(color: ThemeColor.white),
                          )));
                    } else if (selectedFilePath == "null") {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          backgroundColor: ThemeColor.primary,
                          content: Text(
                            'No File Selected, Adding notification without image',
                            style: TextStyle(color: ThemeColor.white),
                          )));
                      dbService
                          .addNotification(
                              title, content, 'null', 'null', now, context)
                          .then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0))),
                                backgroundColor: ThemeColor.primary,
                                content: Text(
                                  'Notification added successfully',
                                  style: TextStyle(color: ThemeColor.white),
                                )));
                        setState(() {
                          isLoading = false;
                          content = "Add content";
                          title = "Add title";
                          selectedFileName = "No file Selected";
                          selectedFilePath = "null";
                        });
                        Navigator.pop(context);
                      });
                    } else {
                      setState(() {
                        isLoading = true;
                      });

                      String fileName =
                          "${now.year}${now.month}${now.day}${now.hour}${now.minute}${now.second}$selectedFileName";
                      storage
                          .uploadNotificationImg(
                              selectedFilePath, fileName, context)
                          .then(
                        (url) {
                          dbService
                              .addNotification(title, content, url,
                                  selectedFileExtension, now, context)
                              .then((value) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.0))),
                                    backgroundColor: ThemeColor.primary,
                                    content: Text(
                                      'Notification added successfully',
                                      style: TextStyle(color: ThemeColor.white),
                                    )));
                            setState(() {
                              isLoading = false;
                              content = "Add content";
                              title = "Add title";
                              selectedFileName = "No file Selected";
                              selectedFilePath = "null";
                            });
                            Navigator.pop(context);
                          });
                        },
                      );
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                        color: ThemeColor.primary,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: isLoadingWid(),
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
