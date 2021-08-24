
import 'package:firebase_database/firebase_database.dart';


class Account {
  String first_name;
  String last_name;
  String email;
  String password;

  DatabaseReference _id;


  Account({this.first_name, this.last_name, this.email, this.password});

  void setId(DatabaseReference id) {
    this._id = id;
  } 



  Map<String, dynamic> toJson() {
    return {
      'first name': this.first_name,
      'last name': this.last_name,
      'email': this.email,
      'password': password
    };
  }

  Account creatAccount(record) {
    Map<String, dynamic> attributes = {
      'first name': '',
      'last name': '',
      'email': '',
      'password': ''
    };
  }
}
