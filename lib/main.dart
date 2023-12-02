import 'package:elit/Authentication.dart';
import 'package:elit/screens/chat.dart';
import 'package:elit/screens/login_screen.dart';
import 'package:elit/screens/sign_up_screen.dart';
import 'package:elit/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat app',
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
          ),
      // home: const Splash(),
       routes: {
        '/':(context) => const Splash(),
        'Signup':(context) => const Signup(),
        'Login':(context) => const Login(),
        'Chat':(context) => const Chat(),

  },

    );
  }
}
