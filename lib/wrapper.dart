import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newtenaga/Authenticate/setusername.dart';
import 'package:newtenaga/Authenticate/signIn.dart';
import 'package:newtenaga/Homepage/home.dart';
import 'package:newtenaga/Loading/loadingScreen.dart';
import 'package:newtenaga/MainScreen.dart';
import 'package:newtenaga/ProgramPage/Basketball.dart';
import 'package:newtenaga/ProgramPage/WeightLoss.dart';
import 'package:newtenaga/Video/videoplayer.dart';

import 'Authenticate/signup.dart';

class WrapperScreen extends StatelessWidget {
  const WrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context,AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        }

        if (snapshot.hasData){
          return ScreenUtilInit(
            designSize: Size(411.42857142857144, 890.2857142857143),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: MainScreen(user: snapshot.data),
            ),
          );
        }
        else {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SignIn(),
        );
        }
      }
    );
  }
}