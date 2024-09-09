import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:newtenaga/MainScreen.dart';
import 'package:newtenaga/ProgramPage/WeightLoss.dart';
import 'package:newtenaga/Widget/username.dart';
import 'package:newtenaga/Widget/widget.dart';
import 'package:newtenaga/Authenticate/auth_service.dart';

import '../ProgramPage/Badminton.dart';
import '../ProgramPage/Basketball.dart';
import '../ProgramPage/Football.dart';
import '../data/remote_data_source/firestore_helper.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({
    required this.user,
    super.key,
  });

  User user;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,10,0,0),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey.shade800,
                    backgroundImage: AssetImage('assets/GigaChad.jpg'),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      color: Colors.transparent,
                      height: 55,
                      width: 250,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: PremiumMember?
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 20, 7, 0),
                              child: Container(
                                width: 25,
                                height: 25,
                                child: Image.asset(
                                  'assets/royal-crown.png',
                                  color: Color.fromRGBO(193, 174, 0, 1),
                                ),
                              ),
                            ),
                            Text(
                              'Premium Member',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: const Color.fromRGBO(193, 174, 0, 1),
                                height: 5.2,
                              ),
                            ),
                          ],
                        ): Row(),
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      height: 45,
                      width: 250,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Username(user: user, usernameHeight: 1,),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      'Your Programs :',
                      style: GoogleFonts.poppins(
                       color: Color.fromRGBO(111, 111, 111, 1),
                       fontSize: 14,
                      ),
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: SizedBox(
                      height: 32,
                      child: TextButton(
                        onPressed: () {

                        },
                        child: Text(
                          'See All',
                          style: GoogleFonts.poppins(
                           color: Color.fromRGBO(111, 111, 111, 0.935),
                           fontSize: 14,
                           fontWeight: FontWeight.w600,
                          )
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 230,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 5,),
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
                            builder: (context) => Basketball(user: user,)));
                            });
                      } else {
                        return const SizedBox();
                      }
                    }),
                    SizedBox(width: 5,),
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
                            builder: (context) => Football(user: user,)));
                            });
                      } else {
                        return const SizedBox();
                      }
                    }),
                    SizedBox(width: 5.w,),
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
                            builder: (context) => Badminton(user: user,)));
                            });
                      } else {
                        return const SizedBox();
                      }
                    }),
                    SizedBox(width: 5,),
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
                            builder: (context) => WeightLoss(user: user,)));
                            });
                      } else {
                        return const SizedBox();
                      }
                    }),
                    SizedBox(width: 5,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 170),
              child: SizedBox(
                height: 35,
                child: TextButton(
                  onPressed: () {

                  },
                  child: Text(
                    'Purchase History',
                      style: GoogleFonts.poppins(
                        color: Color.fromRGBO(111, 111, 111, 0.704),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                ),
                 ),
            ),
            Container(
              height: 60,
              width: 310,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color.fromARGB(20, 0, 0, 0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Available Coins :',
                    style: GoogleFonts.poppins(
                      color: Color.fromRGBO(111, 111, 111, 1),
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 40, height: 40,
                        child: Image.asset(
                          'assets/coin.png',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 7),
                        child: Text(
                          (MyCoin).toStringAsFixed(0),
                          style: GoogleFonts.poppins(
                           color: Color.fromRGBO(111, 111, 111, 1),
                           fontSize: 14,
                          )
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(13, 20, 13, 0),
              child: Container(
                width: double.infinity  , height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromARGB(20, 0, 0, 0),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: Text(
                        'Your Challenges :',
                        style: GoogleFonts.poppins(
                          color: Color.fromRGBO(111, 111, 111, 1),
                          fontSize: 14,
                        ),
                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: TextButton(
                        onPressed: () {

                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Text(
                           'See All',
                            style: GoogleFonts.poppins(
                              color: const Color.fromRGBO(111, 111, 111, 0.935),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              )
                          ),
                        ),
                      ),
                    )
                  ],
               ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(13, 30, 13, 0),
              child: Container(
                width: double.infinity  , height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromARGB(20, 0, 0, 0),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        'Sport News',
                        style: GoogleFonts.poppins(
                          color: Color.fromRGBO(74, 74, 74, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                    ),
                    Container(
                      child: News?
                      Column():
                      Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Text(
                          'There is no recent news',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
              child: ElevatedButton(onPressed: ()async{
                await AuthService().signOut();
              },
              child: Text('sign out'),),
            ),
          ],
        ),
      ),
    );
  }
}


