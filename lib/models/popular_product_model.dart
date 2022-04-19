class StudentModel {
  int? _id;
  String? _name;
  String? _city;
  int? _fees;
  String? _createdAt;
  String? _updatedAt;

  late List<StudentModel> _students;
  List<StudentModel> get students => _students;

  StudentModel(
      {int? id,
      String? name,
      String? city,
      int? fees,
      String? createdAt,
      String? updatedAt}){

          if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (city != null) {
      _city = city;
    }
    if (fees != null) {
      _fees = fees;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
  }

  // int? get id => _id;
  // set id(int? id) => _id = id;
  // String? get name => _name;
  // set name(String? name) => _name = name;
  // String? get city => _city;
  // set city(String? city) => _city = city;
  // int? get fees => _fees;
  // set fees(int? fees) => _fees = fees;
  // String? get createdAt => _createdAt;
  // set createdAt(String? createdAt) => _createdAt = createdAt;
  // String? get updatedAt => _updatedAt;
  // set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  StudentModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _city = json['city'];
    _fees = json['fees'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    // }

    // Map<String, dynamic> toJson() {
    //   final Map<String, dynamic> data = new Map<String, dynamic>();
    //   data['id'] = this._id;
    //   data['name'] = this._name;
    //   data['city'] = this._city;
    //   data['fees'] = this._fees;
    //   data['created_at'] = this._createdAt;
    //   data['updated_at'] = this._updatedAt;
    //   return data;
    // }
  }
}
