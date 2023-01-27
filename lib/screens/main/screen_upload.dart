import 'package:google_fonts/google_fonts.dart';
import 'package:nerve/core/globalvalues/sizedboxes.dart' as sb;
import 'package:nerve/core/globalvalues/theme_color.dart';
import 'package:nerve/core/services/storage_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

final List<String> contents = [
  'Syllabus',
  'Lab Manual',
  'Notes',
  'Question Paper',
];
final List<String> semester = [
  'Sem I',
  'Sem II',
  'Sem III',
  'Sem IV',
  'Sem V',
  'Sem VI',
];
final List<String> revision = [
  '2015',
  '2021',
];

String dropdownSemester = "Select semester";
String dropdownContent = "Select document Type";
String dropdownRevision = "Select revision";
String selectedFileName = "No file Selected";
String selectedFilePath = "null";
bool isLoading = false;
TextEditingController _fileNameTextController = TextEditingController();

class ScreenUpload extends StatefulWidget {
  const ScreenUpload({super.key});
  @override
  State<ScreenUpload> createState() => _ScreenUploadState();
}

class _ScreenUploadState extends State<ScreenUpload> {
  Widget isLoadingWid() {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: ThemeColor.white),
      );
    } else {
      return Text(
        "Upload",
        style: GoogleFonts.ubuntu(fontSize: 15, color: ThemeColor.white),
      );
    }
  }

  final Storage storage = Storage();
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Upload',
                      style: GoogleFonts.ubuntu(
                        color: ThemeColor.black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // InkWell(
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //         color: ThemeColor.lightGrey,
                    //         borderRadius: BorderRadius.circular(12)),
                    //     padding: const EdgeInsets.all(12),
                    //     child: const Icon(
                    //       Icons.verified_user,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    //   onTap: () async {
                    //     await spInstance.setBool('seen', false);
                    //   },
                    // )
                  ],
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
                                dropdownContent,
                                style: GoogleFonts.ubuntu(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: ThemeColor.white),
                              ),
                              Text(
                                dropdownSemester,
                                style: GoogleFonts.ubuntu(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: ThemeColor.white),
                              ),
                              Text(
                                dropdownRevision,
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
                                allowMultiple: false,
                                type: FileType.custom,
                                allowedExtensions: ['pdf']);
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
                // TEXT FIELD FILE NAME
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
                        controller: _fileNameTextController,
                        onChanged: (value) {
                          selectedFileName = value;
                        },
                        showCursor: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          alignLabelWithHint: true,
                          hintText: selectedFileName,
                          hintStyle:
                              GoogleFonts.ubuntu(color: ThemeColor.black),
                        ),
                      )),
                ),
                sb.height10,
                // DROP DOWN REVISION
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
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                    child: DropdownButton(
                      underline: Container(
                        height: 0,
                        color: Colors.white,
                      ),
                      hint: Text(
                        dropdownRevision,
                        style: GoogleFonts.ubuntu(color: ThemeColor.black),
                      ),
                      style: const TextStyle(color: ThemeColor.black),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      dropdownColor: ThemeColor.scaffoldBgColor,
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_downward),
                      items: revision
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: GoogleFonts.ubuntu(color: ThemeColor.black),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownRevision = value!;
                        });
                      },
                    ),
                  ),
                ),
                sb.height10,
                // DROP DOWN SEMESTER
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
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                    child: DropdownButton(
                      underline: Container(
                        height: 0,
                        color: Colors.white,
                      ),
                      hint: Text(
                        dropdownSemester,
                        style: GoogleFonts.ubuntu(color: ThemeColor.black),
                      ),
                      style: GoogleFonts.ubuntu(color: ThemeColor.black),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      dropdownColor: ThemeColor.scaffoldBgColor,
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_downward),
                      items: semester
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: GoogleFonts.ubuntu(color: ThemeColor.black),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownSemester = value!;
                        });
                      },
                    ),
                  ),
                ),
                sb.height10,
                // DROP DOWN DOC TYPE
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
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                    child: DropdownButton(
                      underline: Container(
                        height: 0,
                        color: Colors.white,
                      ),
                      hint: Text(
                        dropdownContent,
                        style: GoogleFonts.ubuntu(color: ThemeColor.black),
                      ),
                      style: GoogleFonts.ubuntu(color: ThemeColor.black),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      dropdownColor: ThemeColor.scaffoldBgColor,
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_downward),
                      items: contents
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: GoogleFonts.ubuntu(color: ThemeColor.black),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownContent = value!;
                        });
                      },
                    ),
                  ),
                ),
                sb.height20,
                GestureDetector(
                  onTap: () {
                    if (selectedFilePath == "null") {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          backgroundColor: ThemeColor.primary,
                          content: Text(
                            'No File Selected',
                            style: TextStyle(color: ThemeColor.white),
                          )));
                    } else if (selectedFileName.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          backgroundColor: ThemeColor.primary,
                          content: Text(
                            "Add a name to file",
                            style: TextStyle(color: ThemeColor.white),
                          )));
                    } else if (dropdownRevision == "Select revision") {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          backgroundColor: ThemeColor.primary,
                          content: Text(
                            "Select revision",
                            style: TextStyle(color: ThemeColor.white),
                          )));
                    } else if (dropdownSemester == "Select semester") {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          backgroundColor: ThemeColor.primary,
                          content: Text(
                            "Select semester",
                            style: TextStyle(color: ThemeColor.white),
                          )));
                    } else if (dropdownContent == "Select document Type") {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          backgroundColor: ThemeColor.primary,
                          content: Text(
                            "Select document Type",
                            style: TextStyle(color: ThemeColor.white),
                          )));
                    } else {
                      setState(() {
                        isLoading = true;
                      });
                      storage
                          .uploadFile(
                              selectedFilePath,
                              selectedFileName,
                              dropdownRevision,
                              dropdownSemester,
                              dropdownContent,
                              context)
                          .then(((value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          backgroundColor: ThemeColor.primary,
                                content: Text('File uploaded successfully',
                            style: TextStyle(color: ThemeColor.white),)));
                        setState(() {
                          isLoading = false;
                          dropdownSemester = "Select semester";
                          dropdownContent = "Select document Type";
                          dropdownRevision = "Select revision";
                          selectedFileName = "No file Selected";
                          selectedFilePath = "null";
                        });
                      }));
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
                      // Text(
                      //   "Upload",
                      //   style: TextStyle(fontSize: 15, color: ThemeColor.white),
                      // ),
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
