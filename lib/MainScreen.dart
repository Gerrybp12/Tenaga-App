import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:newtenaga/Diet/diet_screen.dart';
import 'package:newtenaga/Program/program.dart';
import 'package:newtenaga/Widget/widget.dart';
import 'package:newtenaga/Homepage/home.dart';
import 'Authenticate/setusername.dart';
import 'Community/Community.dart';


// ignore: must_be_immutable
class MainScreen extends StatefulWidget {
  MainScreen({
    required this.user,
    super.key});

  User user;

  @override
  State<MainScreen> createState() => _MainScreenState();
}



  int _index = 0;


  double MyCoin = 154000;
  bool PremiumMember = true;
  bool News = false;
  bool DailyTaskCondition = true;
  bool usernameExist = true;


class _MainScreenState extends State<MainScreen> {

  @override
  void initState() {
    getUsers();
    super.initState();
  }

  getUsers() {
    final userRef = FirebaseFirestore.instance.collection('users_username');
    userRef.doc(widget.user.uid).get().then((DocumentSnapshot doc) {
      if (doc.exists == false) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => setUsername(user: widget.user)));
      }
    });
  }


  late List<Widget> tabs = [
    HomeScreen(user: widget.user),
    ProgramScreen(user: widget.user,),
    DietScreen(),
    CommunityScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          const BackgroundImage(),
          Scaffold(
            backgroundColor: Colors.transparent,
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 41, 41, 41),
                borderRadius: BorderRadius.only(
                )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: GNav(
                      tabBackgroundColor: Colors.white10,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      gap: 10,
                      padding: EdgeInsets.all(10),
                      color: Colors.white38,
                      activeColor: Colors.white,
                      tabs: const [
                        GButton(icon: Icons.home, text: 'Home',),
                        GButton(icon: Icons.assignment, text: 'Program',),
                        GButton(icon: Icons.food_bank, text: 'Diet',),
                        GButton(icon: Icons.people, text: 'Community'),
                    ],
                    selectedIndex: _index,
                    onTabChange: (index) {
                      setState(() {
                        _index = index;
                      });
                    }
                   ),
              ),
            ),
            body: tabs[_index]
          ),
        ],
      );
  }
}