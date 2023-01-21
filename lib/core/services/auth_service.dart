import 'package:firebase_auth/firebase_auth.dart' as auth;
import '../../main.dart';
import '../globalvalues/globals.dart' as globals;
import 'package:nerve/core/globalvalues/user_model.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  User? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(user.uid, user.displayName, user.email);
  }

  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _userFromFirebase(credential.user);
  }

  Future<User?> createUserWithEmailAndPassword(
    String name,
    String phoneNo,
    String email,
    String password,
  ) async {
    globals.userName = name;
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    credential.user!.linkWithPhoneNumber(phoneNo);
    credential.user!.updateDisplayName(name);
    String _userUID = credential.user!.uid;
    try {
      final userReferance = dbReference.child('users/$_userUID');
      userReferance.set(
        {
          'name': name,
          'email': email,
          'phone': phoneNo,
          'password': password,
          'revision': globals.revision,
          'role': 'user'
        },
      );
    } catch (e) {
      print(e);
    }

    return _userFromFirebase(credential.user);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

 
}
