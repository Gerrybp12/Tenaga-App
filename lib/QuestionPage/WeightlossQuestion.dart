import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newtenaga/data/remote_data_source/firestore_helper.dart';

// ignore: must_be_immutable
class WeightLossQuestion extends StatefulWidget {
  WeightLossQuestion({required this.user, super.key});

  User user;

  @override
  State<WeightLossQuestion> createState() => _WeightLossQuestionState();
}

bool weightLossBeginnerSelected = false;
bool weightLossIntermediateSelected = false;
bool weightLossAdvancedSelected = false;

class _WeightLossQuestionState extends State<WeightLossQuestion> {
  TextEditingController _initialWeightController = TextEditingController();
  TextEditingController _finalWeightController = TextEditingController();
  TextEditingController _periodController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 600,
      color: Colors.transparent,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Initial Weight :',
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _initialWeightController,
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(),
                    hintText: "Your Current Weight (Kg)",
                    hintStyle: TextStyle(
                        fontSize: 15, color: Color.fromARGB(115, 0, 0, 0)),
                    filled: true,
                    fillColor: Color.fromARGB(43, 0, 0, 0)),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Weight Target :',
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _finalWeightController,
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(),
                    hintText: "Your Weight Target (Kg)",
                    hintStyle: TextStyle(
                        fontSize: 15, color: Color.fromARGB(115, 0, 0, 0)),
                    filled: true,
                    fillColor: Color.fromARGB(43, 0, 0, 0)),
              ),
              const SizedBox(
            height: 20,
          ),
              Text(
                'Period :',
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _periodController,
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(),
                    hintText: "Period (Days)",
                    hintStyle: TextStyle(
                        fontSize: 15, color: Color.fromARGB(115, 0, 0, 0)),
                    filled: true,
                    fillColor: Color.fromARGB(43, 0, 0, 0)),
              ),
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
                    onTap: () {
                      setState(() {
                        weightLossBeginnerSelected = true;
                        weightLossIntermediateSelected = false;
                        weightLossAdvancedSelected = false;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      color: weightLossBeginnerSelected
                          ? const Color.fromARGB(255, 42, 114, 202)
                          : Color.fromARGB(65, 158, 158, 158),
                      child: Center(
                        child: Text(
                          'Beginner',
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: weightLossBeginnerSelected
                                  ? Colors.white
                                  : Color.fromARGB(48, 0, 0, 0),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        weightLossBeginnerSelected = false;
                        weightLossIntermediateSelected = true;
                        weightLossAdvancedSelected = false;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      color: weightLossIntermediateSelected
                          ? const Color.fromARGB(255, 42, 114, 202)
                          : Color.fromARGB(65, 158, 158, 158),
                      child: Center(
                        child: Text(
                          'Intermediate',
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: weightLossIntermediateSelected
                                  ? Colors.white
                                  : Color.fromARGB(48, 0, 0, 0),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        weightLossBeginnerSelected = false;
                        weightLossIntermediateSelected = false;
                        weightLossAdvancedSelected = true;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      color: weightLossAdvancedSelected
                          ? const Color.fromARGB(255, 42, 114, 202)
                          : Color.fromARGB(65, 158, 158, 158),
                      child: Center(
                        child: Text(
                          'Advanced',
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: weightLossAdvancedSelected
                                  ? Colors.white
                                  : Color.fromARGB(48, 0, 0, 0),
                              fontWeight: FontWeight.w500),
                        ),
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
            onTap: () async {
              var weightLossProgressData = FirebaseFirestore.instance.collection("weightLoss_progress");
              weightLossProgressData.doc(widget.user.uid).get().then((DocumentSnapshot doc) {
                if (doc.exists == true) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                duration: Duration(milliseconds: 2000),
                content: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'This program already exist',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
                backgroundColor: Color.fromARGB(255, 255, 0, 0),
              ));
              } else {
                if (_finalWeightController.text == "" ||
                  _initialWeightController.text == "" ||
                  _periodController.text == "" ||
                  weightLossBeginnerSelected == false &&
                  weightLossIntermediateSelected == false &&
                  weightLossAdvancedSelected == false) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                duration: Duration(milliseconds: 2000),
                content: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Insert all field',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
                backgroundColor: Color.fromARGB(255, 255, 0, 0),
              ));
                      }
              else {
                int finalWeightValue = int.parse(_finalWeightController.text);
              int initialWeightValue = int.parse(_initialWeightController.text);
              if (finalWeightValue >= initialWeightValue) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                duration: Duration(milliseconds: 2000),
                content: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'target weight must be smaller \n than current weight!',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
                backgroundColor: Color.fromARGB(255, 255, 0, 0),
              ));
              }

              else {
              if (weightLossBeginnerSelected == true) {
                FirestoreHelper().addWeightLossProgram(
                    _initialWeightController.text,
                    _initialWeightController.text,
                    _finalWeightController.text,
                    _periodController.text,
                    'Beginner',
                    widget.user.uid);
                    FirestoreHelper().addWeightLossDailyProgram(widget.user.uid, 0, 0);
              }
              if (weightLossIntermediateSelected == true) {
                FirestoreHelper().addWeightLossProgram(
                    _initialWeightController.text,
                    _initialWeightController.text,
                    _finalWeightController.text,
                    _periodController.text,
                    'Intermediate',
                    widget.user.uid);
                    FirestoreHelper().addWeightLossDailyProgram(widget.user.uid, 0, 0);
              }
              if (weightLossAdvancedSelected == true) {
                FirestoreHelper().addWeightLossProgram(
                    _initialWeightController.text,
                    _initialWeightController.text,
                    _finalWeightController.text,
                    _periodController.text,
                    'Advanced',
                    widget.user.uid);
                    FirestoreHelper().addWeightLossDailyProgram(widget.user.uid, 0, 0);
              }
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
          )),
        ],
      ),
    );
  }
}
