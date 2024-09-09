import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newtenaga/data/remote_data_source/firestore_helper.dart';

// ignore: must_be_immutable
class BadmintonQuesion extends StatefulWidget {
  BadmintonQuesion({
    required this.user,
    super.key});

  User user;

  @override
  State<BadmintonQuesion> createState() => _BadmintonQuesionState();
}

  bool badmintonHobbySelected = false;
  bool badmintonCompetitiveSelected = false;
  bool badmintonBeginnerSelected = false;
  bool badmintonIntermediateSelected = false;
  bool badmintonAdvancedSelected = false;
  bool saved = false;

class _BadmintonQuesionState extends State<BadmintonQuesion> {
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
                        badmintonHobbySelected = true;
                        badmintonCompetitiveSelected = false;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 180,
                      color: badmintonHobbySelected? const Color.fromARGB(255, 42, 114, 202):Color.fromARGB(65, 158, 158, 158),
                      child: Center(
                        child: Text('Hobby', style: GoogleFonts.poppins(
                          fontSize: 20, color: badmintonHobbySelected? Colors.white:Color.fromARGB(48, 0, 0, 0), fontWeight: FontWeight.w500
                        ),),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        badmintonHobbySelected = false;
                        badmintonCompetitiveSelected = true;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 180,
                      color: badmintonCompetitiveSelected? const Color.fromARGB(255, 42, 114, 202):Color.fromARGB(65, 158, 158, 158),
                      child: Center(
                        child: Text('Competitive', style: GoogleFonts.poppins(
                          fontSize: 20, color: badmintonCompetitiveSelected? Colors.white:Color.fromARGB(48, 0, 0, 0), fontWeight: FontWeight.w500
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
                        badmintonBeginnerSelected = true;
                      badmintonIntermediateSelected = false;
                      badmintonAdvancedSelected = false;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      color: badmintonBeginnerSelected? const Color.fromARGB(255, 42, 114, 202):Color.fromARGB(65, 158, 158, 158),
                      child: Center(
                        child: Text('Beginner', style: GoogleFonts.poppins(
                          fontSize: 15, color: badmintonBeginnerSelected? Colors.white:Color.fromARGB(48, 0, 0, 0), fontWeight: FontWeight.w500
                        ),),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        badmintonBeginnerSelected = false;
                      badmintonIntermediateSelected = true;
                      badmintonAdvancedSelected = false;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      color: badmintonIntermediateSelected? const Color.fromARGB(255, 42, 114, 202):Color.fromARGB(65, 158, 158, 158),
                      child: Center(
                        child: Text('Intermediate', style: GoogleFonts.poppins(
                          fontSize: 15, color: badmintonIntermediateSelected? Colors.white:Color.fromARGB(48, 0, 0, 0), fontWeight: FontWeight.w500
                        ),),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        badmintonBeginnerSelected = false;
                      badmintonIntermediateSelected = false;
                      badmintonAdvancedSelected = true;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      color: badmintonAdvancedSelected? const Color.fromARGB(255, 42, 114, 202):Color.fromARGB(65, 158, 158, 158),
                      child: Center(
                        child: Text('Advanced', style: GoogleFonts.poppins(
                          fontSize: 15, color: badmintonAdvancedSelected? Colors.white:Color.fromARGB(48, 0, 0, 0), fontWeight: FontWeight.w500
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
              var badmintonProgressData = FirebaseFirestore.instance.collection("badminton_progress");
              badmintonProgressData.doc(widget.user.uid).get().then((DocumentSnapshot doc) {
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
                badmintonHobbySelected == false &&
                badmintonCompetitiveSelected == false ||
                badmintonBeginnerSelected == false &&
                badmintonIntermediateSelected == false &&
                badmintonAdvancedSelected == false
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

              if (badmintonHobbySelected == true && badmintonBeginnerSelected == true) {
                FirestoreHelper().addBadmintonProgram("Hobby", "Beginner", widget.user.uid);
                FirestoreHelper().addBadmintonDailyProgram(widget.user.uid, 0, 0);
               setState(() {
                 saved = true;
               });
              }if (badmintonHobbySelected == true && badmintonIntermediateSelected == true) {
                FirestoreHelper().addBadmintonProgram("Hobby", "Intermediate", widget.user.uid);
                FirestoreHelper().addBadmintonDailyProgram(widget.user.uid, 0, 0);
               setState(() {
                 saved = true;
               });
              }if (badmintonHobbySelected == true && badmintonAdvancedSelected == true) {
                FirestoreHelper().addBadmintonProgram("Hobby", "Advanced", widget.user.uid);
                FirestoreHelper().addBadmintonDailyProgram(widget.user.uid, 0, 0);
               setState(() {
                 saved = true;
               });
              }if (badmintonCompetitiveSelected == true && badmintonBeginnerSelected == true) {
                FirestoreHelper().addBadmintonProgram("Competitive", "Beginner", widget.user.uid);
                FirestoreHelper().addBadmintonDailyProgram(widget.user.uid, 0, 0);
               setState(() {
                 saved = true;
               });
              }if (badmintonCompetitiveSelected == true && badmintonIntermediateSelected == true) {
                FirestoreHelper().addBadmintonProgram("Competitive", "Intermediate", widget.user.uid);
                FirestoreHelper().addBadmintonDailyProgram(widget.user.uid, 0, 0);
               setState(() {
                 saved = true;
               });
              }if (badmintonCompetitiveSelected == true && badmintonAdvancedSelected == true) {
               FirestoreHelper().addBadmintonProgram("Competitive", "Advanced", widget.user.uid);
               FirestoreHelper().addBadmintonDailyProgram(widget.user.uid, 0, 0);
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