import '../../main.dart';
import '../globalvalues/globals.dart' as globals;

Future<bool> checkFirstSeen() async {
  bool seen = (spInstance.getBool('seen') ?? false);
  if (seen) {
    globals.revision = spInstance.getString('rev')!;
    return true;
  } else {
    return false;
  }
}

Future setRevisrion(String rev) async {
  globals.revision = rev;
  await spInstance.setString('rev', rev);
}

Future setFirstSeen() async {
  await spInstance.setBool('seen', true);
}
