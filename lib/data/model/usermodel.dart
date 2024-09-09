
import 'package:cloud_firestore/cloud_firestore.dart';

class usernameModel {
  String id;
  String username;
  Timestamp date;
  String userId;

  usernameModel({
    required this.id,
    required this.username,
    required this.date,
    required this.userId
  });

  factory usernameModel.fromJson(DocumentSnapshot snapshot){
    return usernameModel(
    id: snapshot.id,
    username: snapshot['username'],
    date: snapshot['date'],
    userId: snapshot['userId']
    );
  }
}