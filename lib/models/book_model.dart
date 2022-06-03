import 'package:cloud_firestore/cloud_firestore.dart';

class BookModel {
  String? docId;
  String? accessionNo;
  String? title;
  String? edition;
  String? year;
  String? pages;
  String? source;
  String? billNo;
  String? billDate;
  int? cost;
  String? callNo;

  BookModel(
      {this.docId,
      this.accessionNo,
      this.title,
      this.edition,
      this.year,
      this.pages,
      this.source,
      this.billNo,
      this.billDate,
      this.cost,
      this.callNo});

  BookModel.fromMap(DocumentSnapshot data) {
    docId = data.id;
    accessionNo = data["accessionNo"];
    title = data["title"];
    edition = data["edition"];
    year = data["year"];
    pages = data["pages"];
    source = data["source"];
    billNo = data["billNo"];
    billDate = data["billDate"];
    cost = data["cost"];
    callNo = data["callNo"];
  }
}
