import 'package:flutter/material.dart';
import 'package:nerve/core/globalvalues/user_data.dart';
import 'package:nerve/core/services/auth_service.dart';
import 'package:nerve/core/globalvalues/userauth_model.dart';
import 'package:nerve/core/services/database_service.dart';
import 'package:nerve/core/services/sharedpref_service.dart';
import 'package:nerve/screens/main/screen_welcome.dart';
import 'package:nerve/screens/dashboards/user_dashboard.dart';
import 'package:nerve/screens/widgets/shimmer_home.dart';
import 'package:provider/provider.dart';
import '../../main.dart';
import '../../screens/dashboards/admin_dashboard.dart';
import '../../screens/widgets/splash_loading.dart';
import '../../screens/authentication/screen_login.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class RoutingService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SharedPreferencesService spService = SharedPreferencesService();
    DatabaseService dbService = DatabaseService();
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          // if (user?.username != null) {
          //   globals.userName = user!.username.toString();
          // }
          if (user != null) {
            userData.uidToClass(user.uid);

            return FutureBuilder<Post>(
              future: dbService.getDatabaseUser(user.uid),
              builder: (BuildContext context, AsyncSnapshot<Post> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.data!.role == "admin") {
                    //Admin Dashboard
                    return AdminDashBoard();
                  } else {
                    //User Dashboard
                    return UserDashBoard();
                  }
                }
                return const HomeShimmer();
                // return const LoadingScreen(
                //   loadingTitle: "Fetching user...",
                // );
              },
            );
          }
          if (user == null) {
            return FutureBuilder<bool?>(
              future: spService.getFirstSeen(),
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

  Future<String> isAdmin(String uid) async {
    await dbReference.child('users/$uid').once().then(
          (value) => userData.snapshotToClass(uid, value.snapshot),
        );
    // globals.revision = userData.revision;
    return userData.role;
  }

  // Future<String> getSPDB(String uid) async {
  //   SharedPreferencesService spService = SharedPreferencesService();
  //   if (await spService.getFirstSeen()) {
  //     if (spService.getSharedprefUseridx(0) == uid) {
  //       if (userData.role == "admin") {
  //         return "1";
  //       } else {
  //         return "2";
  //       }
  //     }
  //   } else {
  //     return "3";
  //   }
  //   return "4";
  // }
}
