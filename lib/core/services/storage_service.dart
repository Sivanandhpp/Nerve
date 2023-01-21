// ignore_for_file: avoid_print
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:nerve/core/globalvalues/globals.dart' as globals;

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<void> uploadFile(
    String filePath,
    String fileName,
    String revision,
    String semester,
    String content,
  ) async {
    File file = File(filePath);
    try {
      await storage
          .ref('docs/$revision/$semester/$content/$fileName')
          .putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      print(e);
    }
  }

  Future<firebase_storage.ListResult> listFiles(
    String semester,
    String content,
  ) async {
    String revision = globals.revision;
    firebase_storage.ListResult results =
        await storage.ref('docs/$revision/$semester/$content').listAll();
    // ignore: avoid_function_literals_in_foreach_calls
    results.items.forEach((firebase_storage.Reference ref) {
      print('Found file: $ref');
    });
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
    String revision = globals.revision;
    String pdfNamePursed = pdfName.replaceAll(RegExp('\\s+'), '%20');
    String semsterPursed = semester.replaceAll(RegExp('\\s+'), '%20');
    // ignore: unnecessary_brace_in_string_interps
    return "https://firebasestorage.googleapis.com/v0/b/studyapp-6c7e9.appspot.com/o/docs%2F${revision}%2F${semsterPursed}%2F${content}%2F${pdfNamePursed}?alt=media";
  }
}
