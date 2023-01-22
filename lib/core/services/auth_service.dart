import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:nerve/core/services/error_handler.dart';
import '../../main.dart';
import '../globalvalues/globals.dart' as globals;
import 'package:nerve/core/globalvalues/user_model.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  ErrorHandler errHandler = ErrorHandler();
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
    BuildContext context,
  ) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _userFromFirebase(credential.user);
    } on auth.FirebaseAuthException catch (e) {
      errHandler.fromErrorCode(e, context);
    } catch (e) {
      errHandler.fromErrorCode(e, context);
    }
    return null;
  }

  Future<User?> createUserWithEmailAndPassword(
      String name,
      String phoneNo,
      String email,
      String password,
      String batch,
      String revision,
      BuildContext context) async {
    globals.userName = name;
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      credential.user!.linkWithPhoneNumber(phoneNo);
      credential.user!.updateDisplayName(name);
      firebaseUser.setUserData(credential.user!.uid, name, email, phoneNo,
          password, batch, 'user', revision, true);
      return _userFromFirebase(credential.user);
    } on auth.FirebaseAuthException catch (e) {
      errHandler.fromErrorCode(e, context);
    } catch (e) {
      errHandler.fromErrorCode(e, context);
    }
    return null;
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
