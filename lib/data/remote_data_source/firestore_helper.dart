import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newtenaga/Authenticate/auth_service.dart';
import 'package:newtenaga/data/model/model.dart';
import 'package:rxdart/rxdart.dart';

class FirestoreHelper {

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future insertUsername(String username, String userId) async{
      CollectionReference usersUsername = firestore.collection('users_username');
    try {
      await usersUsername.doc(userId).set({
        "username":username,
        "date":DateTime.now(),
        "userId":userId
      });
    } catch (e) {
      print(e);
    }
  }

  Future addWeightLossProgram(String initial, String current, String target, String days, String level, String userId,) async{
    CollectionReference WeightLossCollection = firestore.collection('weightLoss_progress');
    try {
      await WeightLossCollection.doc(userId).set({
      'wlInitial': initial,
      'wlCurrent': current,
      'wlTarget': target,
      'wlDays': days,
      'wlLevel': level,
      'wlDailyTask': false,
      'wlProgress': 0,
      'wlCompleted': false,
      'wlBarProgress': 0
      });
    }catch(e){
      print(e);
    }
  }

  Future addBadmintonProgram(String purpose, String level, String userId) async{
    CollectionReference badmintonCollection = firestore.collection('badminton_progress');
    try {
      await badmintonCollection.doc(userId).set({
        "btPurpose": purpose,
        "btLevel": level,
        "btDailyTask": false,
        "btProgress": 0
      });
    }catch(e){
      print(e);
    }
  }

  Future addBasketBallProgram(String purpose, String level, String userId) async{
    CollectionReference basketBallCollection = firestore.collection('basketBall_progress');
    try {
      await basketBallCollection.doc(userId).set({
        "bbPurpose": purpose,
        "bbLevel": level,
        "bbDailyTask": false,
        "bbProgress": 0
      });
    }catch(e){
      print(e);
    }
  }

  Future addFootBallProgram(String purpose, String level, String userId) async{
    CollectionReference footBallCollection = firestore.collection('footBall_progress');
    try {
      await footBallCollection.doc(userId).set({
        "fbPurpose": purpose,
        "fbLevel": level,
        "fbDailyTask": false,
        "fbProgress": 0
      });
    }catch(e){
      print(e);
    }
  }

  Future addFootBallDailyProgram(String userId, double progress1, double progress2) async{
    CollectionReference fbDailyProgram = firestore.collection('football_daily_program');
    try {
      await fbDailyProgram.doc(userId).set({
        "sport1": 'Curve Shot',
        "value1": 15,
        "sport2": "Header",
        "value2": 10,
        "progress1": progress1,
        "progress2": progress2,
        "complete1": false,
        "complete2": false
      });
    } catch (e) {
      print(e);
    }
  }

  Future addBasketBallDailyProgram(String userId, double progress1, double progress2) async{
    CollectionReference bbDailyProgram = firestore.collection('basketball_daily_program');
    try {
      await bbDailyProgram.doc(userId).set({
        "sport1": 'Dribble',
        "value1": 10,
        "sport2": 'Lay Up',
        "value2": 6,
        "progress1": progress1,
        "progress2": progress2,
        "complete1": false,
        "complete2": false
      });
    } catch (e) {
      print(e);
    }
  }

  Future addWeightLossDailyProgram(String userId, double progress1, double progress2) async{
    CollectionReference bbDailyProgram = firestore.collection('weightLoss_daily_program');
    try {
      await bbDailyProgram.doc(userId).set({
        "sport1": 'Push Up',
        "value1": 10,
        "sport2": 'Sit Up',
        "value2": 6,
        "progress1": progress1,
        "progress2": progress2,
        "complete1": false,
        "complete2": false
      });
    } catch (e) {
      print(e);
    }
  }


  Future addBadmintonDailyProgram(String userId, double progress1, double progress2) async{
    CollectionReference btDailyProgram = firestore.collection('badminton_daily_program');
    try {
      await btDailyProgram.doc(userId).set({
        "sport1": 'Lob',
        "value1": 10,
        "sport2": "Smash",
        "value2": 15,
        "progress1": progress1,
        "progress2": progress2,
        "complete1": false,
        "complete2": false
      });
    } catch (e) {
      print(e);
    }
  }

  Stream<BadmintonProgress> streamBtProgress() {
    return AuthService().userStream.switchMap((user) {
      if (user != null) {
        var ref = firestore.collection('badminton_progress').doc(user.uid);
        return ref.snapshots().map((doc) => BadmintonProgress.fromJson(doc.data()!));
      }else {
        return Stream.fromIterable([BadmintonProgress()]);
      }
    });
  }

  Stream<BasketBallProgress> streamBbProgress() {
    return AuthService().userStream.switchMap((user) {
      if (user != null) {
        var ref = firestore.collection('basketBall_progress').doc(user.uid);
        return ref.snapshots().map((doc) => BasketBallProgress.fromJson(doc.data()!));
      }else {
        return Stream.fromIterable([BasketBallProgress()]);
      }
    });
  }

  Stream<WeightLossProgress> streamWlProgress() {
    return AuthService().userStream.switchMap((user) {
      if (user != null) {
        var ref = firestore.collection('weightLoss_progress').doc(user.uid);
        return ref.snapshots().map((doc) => WeightLossProgress.fromJson(doc.data()!));
      }else {
        return Stream.fromIterable([WeightLossProgress()]);
      }
    });
  }

  Stream<FootBallProgress> streamFbProgress() {
    return AuthService().userStream.switchMap((user) {
      if (user != null) {
        var ref = firestore.collection('footBall_progress').doc(user.uid);
        return ref.snapshots().map((doc) => FootBallProgress.fromJson(doc.data()!));
      }else {
        return Stream.fromIterable([FootBallProgress()]);
      }
    });
  }

  Stream<FootBallDailyProgram> streamFbProgram() {
    return AuthService().userStream.switchMap((user) {
      if (user != null) {
        var ref = firestore.collection('football_daily_program').doc(user.uid);
        return ref.snapshots().map((doc) => FootBallDailyProgram.fromJson(doc.data()!));
      }else {
        return Stream.fromIterable([FootBallDailyProgram()]);
      }
    });
  }

  Stream<BasketDailyProgram> streamBbProgram() {
    return AuthService().userStream.switchMap((user) {
      if (user != null) {
        var ref = firestore.collection('basketball_daily_program').doc(user.uid);
        return ref.snapshots().map((doc) => BasketDailyProgram.fromJson(doc.data()!));
      }else {
        return Stream.fromIterable([BasketDailyProgram()]);
      }
    });
  }

  Stream<BadmintonDailyProgram> streamBtProgram() {
    return AuthService().userStream.switchMap((user) {
      if (user != null) {
        var ref = firestore.collection('badminton_daily_program').doc(user.uid);
        return ref.snapshots().map((doc) => BadmintonDailyProgram.fromJson(doc.data()!));
      }else {
        return Stream.fromIterable([BadmintonDailyProgram()]);
      }
    });
  }

  Stream<WeightLossDailyProgram> streamWlProgram() {
    return AuthService().userStream.switchMap((user) {
      if (user != null) {
        var ref = firestore.collection('weightLoss_daily_program').doc(user.uid);
        return ref.snapshots().map((doc) => WeightLossDailyProgram.fromJson(doc.data()!));
      }else {
        return Stream.fromIterable([WeightLossDailyProgram()]);
      }
    });
  }
}