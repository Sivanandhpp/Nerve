import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/globalvalues/sizedboxes.dart' as sb;
import '../../core/globalvalues/theme_color.dart';
import '../../main.dart';

class ScreenCalculator extends StatefulWidget {
  const ScreenCalculator({super.key});

  @override
  State<ScreenCalculator> createState() => _ScreenCalculatorState();
}

class _ScreenCalculatorState extends State<ScreenCalculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'GPA Calculator',
                    style: GoogleFonts.ubuntu(
                      color: ThemeColor.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          color: ThemeColor.lightGrey,
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.all(12),
                      child: const Icon(
                        Icons.verified_user,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () async {
                      await spInstance.setBool('seen', false);
                    },
                  ),
                ],
              ),
              sb.height20,
            ],
          ),
        ),
      ),
    );
  }
}
