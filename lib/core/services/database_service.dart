import 'package:nerve/core/globalvalues/user_data.dart';
import '../../main.dart';

class DatabaseService {
  Future<Post> getDatabaseUser(String uid) async {
    await dbReference.child('users/$uid').once().then(
          (value) => firebaseUser.snapshotToClass(uid, value.snapshot),
        );
    return firebaseUser;
  }

  setDatabaseUser(String uid, String name, String email, String phoneNo,
      String password, String batch, String revision, String role) {
    final userReferance = dbReference.child('users/$uid');

    userReferance.set({
      'name': name,
      'email': email,
      'phone': phoneNo,
      'password': password,
      'batch': batch,
      'revision': revision,
      'role': role
    });
  }
}
