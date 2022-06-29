import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? docId;
  String? name;
  String? email;
  String? department;
  String? contactNumber;
  String? enrollment;
  String? year;
  String? role;

  UserModel(
      {this.docId,
      this.name,
      this.email,
      this.department,
      this.contactNumber,
      this.enrollment,
      this.year,
      this.role });

  UserModel.fromMap(DocumentSnapshot data) {
    docId = data.id;
    name = data["name"];
    email = data["email"];
    department = data["department"];
    contactNumber = data["contact"];
    enrollment = data["enrollment"];
    year = data["year"];
    role = data["role"];
  }

}
