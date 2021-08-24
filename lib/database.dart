import 'package:firebase_database/firebase_database.dart';
import 'package:quiz_ui/models/account.dart';



final databaseReference = FirebaseDatabase.instance.reference();

DatabaseReference saveAccount(Account account, ){
  var id = databaseReference.child('accounts/').push(); 
  id.set(account.toJson()); 
  return id; 
}