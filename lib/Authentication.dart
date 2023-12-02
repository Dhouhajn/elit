import 'package:elit/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:elit/screens/chat.dart';
// import 'login_dialog.dart';

class Authentication extends StatelessWidget {
  const Authentication({super.key});
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
    stream: FirebaseAuth.instance.authStateChanges(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {return Center(child: CircularProgressIndicator(color: Color.fromARGB(255, 39, 7, 223),));} 
      // else if (snapshot.hasError) {return Login(context, "Something went wrong");}
      else if (snapshot.hasData) {return Chat();}
      else { return Login();}
    },
 ),
      // StreamBuilder<User?>(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       // Utilisateur connecté, passer à la page Chat
      //       return const Chat();
      //     } else {
      //        // Utilisateur non connecté, rester sur la page de connexion
      //       return const Login();
      //     }
      //   },
      // ),
    );
    // return StreamBuilder<User?>(
    //   stream: FirebaseAuth.instance.authStateChanges(),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       // Attendre la vérification de l'état d'authentification
    //       return const Scaffold(
    //         body: Center(child: CircularProgressIndicator()),
    //       );
    //     } else if (snapshot.hasData && snapshot.data != null) {
    //       // Utilisateur connecté, passer à la page Chat
    //       return const Chat();
    //     } else {
    //       // Utilisateur non connecté, afficher la page de connexion
    //       return const Login();
    //     }
    //   },
    // );
  }
}
