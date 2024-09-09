import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newtenaga/data/remote_data_source/firestore_helper.dart';

// ignore: must_be_immutable
class WeightLossIndicator extends StatefulWidget {
  WeightLossIndicator({required this.user, super.key});

  User user;

  @override
  State<WeightLossIndicator> createState() => _WeightLossIndicatorState();
}

class _WeightLossIndicatorState extends State<WeightLossIndicator> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirestoreHelper().streamWlProgress(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            var wlProgress = snapshot.data!;
            double initialWeight = double.parse(wlProgress.wlInitial);
            double finalWeight = double.parse(wlProgress.wlTarget);
            int finalWeightInt = int.parse(wlProgress.wlTarget);
            int currentWeight = int.parse(wlProgress.wlCurrent);
            double diff = initialWeight - finalWeight;
            int value = int.parse(wlProgress.wlCurrent);
            int mainProgressAdd = (1 / diff * 100).toInt();
            int totalTask = (finalWeight).toInt();
            if (finalWeightInt == currentWeight) {
              FirebaseFirestore.instance
                  .collection('weightLoss_progress')
                  .doc(widget.user.uid)
                  .update({'wlCompleted': true});
              FirebaseFirestore.instance
                  .collection('weightLoss_progress')
                  .doc(widget.user.uid)
                  .update({'wlProgress': 100});
            }
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '$value kg/$totalTask kg',
                      style: TextStyle(fontSize: 15),
                    ),
                    Row(
                      children: [
                        wlProgress.wlCompleted
                            ? Container()
                            : Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      setState(() {
                                        if (wlProgress.wlInitial != wlProgress.wlCurrent) {
                                          FirebaseFirestore.instance
                                              .collection('weightLoss_progress')
                                              .doc(widget.user.uid)
                                              .update({
                                            'wlBarProgress':
                                                wlProgress.wlBarProgress -
                                                    1 / diff
                                          });
                                          FirebaseFirestore.instance
                                              .collection('weightLoss_progress')
                                              .doc(widget.user.uid)
                                              .update({
                                            'wlCurrent':
                                                (currentWeight + 1).toString()
                                          });
                                          FirebaseFirestore.instance
                                              .collection('weightLoss_progress')
                                              .doc(widget.user.uid)
                                              .update({
                                            'wlProgress':
                                                wlProgress.wlProgress -
                                                    mainProgressAdd
                                          });
                                        }
                                      });
                                    }),
                              ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 77, 209, 82),
                            shape: BoxShape.circle,
                          ),
                          child: wlProgress.wlCompleted
                              ? Icon(
                                  Icons.check,
                                  size: 20,
                                  color: Colors.white,
                                )
                              : IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    setState(() {
                                      FirebaseFirestore.instance
                                          .collection('weightLoss_progress')
                                          .doc(widget.user.uid)
                                          .update({
                                        'wlBarProgress':
                                            wlProgress.wlBarProgress + 1 / diff
                                      });
                                      FirebaseFirestore.instance
                                          .collection('weightLoss_progress')
                                          .doc(widget.user.uid)
                                          .update({
                                        'wlCurrent':
                                            (currentWeight - 1).toString()
                                      });
                                      FirebaseFirestore.instance
                                          .collection('weightLoss_progress')
                                          .doc(widget.user.uid)
                                          .update({
                                        'wlProgress': wlProgress.wlProgress +
                                            mainProgressAdd
                                      });
                                    });
                                  }),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                LinearProgressIndicator(
                  value: wlProgress.wlBarProgress,
                )
              ],
            );
          } else {
            return SizedBox();
          }
        });
  }
}
