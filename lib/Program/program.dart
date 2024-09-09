// ignore_for_file: unused_import
import 'dart:collection';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:newtenaga/MainScreen.dart';
import 'package:newtenaga/ProgramPage/Badminton.dart';
import 'package:newtenaga/ProgramPage/Basketball.dart';
import 'package:newtenaga/ProgramPage/create_program.dart';
import 'package:newtenaga/Widget/username.dart';
import 'package:newtenaga/Widget/widget.dart';
import 'package:newtenaga/data/model/model.dart';
import 'package:newtenaga/data/model/usermodel.dart';
import 'package:newtenaga/data/remote_data_source/firestore_helper.dart';
import '../ProgramPage/Football.dart';
import '../ProgramPage/WeightLoss.dart';

// ignore: must_be_immutable
class ProgramScreen extends StatefulWidget {
  ProgramScreen({required this.user, Key? key}) : super(key: key);

  User user;

  @override
  State<ProgramScreen> createState() => _ProgramScreenState();
}

class _ProgramScreenState extends State<ProgramScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey.shade800,
                      backgroundImage: AssetImage('assets/GigaChad.jpg'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: SizedBox(
                            width: 15,
                            height: 15,
                            child: Image.asset(
                              'assets/royal-crown.png',
                              color: Color.fromRGBO(228, 206, 5, 1),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 20,
                          width: 180,
                          child: Username(
                            user: widget.user,
                            usernameSize: 20,
                            usernameHeight: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  width: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, right: 23),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 35,
                        height: 35,
                        child: Image.asset(
                          'assets/coin.png',
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text((MyCoin).toStringAsFixed(0),
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Color.fromRGBO(111, 111, 111, 1),
                          )),
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                StreamBuilder(
                    stream: FirestoreHelper().streamWlProgress(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var weightLoss = snapshot.data!;
                        return WlProgramCard(
                            SportType: 'Weight Loss',
                            image: 'assets/running.png',
                            progress: weightLoss.wlProgress,
                            TargetValue: weightLoss.wlTarget,
                            LevelValue: weightLoss.wlLevel,
                            PeriodValue: weightLoss.wlDays,
                            DailyTask: weightLoss.wlDailyTask,
                            OnTap: () {
                              Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WeightLoss(user: widget.user,)));
                            });
                      } else {
                        return const SizedBox();
                      }
                    }),
                 StreamBuilder(
                    stream: FirestoreHelper().streamBbProgress(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var badminton = snapshot.data!;
                        return ProgramCard(
                            SportType: 'Basketball',
                            image: 'assets/basketballPerson.png',
                            progress: badminton.bbProgress,
                            Purpose: badminton.bbPurpose,
                            Level: badminton.bbLevel,
                            DailyTask: badminton.bbDailyTask,
                            ColorA: Color.fromARGB(255, 191, 51, 0),
                            ColorB: const Color.fromARGB(255, 218, 131, 0),
                            OnTap: () {
                              Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Basketball(user: widget.user,)));
                            });
                      } else {
                        return const SizedBox();
                      }
                    }),
                    StreamBuilder(
                    stream: FirestoreHelper().streamFbProgress(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var badminton = snapshot.data!;
                        return ProgramCard(
                            SportType: 'Football',
                            image: 'assets/football.png',
                            progress: badminton.fbProgress,
                            Purpose: badminton.fbPurpose,
                            Level: badminton.fbLevel,
                            DailyTask: badminton.fbDailyTask,
                            ColorA: Color.fromRGBO(3, 97, 0, 1),
                            ColorB: Color.fromRGBO(0, 202, 3, 1),
                            OnTap: () {
                              Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Football(user: widget.user,)));
                            });
                      } else {
                        return const SizedBox();
                      }
                    }),
                StreamBuilder(
                    stream: FirestoreHelper().streamBtProgress(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var badminton = snapshot.data!;
                        return ProgramCard(
                            SportType: 'Badminton',
                            image: 'assets/badminton.png',
                            progress: badminton.btProgress,
                            Purpose: badminton.btPurpose,
                            Level: badminton.btLevel,
                            DailyTask: badminton.btDailyTask,
                            ColorA: Color.fromRGBO(0, 177, 109, 1),
                            ColorB: Color.fromRGBO(0, 197, 190, 1),
                            OnTap: () {
                              Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Badminton(user: widget.user,)));
                            });
                      } else {
                        return const SizedBox();
                      }
                    }),
                plusProgramCard(
                  ColorA: Color.fromRGBO(79, 253, 107, 1),
                  ColorB: Color.fromRGBO(77, 113, 61, 1),
                  OnTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateProgram(
                                  user: widget.user,
                                )));
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
