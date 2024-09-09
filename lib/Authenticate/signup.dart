// ignore_for_file: unused_import, prefer_final_fields

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newtenaga/Authenticate/setusername.dart';
import 'package:newtenaga/Authenticate/signin.dart';
import 'package:newtenaga/MainScreen.dart';
import 'package:newtenaga/data/model/usermodel.dart';
import 'package:newtenaga/data/remote_data_source/firestore_helper.dart';
import 'package:newtenaga/wrapper.dart';

import 'auth_service.dart';

class SignUp extends StatefulWidget {
  SignUp({
    super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repeatPasswordController = TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
          children: [
            Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, iconTheme: IconThemeData(color: const Color.fromARGB(255, 92, 56, 2)),),
              backgroundColor: Color.fromARGB(255, 244, 238, 183),
              body: Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                        child: const Text('already have an account? Sign In',
                        style: TextStyle(color: Color.fromARGB(97, 0, 0, 0)),)
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                          obscureText: true,
                          controller: _repeatPasswordController,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            hintText: "Repeat Password",
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
                        }else if(_passwordController.text != _repeatPasswordController.text){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("password not match !"),backgroundColor: Colors.red,));

                        }  else {
                          User? result = await AuthService().register(_emailController.text, _passwordController.text, context);
                          if(result != null){
                            print("succes");
                            print(result.uid);
                            Navigator.pop(context);
                          }
                        }
                        setState(() {
                          loading = false;
                        });





                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 233, 146, 16),
                          borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        child: const Center(
                          child: Text("Sign In", style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold,
                          ),),
                        ),
                      ),)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
  }
}
