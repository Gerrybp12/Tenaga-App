// ignore_for_file: unused_import, prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newtenaga/Authenticate/auth_service.dart';
import 'package:newtenaga/Authenticate/setusername.dart';
import 'package:newtenaga/Authenticate/signup.dart';
import 'package:newtenaga/Homepage/home.dart';
import 'package:newtenaga/MainScreen.dart';
import 'package:newtenaga/data/remote_data_source/firestore_helper.dart';
import 'package:sign_in_button/sign_in_button.dart';

class SignIn extends StatefulWidget {
  SignIn({
    super.key});


  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
          children: [
            Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: Color.fromARGB(255, 244, 238, 183),
              body: Container(
                padding: const EdgeInsets.all(30),
                child: ListView(
                  children: [
                    SizedBox(height: 50,),
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/logo.png'), fit: BoxFit.cover)
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: (){
                              Navigator.push(context,
                              MaterialPageRoute(builder: (context) => SignUp())
                        );
                            },
                          child: Text('dont have account? Sign Up',
                          style: TextStyle(color: const Color.fromARGB(97, 0, 0, 0)),)
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              hintText: "Email",
                              filled: true,
                              fillColor: Color.fromARGB(43, 0, 0, 0)
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                            obscureText: true,
                            controller: _passwordController,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              hintText: "Password",
                              filled: true,
                              fillColor: Color.fromARGB(43, 0, 0, 0)
                              ),
                            ),
                          ),
                          loading? CircularProgressIndicator(color: Colors.orange,): InkWell(
                        onTap: ()async{
                          setState(() {
                            loading = true;
                          });
                          if(_emailController.text == "" || _passwordController.text == ""){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("all fields are required !"),backgroundColor: Colors.red,));
                          }else {
                            User? result = await AuthService().login(_emailController.text, _passwordController.text, context);
                            if(result != null){
                              print("success");
                              print(result.uid);
                              try {

                              } catch (e) {
                                print('some erro $e');
                              }


                            }
                          }
                          setState(() {
                            loading = false;
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 220,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 233, 146, 16),
                            borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
                          child: const Center(
                            child: Text("Sign In", style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold,
                            ),),
                          ),
                        ),),
                        SizedBox(height: 10,),
                        loading? CircularProgressIndicator(color: Colors.orange,): SignInButton(Buttons.google,text: "contuine with google",
                        onPressed: ()async{
                          setState(() {
                            loading = true;
                          });
                          User? result = await AuthService().signInWithGoogle();
                          if (result != null) {
                            print("success google");
                          }

                          setState(() {
                            loading = false;
                          });
                        }
                        )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
  }
}

