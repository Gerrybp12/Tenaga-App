// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:newtenaga/MainScreen.dart';

class DietScreen extends StatefulWidget {
  const DietScreen({super.key});

  @override
  State<DietScreen> createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 300),
                child: Text(
                  'Coming Soon',
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(109, 0, 0, 0)
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}