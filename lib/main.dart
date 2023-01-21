import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:nerve/core/services/auth_service.dart';
import 'package:nerve/core/services/routing_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/globalvalues/theme_color.dart';

late SharedPreferences spInstance;
late DatabaseReference dbReference;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  spInstance = await SharedPreferences.getInstance();
  dbReference = FirebaseDatabase.instance.ref();
  // await FirebaseAuth.instance.signInAnonymously();
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: ThemeColor.scaffoldBgColor,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: ThemeColor.scaffoldBgColor,
      statusBarIconBrightness: Brightness.dark));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Nerve',
          theme: ThemeData(
            scaffoldBackgroundColor: ThemeColor.scaffoldBgColor,
            primarySwatch: Colors.blue,
          ),
          home: RoutingService()),
    );
  }
}





// FutureBuilder<bool?>(
      //   future: checkFirstSeen(),
      //   builder: (BuildContext context, AsyncSnapshot<bool?> snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       if (snapshot.data == false) {
      //         return const IntroScreen();
      //       }
      //       return WrapperScreen();
      //     }
      //     return const Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   },
      // ),