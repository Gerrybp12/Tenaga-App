// ignore_for_file: unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:newtenaga/Authenticate/signIn.dart';
import 'package:newtenaga/Authenticate/signup.dart';
import 'package:newtenaga/Homepage/home.dart';
import 'package:newtenaga/MainScreen.dart';
import 'package:newtenaga/Video/videoplayer.dart';
import 'package:newtenaga/wrapper.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
  [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

/// We are using a StatefulWidget such that we only create the [Future] once,
/// no matter how many times our widget rebuild.
/// If we used a [StatelessWidget], in the event where [App] is rebuilt, that
/// would re-initialize FlutterFire and make our application re-enter loading state,
/// which is undesired.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.sizeOf(context).height);
    return const WrapperScreen();
    // return const CupertinoApp(
    //   debugShowCheckedModeBanner: false,
    //   theme: CupertinoThemeData(
    //     brightness: Brightness.light,
    //   ),
    //   title: 'Appinio Video Player Demo',
    //   home: WrapperScreen(),
    // );
  }
}
