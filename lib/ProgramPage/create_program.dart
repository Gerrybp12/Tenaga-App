import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newtenaga/QuestionPage/BadmintonQuestion.dart';
import 'package:newtenaga/QuestionPage/FootballQuestion.dart';
import 'package:newtenaga/QuestionPage/TableTennisQuestion.dart';
import 'package:newtenaga/QuestionPage/WeightlossQuestion.dart';

import '../QuestionPage/BasketQuestion.dart';

 // ignore: must_be_immutable
class CreateProgram extends StatefulWidget {
  CreateProgram({
    required this.user,
    super.key});

  User user;

  @override
  State<CreateProgram> createState() => _CreateProgramState();
}
  bool basketHobbySelected = false;
  bool basketCompetitiveSelected = false;
  bool basketBeginnerSeleceted = false;
  bool basketIntermediateSelected = false;
  bool baseketProfessionalSelected = false;

bool weightLossSelected = false;
bool basketballSelected = false;
bool footballSelected = false;
bool tableTennisSelected = false;
bool badmintonSelected = false;
int tabsIndex = 0;



class _CreateProgramState extends State<CreateProgram> {
  late List<Widget> tabs = [
    programNotSelected(),
    WeightLossQuestion(user: widget.user,),
    BasketballQuestion(user: widget.user,),
    FootBallQuostion(user: widget.user,),
    TableTennisQuestion(),
    BadmintonQuesion(user: widget.user,),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 252, 244),
      body: Container(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(46, 69, 98, 1),
                    ),
                    height: 40,
                    width: 40,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      padding: EdgeInsets.zero,
                      color: Colors.white,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
                Center(
                  child: Text('Create New Program',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(46, 69, 98, 1))),
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Container(
                    width: 355,
                    height: 320,// 500,
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  weightLossSelected = true;
                                  basketballSelected = false;
                                  footballSelected = false;
                                  tableTennisSelected = false;
                                  badmintonSelected = false;
                                  tabsIndex = 1;
                                });
                              },
                              child: PhysicalModel(
                                color: weightLossSelected
                                    ? Color.fromARGB(255, 94, 255, 82)
                                    : Colors.transparent,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: Container(
                                  height: 150,
                                  width: 165,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    color: Color.fromRGBO(46, 69, 98, 1),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Weight Loss',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                        fontSize: 30,
                                        color: weightLossSelected
                                            ? Color.fromARGB(255, 94, 255, 82)
                                            : Colors.white,
                                        fontWeight: FontWeight.w600),
                                  )),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  weightLossSelected = false;
                                  basketballSelected = true;
                                  footballSelected = false;
                                  tableTennisSelected = false;
                                  badmintonSelected = false;
                                  tabsIndex = 2;
                                });
                              },
                              child: PhysicalModel(
                                color: basketballSelected
                                    ? Color.fromARGB(255, 94, 255, 82)
                                    : Colors.transparent,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: Container(
                                  height: 150,
                                  width: 165,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    color: Color.fromRGBO(46, 69, 98, 1),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Basket ball',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                        fontSize: 30,
                                        color: basketballSelected
                                            ? Color.fromARGB(255, 94, 255, 82)
                                            : Colors.white,
                                        fontWeight: FontWeight.w600),
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  weightLossSelected = false;
                                  basketballSelected = false;
                                  footballSelected = true;
                                  tableTennisSelected = false;
                                  badmintonSelected = false;
                                  tabsIndex = 3;
                                });
                              },
                              child: PhysicalModel(
                                color: footballSelected
                                    ? Color.fromARGB(255, 94, 255, 82)
                                    : Colors.transparent,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: Container(
                                  height: 150,
                                  width: 165,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    color: Color.fromRGBO(46, 69, 98, 1),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Football',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                        fontSize: 30,
                                        color: footballSelected
                                            ? Color.fromARGB(255, 94, 255, 82)
                                            : Colors.white,
                                        fontWeight: FontWeight.w600),
                                  )),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  weightLossSelected = false;
                                  basketballSelected = false;
                                  footballSelected = false;
                                  tableTennisSelected = false;
                                  badmintonSelected = true;
                                  tabsIndex = 5;
                                });
                              },
                              child: PhysicalModel(
                                color: badmintonSelected
                                    ? Color.fromARGB(255, 94, 255, 82)
                                    : Colors.transparent,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: Container(
                                  height: 150,
                                  width: 165,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    color: Color.fromRGBO(46, 69, 98, 1),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'Badminton',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                        fontSize: 25,
                                        color: badmintonSelected
                                            ? Color.fromARGB(255, 94, 255, 82)
                                            : Colors.white,
                                        fontWeight: FontWeight.w600),
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                        //  Row(
                        //    mainAxisAlignment: MainAxisAlignment.center,
                        //    children: [
                        //       InkWell(
                        //         onTap: () {
                        //           setState(() {
                        //             weightLossSelected = false;
                        //             basketballSelected = false;
                        //             footballSelected = false;
                        //             tableTennisSelected = true;
                        //             badmintonSelected = false;
                        //             tabsIndex = 4;
                        //           });
                        //         },
                        //         child: PhysicalModel(
                        //           color: tableTennisSelected
                        //               ? Color.fromARGB(255, 94, 255, 82)
                        //               : Colors.transparent,
                        //           borderRadius:
                        //               const BorderRadius.all(Radius.circular(10)),
                        //           child: Container(
                        //             height: 150,
                        //             width: 165,
                        //             decoration: const BoxDecoration(
                        //               borderRadius:
                        //                   BorderRadius.all(Radius.circular(30)),
                        //               color: Color.fromRGBO(46, 69, 98, 1),
                        //             ),
                        //             child: Center(
                        //                 child: Text(
                        //               'Table Tennis',
                        //               textAlign: TextAlign.center,
                        //               style: GoogleFonts.poppins(
                        //                   fontSize: 30,
                        //                   color: tableTennisSelected
                        //                       ? Color.fromARGB(255, 94, 255, 82)
                        //                       : Colors.white,
                        //                   fontWeight: FontWeight.w600),
                        //             )),
                        //           ),
                        //         ),
                        //       ),
                        //    ],
                        //  ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: tabs[tabsIndex],
                ),
                const SizedBox(height: 70,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container programNotSelected() {
    return Container(
      height: 50,
      child: Text(
        'Select Program First',
        style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(127, 0, 0, 0)),
      ),
    );
  }
  }

