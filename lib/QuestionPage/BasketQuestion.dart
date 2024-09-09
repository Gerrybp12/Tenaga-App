import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/remote_data_source/firestore_helper.dart';

// ignore: must_be_immutable
class BasketballQuestion extends StatefulWidget {
  BasketballQuestion({
    required this.user,
    super.key});

  User user;

  @override
  State<BasketballQuestion> createState() => _BasketballQuestionState();
}

  bool basketHobbySelected = false;
  bool basketCompetitiveSelected = false;
  bool basketBeginnerSelected = false;
  bool basketIntermediateSelected = false;
  bool basketAdvancedSelected = false;
  bool saved = false;

class _BasketballQuestionState extends State<BasketballQuestion> {
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
                        basketHobbySelected = true;
                        basketCompetitiveSelected = false;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 180,
                      color: basketHobbySelected? const Color.fromARGB(255, 42, 114, 202):Color.fromARGB(65, 158, 158, 158),
                      child: Center(
                        child: Text('Hobby', style: GoogleFonts.poppins(
                          fontSize: 20, color: basketHobbySelected? Colors.white:Color.fromARGB(48, 0, 0, 0), fontWeight: FontWeight.w500
                        ),),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        basketHobbySelected = false;
                        basketCompetitiveSelected = true;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 180,
                      color: basketCompetitiveSelected? const Color.fromARGB(255, 42, 114, 202):Color.fromARGB(65, 158, 158, 158),
                      child: Center(
                        child: Text('Competitive', style: GoogleFonts.poppins(
                          fontSize: 20, color: basketCompetitiveSelected? Colors.white:Color.fromARGB(48, 0, 0, 0), fontWeight: FontWeight.w500
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
                        basketBeginnerSelected = true;
                      basketIntermediateSelected = false;
                      basketAdvancedSelected = false;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      color: basketBeginnerSelected? const Color.fromARGB(255, 42, 114, 202):Color.fromARGB(65, 158, 158, 158),
                      child: Center(
                        child: Text('Beginner', style: GoogleFonts.poppins(
                          fontSize: 15, color: basketBeginnerSelected? Colors.white:Color.fromARGB(48, 0, 0, 0), fontWeight: FontWeight.w500
                        ),),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        basketBeginnerSelected = false;
                      basketIntermediateSelected = true;
                      basketAdvancedSelected = false;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      color: basketIntermediateSelected? const Color.fromARGB(255, 42, 114, 202):Color.fromARGB(65, 158, 158, 158),
                      child: Center(
                        child: Text('Intermediate', style: GoogleFonts.poppins(
                          fontSize: 15, color: basketIntermediateSelected? Colors.white:Color.fromARGB(48, 0, 0, 0), fontWeight: FontWeight.w500
                        ),),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        basketBeginnerSelected = false;
                      basketIntermediateSelected = false;
                      basketAdvancedSelected = true;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      color: basketAdvancedSelected? const Color.fromARGB(255, 42, 114, 202):Color.fromARGB(65, 158, 158, 158),
                      child: Center(
                        child: Text('Advanced', style: GoogleFonts.poppins(
                          fontSize: 15, color: basketAdvancedSelected? Colors.white:Color.fromARGB(48, 0, 0, 0), fontWeight: FontWeight.w500
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
              var basketProgressData = FirebaseFirestore.instance.collection("basketBall_progress");
              basketProgressData.doc(widget.user.uid).get().then((DocumentSnapshot doc) {
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
                basketHobbySelected == false &&
                basketCompetitiveSelected == false ||
                basketBeginnerSelected == false &&
                basketIntermediateSelected == false &&
                basketAdvancedSelected == false
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

              if (basketHobbySelected == true && basketBeginnerSelected == true) {
                FirestoreHelper().addBasketBallProgram("Hobby", "Beginner", widget.user.uid);
                FirestoreHelper().addBasketBallDailyProgram(widget.user.uid, 0, 0);
               setState(() {
                 saved = true;
               });
              }if (basketHobbySelected == true && basketIntermediateSelected == true) {
                FirestoreHelper().addBasketBallProgram("Hobby", "Intermediate", widget.user.uid);
                FirestoreHelper().addBasketBallDailyProgram(widget.user.uid, 0, 0);
               setState(() {
                 saved = true;
               });
              }if (basketHobbySelected == true && basketAdvancedSelected == true) {
                FirestoreHelper().addBasketBallProgram("Hobby", "Advanced", widget.user.uid);
                FirestoreHelper().addBasketBallDailyProgram(widget.user.uid, 0, 0);
               setState(() {
                 saved = true;
               });
              }if (basketCompetitiveSelected == true && basketBeginnerSelected == true) {
                FirestoreHelper().addBasketBallProgram("Competitive", "Beginner", widget.user.uid);
                FirestoreHelper().addBasketBallDailyProgram(widget.user.uid, 0, 0);
               setState(() {
                 saved = true;
               });
              }if (basketCompetitiveSelected == true && basketIntermediateSelected == true) {
                FirestoreHelper().addBasketBallProgram("Competitive", "Intermediate", widget.user.uid);
                FirestoreHelper().addBasketBallDailyProgram(widget.user.uid, 0, 0);
               setState(() {
                 saved = true;
               });
              }if (basketCompetitiveSelected == true && basketAdvancedSelected == true) {
               FirestoreHelper().addBasketBallProgram("Competitive", "Advanced", widget.user.uid);
               FirestoreHelper().addBasketBallDailyProgram(widget.user.uid, 0, 0);
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