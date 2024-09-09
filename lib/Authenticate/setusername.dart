import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newtenaga/data/remote_data_source/firestore_helper.dart';

// ignore: must_be_immutable
class setUsername extends StatelessWidget {
  setUsername({
    required this.user,
    super.key});

    User user;

    TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 244, 238, 183),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text('Set Your Username', style: GoogleFonts.poppins(
                      fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                       ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                      hintText: "Username",
                      filled: true,
                      fillColor: Color.fromARGB(43, 0, 0, 0)
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: InkWell(
                      onTap: ()async{
                        if(_usernameController.text == ""){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("all fields are required !"),backgroundColor: Colors.red,));
                        if (_usernameController.text.length > 8) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('username must be no longer than 7 letter!')));
                          print('kebanyakan');
                        }
                        }else {
                          await FirestoreHelper().insertUsername(_usernameController.text, user.uid);
                          Navigator.pop(context);
                        }
                      },
                      child: Container(
                          height: 50,
                          width: 150,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 233, 146, 16),
                            borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
                          child: const Center(
                            child: Text("Proceed", style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold,
                            ),),
                          ),
                        ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}