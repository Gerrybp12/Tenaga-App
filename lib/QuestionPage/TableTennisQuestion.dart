import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TableTennisQuestion extends StatefulWidget {
  const TableTennisQuestion({super.key});

  @override
  State<TableTennisQuestion> createState() => _TableTennisQuestionState();
}

  bool tableTennisHobbySelected = false;
  bool tableTennisCompetitiveSelected = false;
  bool tableTennisBeginnerSelected = false;
  bool tableTennisIntermediateSelected = false;
  bool tableTennisAdvancedSelected = false;

class _TableTennisQuestionState extends State<TableTennisQuestion> {
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
                        tableTennisHobbySelected = true;
                        tableTennisCompetitiveSelected = false;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 180,
                      color: tableTennisHobbySelected? const Color.fromARGB(255, 42, 114, 202):Color.fromARGB(65, 158, 158, 158),
                      child: Center(
                        child: Text('Hobby', style: GoogleFonts.poppins(
                          fontSize: 20, color: tableTennisHobbySelected? Colors.white:Color.fromARGB(48, 0, 0, 0), fontWeight: FontWeight.w500
                        ),),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        tableTennisHobbySelected = false;
                        tableTennisCompetitiveSelected = true;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 180,
                      color: tableTennisCompetitiveSelected? const Color.fromARGB(255, 42, 114, 202):Color.fromARGB(65, 158, 158, 158),
                      child: Center(
                        child: Text('Competitive', style: GoogleFonts.poppins(
                          fontSize: 20, color: tableTennisCompetitiveSelected? Colors.white:Color.fromARGB(48, 0, 0, 0), fontWeight: FontWeight.w500
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
                        tableTennisBeginnerSelected = true;
                      tableTennisIntermediateSelected = false;
                      tableTennisAdvancedSelected = false;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      color: tableTennisBeginnerSelected? const Color.fromARGB(255, 42, 114, 202):Color.fromARGB(65, 158, 158, 158),
                      child: Center(
                        child: Text('Beginner', style: GoogleFonts.poppins(
                          fontSize: 15, color: tableTennisBeginnerSelected? Colors.white:Color.fromARGB(48, 0, 0, 0), fontWeight: FontWeight.w500
                        ),),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        tableTennisBeginnerSelected = false;
                      tableTennisIntermediateSelected = true;
                      tableTennisAdvancedSelected = false;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      color: tableTennisIntermediateSelected? const Color.fromARGB(255, 42, 114, 202):Color.fromARGB(65, 158, 158, 158),
                      child: Center(
                        child: Text('Intermediate', style: GoogleFonts.poppins(
                          fontSize: 15, color: tableTennisIntermediateSelected? Colors.white:Color.fromARGB(48, 0, 0, 0), fontWeight: FontWeight.w500
                        ),),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        tableTennisBeginnerSelected = false;
                      tableTennisIntermediateSelected = false;
                      tableTennisAdvancedSelected = true;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      color: tableTennisAdvancedSelected? const Color.fromARGB(255, 42, 114, 202):Color.fromARGB(65, 158, 158, 158),
                      child: Center(
                        child: Text('Advanced', style: GoogleFonts.poppins(
                          fontSize: 15, color: tableTennisAdvancedSelected? Colors.white:Color.fromARGB(48, 0, 0, 0), fontWeight: FontWeight.w500
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
            onTap: () {
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