import 'package:flutter/cupertino.dart';
import 'package:nerve/core/services/database_service.dart';
import 'package:nerve/core/services/sharedpref_service.dart';

class UserData {
  late String name,
      email,
      phoneNo,
      password,
      batch,
      revision,
      role,
      userid,
      profile,
      status;
  SharedPreferencesService spService = SharedPreferencesService();
  DatabaseService dbService = DatabaseService();

  updateRevision(String updatedRevision, BuildContext context) {
    revision = updatedRevision;
    dbService.updateDatabaseUser("revision", updatedRevision, userid, context);
  }

  snapshotToClass(uid, snapshot) {
    name = snapshot.child('name').value;
    email = snapshot.child('email').value;
    phoneNo = snapshot.child('phone').value;
    password = snapshot.child('password').value;
    batch = snapshot.child('batch').value;
    revision = snapshot.child('revision').value;
    role = snapshot.child('role').value;
    profile = snapshot.child('profile').value;
    status = snapshot.child('status').value;
    // spService.setSharedprefUser(
    //     uid, name, email, phoneNo, password, batch, revision, role);
  }

  setUserData(
      String uid,
      String setname,
      String setemail,
      String setphoneNo,
      String setpassword,
      String setbatch,
      String setrevision,
      String setrole,
      bool setData) {
    userid = uid;
    name = setname;
    email = setemail;
    phoneNo = setphoneNo;
    password = setpassword;
    batch = setbatch;
    revision = setrevision;
    role = setrole;

    if (setData) {
      //SET DATA TO SHARED PREFERANCES WHILE SIGN UP
      // spService.setSharedprefUser(uid, setname, setemail, setphoneNo,
      //     setpassword, setbatch, setrevision, setrole);

      //SET DATA TO REALTIME DATABASE WHILE SIGN UP
      dbService.setDatabaseUser(uid, setname, setemail, setphoneNo, setpassword,
          setbatch, setrevision, setrole);
    }
  }
}
