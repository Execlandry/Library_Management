import 'package:cloud_firestore/cloud_firestore.dart';

class BookModel {
  String? docId;
  String? accessionNo;
  String? title;
  String? author;
  String? place;
  String? edition;
  String? year;
  String? pages;
  String? source;
  String? billNo;
  String? billDate;
  String? cost;
  String? callNo;
  String? stockedAt;

  BookModel(
      {this.docId,
      this.accessionNo,
      this.title,
      this.author,
      this.place,
      this.edition,
      this.year,
      this.pages,
      this.source,
      this.billNo,
      this.billDate,
      this.cost,
      this.callNo,
      this.stockedAt});

  BookModel.fromMap(DocumentSnapshot data) {
    docId = data.id;
    accessionNo = data["accessionNo"];
    title = data["title"];
    author = data["author"];
    place = data["place"];
    edition = data["edition"];
    year = data["year"];
    pages = data["pages"];
    source = data["source"];
    billNo = data["billNo"];
    billDate = data["billDate"];
    cost = data["cost"];
    callNo = data["callNo"];
    stockedAt = data["stockedAt"];
  }
}
