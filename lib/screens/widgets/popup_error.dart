import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/globalvalues/theme_color.dart';

class ErrorPopup {
  popupError(String title, String err, BuildContext context) {
    return showDialog<String>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        contentPadding: const EdgeInsets.all(20.0),
        title: Text(
          title,
          style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold),
        ),
        content: Text(err),
        actions: <Widget>[
          Center(
            child: TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: Text('Got it!',
                  style: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.bold, color: ThemeColor.ytRed)),
            ),
          ),
        ],
      ),
    );
  }
}
