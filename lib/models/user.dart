import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const NAME = "name";
  static const EMAIL = "email";

    late String name;
    late String email;

  UserModel({required this.name,required this.email});

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    name = (snapshot.data()as dynamic)[NAME];
    email = (snapshot.data()as dynamic)[EMAIL];
  }
}