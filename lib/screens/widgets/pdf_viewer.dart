import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/globalvalues/theme_color.dart';

class PdfViewer extends StatelessWidget {
  const PdfViewer({super.key, required this.src, required this.pdfName});
  final String pdfName;
  final String src;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: ThemeColor.scaffoldBgColor,
        statusBarIconBrightness: Brightness.dark));
    if (src.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ThemeColor.scaffoldBgColor,
          title: const Text(
            "PDF Viewer",
            style: TextStyle(
              fontSize: 20,
              color: ThemeColor.white,
            ),
          ),
        ),
        backgroundColor: ThemeColor.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/notfound.gif',
                fit: BoxFit.cover,
              ),
              const Text(
                'Sorry! No PDF found :(',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 70,
              )
            ],
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: ThemeColor.scaffoldBgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70), // Set this height
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            pdfName.length > 18
                                ? '${pdfName.substring(0, 18)}...'
                                : pdfName,
                            style: GoogleFonts.ubuntu(
                              color: ThemeColor.black,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          launchUrl(
                              mode: LaunchMode.externalApplication,
                              Uri.parse(src));
                        },
                        child: const Icon(
                          size: 28,
                          Icons.download_rounded,
                          color: ThemeColor.black,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SfPdfViewer.network(
          src,
        ),
      ),
    );
  }
}
