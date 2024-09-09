import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/remote_data_source/firestore_helper.dart';

// ignore: must_be_immutable
class FootBallQuostion extends StatefulWidget {
  FootBallQuostion({
    required this.user,
    super.key});

  User user;

  @override
  State<FootBallQuostion> createState() => _FootBallQuostionState();
}

  bool footBallHobbySelected = false;
  bool footBallCompetitiveSelected = false;
  bool footBallBeginnerSelected = false;
  bool footBallIntermediateSelected = false;
  bool footBallAdvancedSelected = false;
  bool saved = false;

class _FootBallQuostionState extends State<FootBallQuostion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 500,
      color: Colors.transparent,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Purpose :',
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        footBallHobbySelected = true;
                        footBallCompetitiveSelected = false;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 180,
                      color: footBallHobbySelected? const Color.fromARGB(255, 42, 114, 202):Color.fromARGB(65, 158, 158, 158),
                      child: Center(
                        child: Text('Hobby', style: GoogleFonts.poppins(
                          fontSize: 20, color: footBallHobbySelected? Colors.white:Color.fromARGB(48, 0, 0, 0), fontWeight: FontWeight.w500
                        ),),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        footBallHobbySelected = false;
                        footBallCompetitiveSelected = true;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 180,
                      color: footBallCompetitiveSelected? const Color.fromARGB(255, 42, 114, 202):Color.fromARGB(65, 158, 158, 158),
                      child: Center(
                        child: Text('Competitive', style: GoogleFonts.poppins(
                          fontSize: 20, color: footBallCompetitiveSelected? Colors.white:Color.fromARGB(48, 0, 0, 0), fontWeight: FontWeight.w500
                        ),),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Level :',
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        footBallBeginnerSelected = true;
                      footBallIntermediateSelected = false;
                      footBallAdvancedSelected = false;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      color: footBallBeginnerSelected? const Color.fromARGB(255, 42, 114, 202):Color.fromARGB(65, 158, 158, 158),
                      child: Center(
                        child: Text('Beginner', style: GoogleFonts.poppins(
                          fontSize: 15, color: footBallBeginnerSelected? Colors.white:Color.fromARGB(48, 0, 0, 0), fontWeight: FontWeight.w500
                        ),),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        footBallBeginnerSelected = false;
                      footBallIntermediateSelected = true;
                      footBallAdvancedSelected = false;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      color: footBallIntermediateSelected? const Color.fromARGB(255, 42, 114, 202):Color.fromARGB(65, 158, 158, 158),
                      child: Center(
                        child: Text('Intermediate', style: GoogleFonts.poppins(
                          fontSize: 15, color: footBallIntermediateSelected? Colors.white:Color.fromARGB(48, 0, 0, 0), fontWeight: FontWeight.w500
                        ),),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        footBallBeginnerSelected = false;
                      footBallIntermediateSelected = false;
                      footBallAdvancedSelected = true;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      color: footBallAdvancedSelected? const Color.fromARGB(255, 42, 114, 202):Color.fromARGB(65, 158, 158, 158),
                      child: Center(
                        child: Text('Advanced', style: GoogleFonts.poppins(
                          fontSize: 15, color: footBallAdvancedSelected? Colors.white:Color.fromARGB(48, 0, 0, 0), fontWeight: FontWeight.w500
                        ),),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
              child: InkWell(
            onTap: () async{
              var footBallProgressData = FirebaseFirestore.instance.collection("footBall_progress");
              footBallProgressData.doc(widget.user.uid).get().then((DocumentSnapshot doc) {
              if (doc.exists == true) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                duration: Duration(milliseconds: 2000),
                content: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'This Program Already Exist',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
                backgroundColor: Color.fromARGB(255, 255, 0, 0),
              ));
              } else {
                if (
                footBallHobbySelected == false &&
                footBallCompetitiveSelected == false ||
                footBallBeginnerSelected == false &&
                footBallIntermediateSelected == false &&
                footBallAdvancedSelected == false
              ) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                duration: Duration(milliseconds: 2000),
                content: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Choose All The Option',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
                backgroundColor: Color.fromARGB(255, 255, 0, 0),
              ));
              }

              if (footBallHobbySelected == true && footBallBeginnerSelected == true) {
                FirestoreHelper().addFootBallProgram("Hobby", "Beginner", widget.user.uid);
                FirestoreHelper().addFootBallDailyProgram(widget.user.uid, 0, 0);
               setState(() {
                 saved = true;
               });
              }if (footBallHobbySelected == true && footBallIntermediateSelected == true) {
                FirestoreHelper().addFootBallProgram("Hobby", "Intermediate", widget.user.uid);
                FirestoreHelper().addFootBallDailyProgram(widget.user.uid, 0, 0);
               setState(() {
                 saved = true;
               });
              }if (footBallHobbySelected == true && footBallAdvancedSelected == true) {
                FirestoreHelper().addFootBallProgram("Hobby", "Advanced", widget.user.uid);
                FirestoreHelper().addFootBallDailyProgram(widget.user.uid, 0, 0);
               setState(() {
                 saved = true;
               });
              }if (footBallCompetitiveSelected == true && footBallBeginnerSelected == true) {
                FirestoreHelper().addFootBallProgram("Competitive", "Beginner", widget.user.uid);
                FirestoreHelper().addFootBallDailyProgram(widget.user.uid, 0, 0);
               setState(() {
                 saved = true;
               });
              }if (footBallCompetitiveSelected == true && footBallIntermediateSelected == true) {
                FirestoreHelper().addFootBallProgram("Competitive", "Intermediate", widget.user.uid);
                FirestoreHelper().addFootBallDailyProgram(widget.user.uid, 0, 0);
               setState(() {
                 saved = true;
               });
              }if (footBallCompetitiveSelected == true && footBallAdvancedSelected == true) {
               FirestoreHelper().addFootBallProgram("Competitive", "Advanced", widget.user.uid);
               FirestoreHelper().addFootBallDailyProgram(widget.user.uid, 0, 0);
               setState(() {
                 saved = true;
               });
              }

              if (saved == true) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                duration: Duration(milliseconds: 200),
                content: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Saved',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
                backgroundColor: Color.fromARGB(255, 19, 215, 5),
              ));
              Timer(const Duration(milliseconds: 800), () {
                Navigator.pop(context);
              });
              }
              }
            });
            },
            child: Container(
              height: 50,
              width: 130,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 19, 215, 5),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Center(
                child: Text(
                  'Proceed',
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}