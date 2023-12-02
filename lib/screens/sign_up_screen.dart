import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import 'chat.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  bool showSpinner = false;

  Future<void> SignUP() async {
    if (passwordConfirmed()) {
      setState(() {
        showSpinner = true;
      });
    final FirebaseAuth _auth = FirebaseAuth.instance;

      // await FirebaseAuth.instance.createUserWithEmailAndPassword(
     final newUser = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        // final String confirmPassword = _confirmPasswordController.text.trim();
      );
      // Récupérer les valeurs des nouveaux champs
      final String firstName = _firstNameController.text.trim();
      final String lastName = _lastNameController.text.trim();
      final String phoneNumber = _phoneNumberController.text.trim();
      final String email = _emailController.text.trim();

      // Utilisez les valeurs comme vous le souhaitez
      if (kDebugMode) {
        print('Prénom : $firstName');
      }
      if (kDebugMode) {
        print('Nom : $lastName');
      }
      if (kDebugMode) {
        print('Numéro de téléphone : $phoneNumber');
      }

      // Vous pouvez maintenant effectuer différentes actions avec les valeurs,
      // comme les enregistrer dans une base de données Firebase, par exemple :
      final user = _auth.currentUser;

      firestore.collection('users').doc().set({
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'status' : "Unavalible",
      });

      Navigator.of(context).pushNamed('/');
      // Navigator.of(context).pushNamed('Chat');

    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  void openSigninScreen() {
    Navigator.of(context).pushReplacementNamed('Login');
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: SafeArea(
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
                        "S'inscrire",
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      //Subtitle
                      const Text(
                        " Veuillez vous créer un compte.",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Poppins",
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      //prenom textfiled
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
                              controller: _firstNameController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.person),
                                hintText: 'Prénom',
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      //Nom textfiled
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
                              controller: _lastNameController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.person),
                                hintText: 'Nom',
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      //phone textfiled
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
                              controller: _phoneNumberController,
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.phone),
                                hintText: 'Numéro de téléphone',
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
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
                      const SizedBox(height: 10),
                      //Confirm Password Textfiled
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
                              controller: _confirmPasswordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.lock),
                                hintText: 'Confirm Mot de Pass',
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
                          onTap: SignUP,
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Colors.amber[900],
                                borderRadius: BorderRadius.circular(12)),
                            child: const Center(
                                child: Text('Sign up',
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
                          const Text('Déja membre?',
                              style: TextStyle(
                                // color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              )),
                          GestureDetector(
                            onTap: openSigninScreen,
                            child: const Text('Sign in',
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
