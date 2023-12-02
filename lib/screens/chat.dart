import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'chat_screen.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
 
 
 final TextEditingController _searchController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void signOutUser() async {
    // await FirebaseAuth.instance.signOut();
    await _auth.signOut();
    Navigator.pushReplacementNamed(context, 'Login');
  }

  @override
  void dispose() {
    
    _searchController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  // void sendMessage() {
  //   String message = _messageController.text.trim();

  //   if (message.isNotEmpty) {
  //     // Logic to send the message
  //     // You can use your preferred method here, such as sending an HTTP request or updating a database

  //     // Clear the text field after sending the message
  //     _messageController.clear();
  //   }
  // }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 53, 58, 219),
      title: Row(
        children: [
          Image.asset('assets/icons/images.png', height: 40),
          const SizedBox(width: 10),
          const Text('Message')
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            signOutUser();
            // Effectuez d'autres actions après la déconnexion, comme la navigation vers une autre page
          },
          icon: const Icon(Icons.logout_outlined),
        ),
      ],
    ),
    body: Column(
      children: [
       
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                                hintText: "recherche",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                               
                              ),
                        onChanged: (val) {
                          setState(() {
                          
                          });
                        },
                      ),
                    ),
                     ElevatedButton(
                    onPressed: (){  // Logique de recherche basée sur la valeur du texte de recherche
                    final String searchValue = _searchController.text.trim();
                    // Effectuer les actions de recherche
                    
                  },
                    child:  const Icon(Icons.search_outlined),
                  ),
                  ],
                ),
              ),
          
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const CircleAvatar(),
                      title: const Text('Tibaoui oumaima'),
                      subtitle: const Text('Hello!'),
                      trailing: const Text('10:30 AM'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatScreen(),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
          
          
        
      ],
    ),
  );
}

}
