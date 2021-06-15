
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String name;
  final String url;

  User({
    this.id,
    this.name,
    this.url,
    
  });

  factory User.fromDocument(DocumentSnapshot doc) {
    return User(
      id: doc.id,
      url: doc['photoUrl'],
      name: doc['nickname'],
    );
  }
}