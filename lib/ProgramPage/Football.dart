import 'dart:math';
import 'dart:ui';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newtenaga/Widget/indicator/fb.dart';
import 'package:newtenaga/Widget/progess-indicator.dart';
import 'package:newtenaga/data/remote_data_source/firestore_helper.dart';

// ignore: must_be_immutable
class Football extends StatefulWidget {
  Football({
    required this.user,
    super.key});

  User user;

  @override
  State<Football> createState() => _FootballState();
}
  bool beginnerButtonTap = false;
  bool intermediateButtonTap = false;
  bool competitiveButtonTap = false;
  int tabsIndex = 0;

class _FootballState extends State<Football> {
  bool tablet = true;
  double paddingTop = 400;
  double heightBackground = 500;
  double clipRPadding = 9;
  late List<Widget> tabs = [
    beginnerList(),
    intermediateList(),
    competitiveList(),
    ];
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.sizeOf(context);
    if (deviceSize.width <= 500) {
      setState(() {
        tablet = false;
        paddingTop = 330;
        heightBackground = 500;
        clipRPadding = 6;
      });

    }print(tablet);
    return StreamBuilder(
      stream: FirestoreHelper().streamFbProgress(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(),);
        }
        if (snapshot.hasError) {
          return const Center(child: Text('some error'),);
        }
        if (snapshot.hasData) {
          var footBall = snapshot.data!;
          int progress = footBall.fbProgress;
          double progressBar = progress/100;
          return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: heightBackground,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(4, 42, 3, 1),
                  Color.fromRGBO(1, 130, 3, 1)
                ],
                transform: GradientRotation(pi/2),
              ),
            ),
          ),
          tablet?
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 550, left: 10),
            child: Container(
              height: 300,
              width: 300,
              child: CircularProgressIndicator(
                value: progressBar,
                strokeWidth: 25,
                valueColor: AlwaysStoppedAnimation(const Color.fromARGB(255, 103, 255, 108)),
              ),
            ),
          ),
        )
        :Positioned(
            top: MediaQuery.sizeOf(context).height/4.2,
            left: MediaQuery.sizeOf(context).width/8.3,
            child: Container(
              height: 300,
              width: 300,
              child: CircularProgressIndicator(
                value: progressBar,
                strokeWidth: 25,
                valueColor: AlwaysStoppedAnimation(const Color.fromARGB(255, 103, 255, 108)),
              ),
            ),
          ),
           SafeArea(
            child: Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                padding: const EdgeInsets.only(top: 260),
                child: Text(
                  '$progress%',
                  style: GoogleFonts.poppins(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 103, 255, 108)
                    )
                  ),
                ),
              ],
            ),
          ),
        ),
          Positioned(
            top: MediaQuery.sizeOf(context).height/clipRPadding,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15,sigmaY: 15),
                child: Container(
                  height: 500,
                  width: MediaQuery.sizeOf(context).width,
                ),
              ),
            )
          ),
          tablet?
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 430,),
              child: Container(
                height: 360,
                width: 380,
                child: const Image(image: AssetImage(
                  'assets/football.png',),
                  opacity: AlwaysStoppedAnimation(.6),
                  ),
              ),
            ),
          )
          :Positioned(
            top: MediaQuery.sizeOf(context).height/4.2,
            child: Container(
              height: 360,
              width: 380,
              child: const Image(image: AssetImage(
                'assets/football.png',),
                opacity: AlwaysStoppedAnimation(.6),
                ),
            ),
          ),
          SafeArea(
            child: Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                padding: const EdgeInsets.only(top: 260),
                child: Text(
                  '$progress%',
                  style: GoogleFonts.poppins(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 103, 255, 108)
                    )
                  ),
                ),
              ],
            ),
          ),
        ),
        tablet?
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 550, left: 10),
            child: Container(
              height: 300,
              width: 300,
              child: CircularProgressIndicator(
                value: progressBar,
                strokeWidth: 25,
                valueColor: AlwaysStoppedAnimation(const Color.fromARGB(255, 103, 255, 108)),
              ),
            ),
          ),
        )
        :Positioned(
            top: MediaQuery.sizeOf(context).height/4.2,
            left: MediaQuery.sizeOf(context).width/8.3,
            child: Container(
              height: 300,
              width: 300,
              child: CircularProgressIndicator(
                value: progressBar,
                strokeWidth: 25,
                valueColor: AlwaysStoppedAnimation(const Color.fromARGB(255, 103, 255, 108)),
              ),
            ),
          ),
          SafeArea(
            child: Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Text(
                  'Football',
                  style: GoogleFonts.poppins(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                    )
                  ),
                ),
              ],
            ),
          ),
        ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          height: 40,
                          width: 40,
                          child: IconButton(
                            icon: Icon(Icons.arrow_back),
                            padding: EdgeInsets.zero,
                            color: Color.fromARGB(255, 2, 98, 12),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 10, 0),
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color:  Color.fromARGB(121, 255, 15, 15),
                          ),
                          height: 40,
                          width: 40,
                          child: IconButton(
                            icon: Icon(Icons.delete),
                            padding: EdgeInsets.zero,
                            color: Color.fromARGB(173, 0, 0, 0),
                            onPressed: () {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.warning,
                                animType: AnimType.topSlide,
                                showCloseIcon: true,
                                title: "Are You Sure?",
                                desc: "Your about to delete a program",
                                btnCancelOnPress: (){},
                                btnOkOnPress: () {
                                  FirebaseFirestore.instance.collection('footBall_progress').doc(widget.user.uid).delete();
                                  FirebaseFirestore.instance.collection('football_daily_program').doc(widget.user.uid).delete();
                                  Navigator.pop(context);
                                },
                                ).show();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  ),
                  Padding(
                  padding: EdgeInsets.fromLTRB(0, paddingTop, 0, 0),
                  child: Container(
                  height: 1300,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 40,),
                          Container(
                            height: 10,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 81, 81, 81),
                              borderRadius: BorderRadius.circular(20)
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Programs',
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Container(
                              width: 360,
                              height: 200,
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Daily Program',
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  FbIndicator(user: widget.user, mainProgress: footBall.fbProgress,)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Challenge',
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Container(
                              width: 360,
                              height: 200,
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Daily Challenge',
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ChallengeProgress(
                                      user: widget.user, sport: 'jogging', value: 10, progress: 0, complete: false),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Videos',
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                beginnerButtonTap = true;
                                intermediateButtonTap = false;
                                competitiveButtonTap = false;
                                tabsIndex = 0;
                              });
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width / 3,
                              height: 30,
                              color: beginnerButtonTap
                                  ? Color.fromARGB(15, 0, 0, 0)
                                  : Color.fromARGB(44, 0, 0, 0),
                              child: Center(
                                child: Text(
                                  'Beginner',
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: beginnerButtonTap
                                          ? const Color.fromARGB(
                                              175, 0, 0, 0)
                                          : const Color.fromARGB(
                                              130, 0, 0, 0)),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                beginnerButtonTap = false;
                                intermediateButtonTap = true;
                                competitiveButtonTap = false;
                                tabsIndex = 1;
                              });
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width / 3,
                              height: 30,
                              color: intermediateButtonTap
                                  ? Color.fromARGB(15, 0, 0, 0)
                                  : Color.fromARGB(44, 0, 0, 0),
                              child: Center(
                                child: Text(
                                  'Intermediate',
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: intermediateButtonTap
                                          ? const Color.fromARGB(
                                              175, 0, 0, 0)
                                          : const Color.fromARGB(
                                              130, 0, 0, 0)),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                beginnerButtonTap = false;
                                intermediateButtonTap = false;
                                competitiveButtonTap = true;
                                tabsIndex = 2;
                              });
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width / 3,
                              height: 30,
                              color: competitiveButtonTap
                                  ? Color.fromARGB(15, 0, 0, 0)
                                  : Color.fromARGB(44, 0, 0, 0),
                              child: Center(
                                child: Text(
                                  'Competitive',
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: competitiveButtonTap
                                          ? const Color.fromARGB(
                                              175, 0, 0, 0)
                                          : const Color.fromARGB(
                                              130, 0, 0, 0)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 230,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.grey,
                            Colors.white
                          ], transform: GradientRotation(pi/2))
                        ),
                        child: Center(
                          child: Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: 200,
                            child: tabs[tabsIndex],
                          ),
                        ),
                      ),
                      const SizedBox(height: 50,),
                      Text(
                        'Description',
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  ),
                  ),
                    ],
                  ),
                ],
              ),

            ),
          )
        ],
      ),
    );
        }
        else {
          return Center(child: Text('Some error'),);
        }
      }
      );


  }
  ListView beginnerList() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        const SizedBox(
          width: 30,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(40))),
            width: 330,
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(40))),
            width: 330,
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(40))),
            width: 330,
          ),
        ),
        const SizedBox(
          width: 30,
        ),
      ],
    );
  }

  ListView intermediateList() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        const SizedBox(
          width: 30,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(40))),
            width: 330,
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(40))),
            width: 330,
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(40))),
            width: 330,
          ),
        ),
        const SizedBox(
          width: 30,
        ),
      ],
    );
  }

  ListView competitiveList() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        const SizedBox(
          width: 30,
        ),
        InkWell(
          onTap: () {
          },
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.all(Radius.circular(40))),
            width: 330,
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.all(Radius.circular(40))),
            width: 330,
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.all(Radius.circular(40))),
            width: 330,
          ),
        ),
        const SizedBox(
          width: 30,
        ),
      ],
    );
  }
}


