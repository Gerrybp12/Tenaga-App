import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newtenaga/data/remote_data_source/firestore_helper.dart';

// ignore: must_be_immutable
class WlIndicator extends StatefulWidget {
  WlIndicator({required this.user, super.key});

  User user;

  @override
  State<WlIndicator> createState() => _WlIndicatorState();
}

class _WlIndicatorState extends State<WlIndicator> {
  @override
  Widget build(BuildContext context) {
    bool isTapped = false;
    return StreamBuilder(
        stream: FirestoreHelper().streamWlProgram(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            var wlProgram = snapshot.data!;
            int value1 = (wlProgram.progress1 * wlProgram.value1).toInt();
            int totalTask1 = wlProgram.value1.toInt();
            int value2 = (wlProgram.progress2 * wlProgram.value2).toInt();
            int totalTask2 = wlProgram.value2.toInt();
            if (wlProgram.complete1 == true && wlProgram.complete2 == true) {
              FirebaseFirestore.instance
                  .collection('weightLoss_progress')
                  .doc(widget.user.uid)
                  .update({'wlDailyTask': true});
            }
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${wlProgram.sport1} $value1/$totalTask1',
                      style: const TextStyle(fontSize: 15),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 77, 209, 82),
                        shape: BoxShape.circle,
                      ),
                      child: wlProgram.complete1
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
                                if (!isTapped){
                                  isTapped = true;
                                  FirebaseFirestore.instance
                                      .collection('weightLoss_daily_program')
                                      .doc(widget.user.uid)
                                      .update({
                                    'progress1': wlProgram.progress1 +
                                        1 / wlProgram.value1 +
                                        0.00000001,
                                  });
                                    FirebaseFirestore.instance
                                      .collection('weightLoss_daily_program')
                                      .doc(widget.user.uid)
                                      .update(
                                          {'complete2': wlProgram.complete2});
                                if (totalTask1 - value1 <= 1) {
                                  FirebaseFirestore.instance
                                      .collection('weightLoss_daily_program')
                                      .doc(widget.user.uid)
                                      .update({
                                    'complete1': true,
                                    'complete2': wlProgram.complete2
                                  });
                                } else {
                                          if (totalTask2 - value2 <= 1) {
                                  FirebaseFirestore.instance
                                      .collection('weightLoss_daily_program')
                                      .doc(widget.user.uid)
                                      .update({
                                    'complete2': true,
                                    'complete1': wlProgram.complete1
                                  });}
                                }
                                  await Future.delayed(const Duration(milliseconds: 10));
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
                  value: wlProgram.progress1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${wlProgram.sport2} $value2/$totalTask2',
                      style: const TextStyle(fontSize: 15),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 77, 209, 82),
                        shape: BoxShape.circle,
                      ),
                      child: wlProgram.complete2
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
                              onPressed: () async{
                                if (!isTapped) {
                                  isTapped = true;
                                  FirebaseFirestore.instance
                                      .collection('weightLoss_daily_program')
                                      .doc(widget.user.uid)
                                      .update({
                                    'progress2': wlProgram.progress2 +
                                        1 / wlProgram.value2 +
                                        0.00000001,
                                  });
                                        FirebaseFirestore.instance
                                      .collection('weightLoss_daily_program')
                                      .doc(widget.user.uid)
                                      .update(
                                          {'complete1': wlProgram.complete1});
                                if (totalTask2 - value2 <= 1) {
                                  FirebaseFirestore.instance
                                      .collection('weightLoss_daily_program')
                                      .doc(widget.user.uid)
                                      .update({
                                    'complete2': true,
                                    'complete1': wlProgram.complete1
                                  });
                                } else {

                                          if (totalTask1 - value1 <= 1) {
                                  FirebaseFirestore.instance
                                      .collection('weightLoss_daily_program')
                                      .doc(widget.user.uid)
                                      .update({
                                    'complete1': true,
                                    'complete2': wlProgram.complete2
                                  });}
                                }
                                await Future.delayed(const Duration(milliseconds: 10));
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
                  value: wlProgram.progress2,
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
