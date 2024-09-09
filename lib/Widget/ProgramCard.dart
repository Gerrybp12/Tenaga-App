// ignore_for_file: non_constant_identifier_names

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WlProgramCard extends StatelessWidget {
  WlProgramCard(
      {this.TopPadding,
      required this.SportType,
      this.ColorA,
      this.ColorB,
      required this.TargetValue,
      required this.LevelValue,
      required this.PeriodValue,
      required this.DailyTask,
      required this.OnTap,
      required this.image,
      required this.progress,
      super.key});

  final double? TopPadding;
  final String? SportType;
  final Color? ColorA;
  final Color? ColorB;
  final String TargetValue;
  final String PeriodValue;
  final String LevelValue;
  final bool DailyTask;
  final VoidCallback OnTap;
  final String image;
  final int progress;

  @override
  Widget build(BuildContext context) {
    double progressBar = progress/100;
    return Padding(
      padding: EdgeInsets.fromLTRB(0, TopPadding ?? 13, 0, 0),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              ColorA ?? Color.fromRGBO(46, 69, 98, 1),
              ColorB ?? Color.fromRGBO(0, 168, 202, 1)
            ], transform: GradientRotation(pi / 2)),
            borderRadius: BorderRadius.circular(30)),
        width: 370,
        height: 230,
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)))),
            onPressed: () {
              OnTap();
            },
            child: Stack(
              children: [
                Positioned(
                  left: 150,
                  top: 5,
                  child: Container(
                            height: 230,
                            width: 230,
                            child: Image.asset(image, opacity: AlwaysStoppedAnimation(0.7),)
                            ),
                ),
                Positioned(
                  left: 210,
                  top: 50,
                  child: Stack(
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            child: CircularProgressIndicator(
                            value: progressBar,
                            strokeWidth: 10,
                            valueColor: AlwaysStoppedAnimation(
                                Color.fromARGB(255, 103, 255, 108)),
                                        ),
                          ),
                          Container(
                            height: 122,
                            width: 122,
                            child: Center(child: Text('$progress%', style: GoogleFonts.poppins(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 103, 255, 108)
                          )))),
                        ],
                      ),
                ),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Column(
                        children: [
                          Text("$SportType",
                              style: GoogleFonts.poppins(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              )),

                          Column(
                            children: [
                              Container(
                                width: 200,
                                child: Row(
                                  children: [
                                    Text(
                                      'Target :',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '$TargetValue Kg',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 200,
                                child: Row(
                                  children: [
                                    Text(
                                      'Period :',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '$PeriodValue Days',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 200,
                                child: Row(
                                  children: [
                                    Text(
                                      'Level :',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '$LevelValue',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 200,
                                child: Text(
                                  'Daily Task :',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 200,
                                    child: DailyTask
                                        ? Text(
                                            'COMPLETED',
                                            style: GoogleFonts.poppins(
                                              color: Color.fromARGB(255, 0, 255, 8),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                            ),
                                          )
                                        : Text('UNCOMPLETED',
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 26,
                                                color: const Color.fromARGB(
                                                    255, 255, 17, 0))),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

class plusProgramCard extends StatelessWidget {
  plusProgramCard(
      {this.TopPadding,
      this.ColorA,
      this.ColorB,
      required this.OnTap,
      super.key});

  final double? TopPadding;
  final Color? ColorA;
  final Color? ColorB;
  final VoidCallback OnTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, TopPadding ?? 13, 0, 0),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                ColorA ?? const Color.fromRGBO(46, 69, 98, 1),
                ColorB ?? const Color.fromRGBO(0, 168, 202, 1)
              ], transform: GradientRotation(pi / 2)),
              borderRadius: BorderRadius.circular(30)),
          width: 370,
          height: 230,
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)))),
              onPressed: () {
                OnTap();
              },
              child: const Icon(
                Icons.add,
                size: 80,
              )),
        ));
  }
}

class ProgramCard extends StatelessWidget {
  ProgramCard(
      {this.TopPadding,
      required this.SportType,
      this.ColorA,
      this.ColorB,
      required this.Purpose,
      required this.Level,
      required this.DailyTask,
      required this.OnTap,
      required this.image,
      required this.progress,
      super.key});

  final double? TopPadding;
  final String? SportType;
  final Color? ColorA;
  final Color? ColorB;
  final String Purpose;
  final String Level;
  final bool DailyTask;
  final VoidCallback OnTap;
  final String image;
  final int progress;

  @override
  Widget build(BuildContext context) {
    double progressBar = progress/100;
    return Padding(
      padding: EdgeInsets.fromLTRB(0, TopPadding ?? 13, 0, 0),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              ColorA ?? Color.fromRGBO(46, 69, 98, 1),
              ColorB ?? Color.fromRGBO(0, 168, 202, 1)
            ], transform: GradientRotation(pi / 2)),
            borderRadius: BorderRadius.circular(30)),
        width: 370,
        height: 230,
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)))),
            onPressed: () {
              OnTap();
            },
            child: Stack(
              children: [
                Positioned(
                  left: 170,
                  top: 20,
                  child: Container(
                            height: 180,
                            width: 180,
                            child: Image.asset(image, opacity: AlwaysStoppedAnimation(0.7),)
                            ),
                ),
                Positioned(
                  left: 210,
                  top: 50,
                  child: Stack(
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            child: CircularProgressIndicator(
                            value: progressBar,
                            strokeWidth: 10,
                            valueColor: AlwaysStoppedAnimation(
                                Color.fromARGB(255, 103, 255, 108)),
                                        ),
                          ),
                          Container(
                            height: 122,
                            width: 122,
                            child: Center(child: Text('$progress%', style: GoogleFonts.poppins(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 103, 255, 108)
                          )))),
                        ],
                      ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("$SportType",
                              style: GoogleFonts.poppins(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              )),
                          Column(
                            children: [
                              Container(
                                width: 200,
                                child: Row(
                                  children: [
                                    Text(
                                      'Target :',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '$Purpose',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 200,
                                child: Row(
                                  children: [
                                    Text(
                                      'Level :',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '$Level',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 200,
                                child: Text(
                                  'Daily Task :',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 200,
                                    child: DailyTask
                                        ? Text(
                                            'COMPLETED',
                                            style: GoogleFonts.poppins(
                                              color: Color.fromARGB(255, 0, 255, 8),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                            ),
                                          )
                                        : Text('UNCOMPLETED',
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 26,
                                                color: const Color.fromARGB(
                                                    255, 255, 17, 0))),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}