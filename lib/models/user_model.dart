import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? docId;
  String? name;
  String? email;
  String? department;
  
  UserModel({this.docId,this.name,this.email,this.department});

  UserModel.fromMap(DocumentSnapshot data){
    docId = data.id;
    name = data["name"];
    email = data["email"]; 
    department = data["department"];
  }
}