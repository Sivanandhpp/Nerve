import 'package:flutter/material.dart';
import 'package:nerve/core/services/auth_service.dart';
import 'package:nerve/core/globalvalues/user_model.dart';
import 'package:nerve/screens/main/screen_welcome.dart';
import 'package:nerve/screens/dashboards/user_dashboard.dart';
import 'package:provider/provider.dart';
import '../../main.dart';
import '../../screens/dashboards/admin_dashboard.dart';
import '../../screens/widgets/splash_loading.dart';
import '../../screens/authentication/screen_login.dart';
import '../globalvalues/globals.dart' as globals;

// ignore: must_be_immutable, use_key_in_widget_constructors
class RoutingService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          if (user?.username != null) {
            globals.userName = user!.username.toString();
          }
          if (user != null) {
            globals.userID = user.uid;
            return FutureBuilder<String?>(
              future: isAdmin(globals.userID),
              builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.data == "admin") {
                    //Admin Dashboard
                    return AdminDashBoard();
                  } else {
                    //User Dashboard
                    return UserDashBoard();
                  }
                }
                return const LoadingScreen(
                  loadingTitle: "Fetching user...",
                );
              },
            );
          }
          if (user == null) {
            return FutureBuilder<bool?>(
              future: checkFirstSeen(),
              builder: (BuildContext context, AsyncSnapshot<bool?> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.data == false) {
                    return const IntroScreen();
                  } else {
                    return const LoginPage();
                  }
                }
                return const LoadingScreen(
                  loadingTitle: "Redirecting...",
                );
              },
            );
          }
        }
        return const LoadingScreen(
          loadingTitle: "Initializing...",
        );
      },
    );
  }

  Future<bool> checkFirstSeen() async {
    bool seen = (spInstance.getBool('seen') ?? false);
    return seen;
  }

  Future<String> isAdmin(String uid) async {
    await dbReference.child('users/$uid').once().then(
          (value) => firebaseUser.snapshotToClass(value.snapshot),
        );
    globals.revision = firebaseUser.revision;

    // final revisionDB = await dbReference.child('users/$uid/revision').get();
    // setRevisrion(firebaseUser.revision);
    // final roleDB = await dbReference.child('users/$uid/role').get();
    // globals.role = roleDB.value.toString();
    // return roleDB.value.toString();
    return firebaseUser.role;
  }
}


// await spInstance.setBool('seen', true);