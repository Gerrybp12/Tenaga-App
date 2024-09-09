import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newtenaga/data/model/usermodel.dart';

// ignore: must_be_immutable
class Username extends StatelessWidget {

  Username({
    required this.user,
    this.usernameHeight,
    this.usernameSize,
    this.usernameColor,
    super.key});

  User user;
  double? usernameHeight;
  double? usernameSize;
  Color? usernameColor;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('users_username').where('userId', isEqualTo: user.uid).snapshots(),
      builder: (context,AsyncSnapshot snapshot) {
        if (snapshot.hasData){
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index){
              usernameModel username = usernameModel.fromJson(snapshot.data.docs[index]);
              return Text(username.username, style: GoogleFonts.poppins(
                fontSize: usernameSize?? 40, fontWeight: FontWeight.bold, color: usernameColor?? Colors.black, height: usernameHeight?? 0,
              ),);
            }
          );
        }else {
          return const Center(child: CircularProgressIndicator());
        }
      }
    );
  }
}