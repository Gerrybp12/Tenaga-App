import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newtenaga/data/remote_data_source/firestore_helper.dart';

// ignore: must_be_immutable
class FbIndicator extends StatefulWidget {
  FbIndicator({required this.user, required this.mainProgress, super.key});

  User user;
  int mainProgress;

  @override
  State<FbIndicator> createState() => _FbIndicatorState();
}

class _FbIndicatorState extends State<FbIndicator> {
  @override
  Widget build(BuildContext context) {
    bool isTapped = false;
    return StreamBuilder(
        stream: FirestoreHelper().streamFbProgram(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            var fbProgram = snapshot.data!;
            int value1 = (fbProgram.progress1 * fbProgram.value1).toInt();
            int totalTask1 = fbProgram.value1.toInt();
            int value2 = (fbProgram.progress2 * fbProgram.value2).toInt();
            int totalTask2 = fbProgram.value2.toInt();
            if (fbProgram.complete1 == true && fbProgram.complete2 == true) {
              FirebaseFirestore.instance
                  .collection('footBall_progress')
                  .doc(widget.user.uid)
                  .update({'fbDailyTask': true});
            }
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${fbProgram.sport1} $value1/$totalTask1',
                      style: const TextStyle(fontSize: 15),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 77, 209, 82),
                        shape: BoxShape.circle,
                      ),
                      child: fbProgram.complete1
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
                              onPressed: () async {
                                if (!isTapped) {
                                  isTapped = true;
                                  FirebaseFirestore.instance
                                      .collection('football_daily_program')
                                      .doc(widget.user.uid)
                                      .update({
                                    'progress1': fbProgram.progress1 +
                                        1 / fbProgram.value1 +
                                        0.00000001,
                                  });
                                  FirebaseFirestore.instance
                                      .collection('football_daily_program')
                                      .doc(widget.user.uid)
                                      .update(
                                          {'complete2': fbProgram.complete2});
                                  if (totalTask1 - value1 <= 1) {
                                    FirebaseFirestore.instance
                                        .collection('football_daily_program')
                                        .doc(widget.user.uid)
                                        .update({
                                      'complete1': true,
                                      'complete2': fbProgram.complete2
                                    });
                                    FirebaseFirestore.instance
                                        .collection('footBall_progress')
                                        .doc(widget.user.uid)
                                        .update({
                                      'fbProgress': widget.mainProgress + 2
                                    });
                                  } else {
                                    if (totalTask2 - value2 <= 1) {
                                      FirebaseFirestore.instance
                                          .collection('football_daily_program')
                                          .doc(widget.user.uid)
                                          .update({
                                        'complete2': true,
                                        'complete1': fbProgram.complete1
                                      });
                                    }
                                  }
                                  await Future.delayed(
                                      const Duration(milliseconds: 10));
                                  isTapped = false;
                                }
                              }),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                LinearProgressIndicator(
                  value: fbProgram.progress1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${fbProgram.sport2} $value2/$totalTask2',
                      style: const TextStyle(fontSize: 15),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 77, 209, 82),
                        shape: BoxShape.circle,
                      ),
                      child: fbProgram.complete2
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
                              onPressed: () async {
                                if (!isTapped) {
                                  isTapped = true;
                                  FirebaseFirestore.instance
                                      .collection('football_daily_program')
                                      .doc(widget.user.uid)
                                      .update({
                                    'progress2': fbProgram.progress2 +
                                        1 / fbProgram.value2 +
                                        0.00000001,
                                  });
                                  FirebaseFirestore.instance
                                      .collection('football_daily_program')
                                      .doc(widget.user.uid)
                                      .update(
                                          {'complete1': fbProgram.complete1});
                                  if (totalTask2 - value2 <= 1) {
                                    FirebaseFirestore.instance
                                        .collection('football_daily_program')
                                        .doc(widget.user.uid)
                                        .update({
                                      'complete2': true,
                                      'complete1': fbProgram.complete1
                                    });

                                    FirebaseFirestore.instance
                                        .collection('footBall_progress')
                                        .doc(widget.user.uid)
                                        .update({
                                      'fbProgress': widget.mainProgress + 2
                                    });
                                  } else {
                                    if (totalTask1 - value1 <= 1) {
                                      FirebaseFirestore.instance
                                          .collection('football_daily_program')
                                          .doc(widget.user.uid)
                                          .update({
                                        'complete1': true,
                                        'complete2': fbProgram.complete2
                                      });
                                    }
                                  }
                                  await Future.delayed(
                                      const Duration(milliseconds: 10));
                                  isTapped = false;
                                }
                              }),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                LinearProgressIndicator(
                  value: fbProgram.progress2,
                ),
              ],
            );
          } else {
            return const Center(
              child: Text('some error'),
            );
          }
        });
  }
}
