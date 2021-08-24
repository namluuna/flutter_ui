
import 'package:firebase_database/firebase_database.dart';

class InstructorModel {
  String name;
  String image;
  String occupation;
  DatabaseReference _id; 

  InstructorModel({this.name, this.image, this.occupation});

  void display(FirebaseDatabase something){
  }
  void setId(DatabaseReference id){
    this._id = id ; 
  }

  Map<String, dynamic> toJson(){
    return{
      'name': this.name,
      'image': this.image,
      'occupation': this.occupation
    };
  }

}
