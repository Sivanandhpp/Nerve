import 'package:flutter/material.dart';
import 'package:nerve/core/globalvalues/theme_color.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/globalvalues/sizedboxes.dart' as sb;

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key, required this.loadingTitle}) : super(key: key);
  final String loadingTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Shimmer.fromColors(
                    baseColor: ThemeColor.purpleBG,
                    highlightColor: ThemeColor.white,
                    child: Text(
                      loadingTitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        // color: ThemeColor.purpleBG,
                        fontWeight: FontWeight.bold,
                        fontSize: 28.0,
                      ),
                    ),
                  ),
                  // Text(
                  //   loadingTitle,
                  //   textAlign: TextAlign.center,
                  //   style: const TextStyle(
                  //     color: ThemeColor.purpleBG,
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 28.0,
                  //   ),
                  // ),
                  sb.width10,
                  const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        ThemeColor.purpleBG,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
