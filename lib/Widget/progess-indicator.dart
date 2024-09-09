import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChallengeProgress extends StatefulWidget {
  ChallengeProgress(
      {required this.user,
      required this.sport,
      required this.value,
      required this.progress,
      required this.complete,
      super.key});

  User user;
  String sport;
  int value;
  double progress;
  bool complete;

  @override
  State<ChallengeProgress> createState() => _ChallengeProgressState();
}
class _ChallengeProgressState extends State<ChallengeProgress> {
  @override
  Widget build(BuildContext context) {
    double progresstext = widget.progress*10;
    int progressint = progresstext.toInt();
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${widget.sport} $progressint/${widget.value}',
                      style: const TextStyle(fontSize: 15)  ,
                    ),
                    const Text('10 Kilometer'),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 77, 209, 82),
                        shape: BoxShape.circle,
                      ),
                      child: widget.complete
                          ? const Icon(
                              Icons.check,
                              size: 20,
                              color: Colors.white,
                            )
                          : IconButton(
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 20,
                              ),
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                setState(() {
                                  widget.progress = widget.progress + 1/widget.value + 0.0000001;
                                  if (widget.value - progressint <= 1) {
                                    setState(() {
                                      widget.complete = true;
                                    });
                                  }
                                });
                              }),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                LinearProgressIndicator(
                  value: widget.progress,
                ),
              ],
            );

        }
  }

