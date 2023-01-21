import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nerve/core/globalvalues/sizedboxes.dart' as sb;
import 'package:nerve/screens/widgets/pdf_viewer.dart';
import '../../core/globalvalues/theme_color.dart';
import '../../core/services/storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class DisplayDoc extends StatelessWidget {
  const DisplayDoc({super.key, required this.semester, required this.content});
  final String semester;
  final String content;
  @override
  Widget build(BuildContext context) {
    Storage storage = Storage();
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
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
                        content,
                        style: GoogleFonts.ubuntu(
                          color: ThemeColor.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FutureBuilder(
                  future: storage.listFiles(semester, content),
                  builder: (BuildContext context,
                      AsyncSnapshot<firebase_storage.ListResult> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.items.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => PdfViewer(
                                                  src: storage.getURL(
                                                      snapshot.data!
                                                          .items[index].name,
                                                      semester,
                                                      content),
                                                  pdfName: snapshot
                                                      .data!.items[index].name,
                                                )),
                                      );
                                    },
                                    child: Container(
                                      height: 60,
                                      decoration: BoxDecoration(
                                          boxShadow: const [
                                            BoxShadow(
                                                color: ThemeColor.shadow,
                                                blurRadius: 100,
                                                spreadRadius: 1,
                                                offset: Offset(0, 10)),
                                          ],
                                          color: ThemeColor.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 2),
                                        child: ListTile(
                                          // trailing: Padding(
                                          //   padding:
                                          //       const EdgeInsets.only(right: 10),
                                          //   child: Text(
                                          //     "Yo",
                                          //     style: const TextStyle(
                                          //         fontSize: 17,
                                          //         color: ThemeColor.black,
                                          //         fontWeight: FontWeight.w600),
                                          //   ),
                                          // ),
                                          title: Text(
                                            snapshot.data!.items[index].name
                                                        .length >
                                                    40
                                                ? '${snapshot.data!.items[index].name.substring(0, 35)}...'
                                                : snapshot
                                                    .data!.items[index].name,
                                            style: GoogleFonts.ubuntu(
                                                fontSize: 17,
                                                color: ThemeColor.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );

                            // ElevatedButton(
                            //     onPressed: () {},
                            //     child:
                            //         Text(snapshot.data!.items[index].name));
                          });
                    }
                    if (snapshot.connectionState == ConnectionState.waiting ||
                        !snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Container();
                  }),
              sb.height10,
            ],
          ),
        ),
      ),
    );
  }
}
