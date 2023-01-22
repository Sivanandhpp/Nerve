import 'package:nerve/core/services/sharedpref_service.dart';
import '../../main.dart';

class Post {
  late String name, email, phoneNo, password, batch, revision, role, userid;

  // Post(
  //     {required this.name,
  //     required this.email,
  //     required this.phoneNo,
  //     required this.password,
  //     required this.batch,
  //     required this.revision,
  //     required this.role});

  uidToClass(uid) {
    userid = uid;
  }

  snapshotToClass(snapshot) {
    name = snapshot.child('name').value;
    email = snapshot.child('email').value;
    phoneNo = snapshot.child('phone').value;
    password = snapshot.child('password').value;
    batch = snapshot.child('batch').value;
    revision = snapshot.child('revision').value;
    role = snapshot.child('role').value;
  }

  setUserData(
      String uid,
      String setname,
      String setemail,
      String setphoneNo,
      String setpassword,
      String setbatch,
      String setrevision,
      String role,
      bool setData) {
    userid = uid;
    name = setname;
    email = setemail;
    phoneNo = setphoneNo;
    password = setpassword;
    batch = setbatch;
    revision = setrevision;
    role = role;

    if (setData) {
      //SET DATA TO REALTIME DATABASE WHILE SIGN UP
      final userReferance = dbReference.child('users/$uid');
      userReferance.set({
        'name': setname,
        'email': setemail,
        'phone': setphoneNo,
        'password': setpassword,
        'batch': setbatch,
        'revision': setrevision,
        'role': 'user'
      });

      //SET DATA TO SHARED PREFERANCES WHILE SIGN UP
      setSharedprefUser(uid, setname, setemail, setphoneNo, setpassword,
          setbatch, setrevision, "user");
    }
  }
}
