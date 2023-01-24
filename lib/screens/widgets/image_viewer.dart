import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/globalvalues/theme_color.dart';

class ImageViewer extends StatelessWidget {
  const ImageViewer({super.key, required this.src, required this.imgName});
  final String imgName;
  final String src;
  @override
  Widget build(BuildContext context) {
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
                            imgName.length > 18
                                ? '${imgName.substring(0, 18)}...'
                                : imgName,
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
          child: SingleChildScrollView(
        child: Image.network(
          src,
          fit: BoxFit.fitWidth,
        ),
      )),
    );
  }
}
