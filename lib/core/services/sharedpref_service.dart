import '../../main.dart';

class SharedPreferencesService {
  Future<bool> getFirstSeen() async {
    bool seen = (spInstance.getBool('seen') ?? false);
    return seen;
  }

  Future setFirstSeen() async {
    await spInstance.setBool('seen', true);
  }

  setSharedprefUser(String uid, String name, String email, String phoneNo,
      String password, String batch, String revision, String role) async {
    await spInstance.setStringList(
        "user", [uid, name, email, phoneNo, password, batch, revision, role]);
  }

  Future<List<String>?> getSharedprefUser() async {
    List<String>? userList = spInstance.getStringList("user");
    userData.setUserData(userList![0], userList[1], userList[2], userList[3],
        userList[4], userList[5], userList[6], userList[7], false);
    return userList;
  }

  clearSharedprefUser() {
    spInstance.getStringList("user")!.clear();
  }
}
