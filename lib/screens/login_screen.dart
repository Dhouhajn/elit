import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:elit/screens/chat.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool showSpinner = false;

  Future<void> login() async {
    setState(() {
      showSpinner = true;
    });
    try {
      final String email = _emailController.text.trim();
      final String password = _passwordController.text.trim();

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        if (kDebugMode) {
          print("Login successful");
        }
        // Passer à la page Chat
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Chat()),
        );
      } else {
        if (kDebugMode) {
          print("Login failed");
        }
        // Afficher un message d'erreur ou effectuer une action appropriée
      }
      // Après la connexion réussie ou échouée, arrêtez l'affichage du spinner
      setState(() {
        showSpinner = false;
      });
    } catch (e) {
      // Gérer les erreurs de connexion ici
      if (kDebugMode) {
        print(e.toString());
      }
      // Afficher un message d'erreur ou effectuer une action appropriée
      // Arrêtez l'affichage du spinner en cas d'erreur
      setState(() {
        showSpinner = false;
      });
    }
  }

  void openSignUpScreen() {
    Navigator.of(context).pushReplacementNamed('Signup');
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: ModalProgressHUD(
            inAsyncCall: showSpinner,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Image
                      Image.asset(
                        'assets/icons/images.png',
                        height: 250,
                      ),
                      const SizedBox(height: 20),
                      //Title
                      const Text(
                        "Se connecter",
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      //Subtitle
                      const Text(
                        "Bienvenue! Veuillez vous identifier.",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Poppins",
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      //Email Textfiled
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.person),
                                hintText: 'Email',
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      //Password Textfiled
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.lock),
                                hintText: 'Mot de Pass',
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      //Sign in button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: GestureDetector(
                          onTap: login,
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Colors.amber[900]?.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(12)),
                            child: const Center(
                                child: Text('Sign in',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ))),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      //Text: Sign up
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Pas encore membre?',
                              style: TextStyle(
                                // color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              )),
                          GestureDetector(
                            onTap: openSignUpScreen,
                            child: const Text('Sign up now',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                )),
                          ),
                        ],
                      )
                    ]),
              ),
            ),
          ),
        ));
  }
}
