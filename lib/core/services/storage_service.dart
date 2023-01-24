import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:flutter/cupertino.dart';
import 'package:nerve/main.dart';

import 'error_handler.dart';

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  ErrorHandler errHandler = ErrorHandler();

  Future<void> uploadFile(String filePath, String fileName, String revision,
      String semester, String content, BuildContext context) async {
    File file = File(filePath);
    try {
      await storage
          .ref('docs/$revision/$semester/$content/$fileName')
          .putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      errHandler.fromErrorCode(e, context);
    }
  }

  Future<firebase_storage.ListResult> listFiles(
    String semester,
    String content,
  ) async {
    String revision = userData.revision;
    firebase_storage.ListResult results =
        await storage.ref('docs/$revision/$semester/$content').listAll();
    return results;
  }

  // Future<String> downloadURL(
  //   String pdfName,
  //   String semester,
  //   String content,
  // ) async {
  //   String revision = globals.revision;
  //   String downloadURL = await storage
  //       .ref('docs/$revision/$semester/$content/$pdfName')
  //       .getDownloadURL();
  //   print(pdfName);
  //   return downloadURL;
  // }

  getURL(
    String pdfName,
    String semester,
    String content,
  ) {
    String revision = userData.revision;
    String pdfNamePursed = pdfName.replaceAll(RegExp('\\s+'), '%20');
    String semsterPursed = semester.replaceAll(RegExp('\\s+'), '%20');
    // ignore: unnecessary_brace_in_string_interps
    return "https://firebasestorage.googleapis.com/v0/b/studyapp-6c7e9.appspot.com/o/docs%2F${revision}%2F${semsterPursed}%2F${content}%2F${pdfNamePursed}?alt=media";
  }



  // TO HANDLE NOTIFICATION IMG
  Future<String> uploadNotificationImg(
      String filePath, String fileName, BuildContext context) async {
    File file = File(filePath);
     String fileNamePursed = fileName.replaceAll(RegExp('\\s+'), 'x');
    try {
      await storage.ref('notifications/$fileNamePursed').putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      errHandler.fromErrorCode(e, context);
    }
    return "https://firebasestorage.googleapis.com/v0/b/studyapp-6c7e9.appspot.com/o/notifications%2F${fileNamePursed}?alt=media";
  }

  

}
