import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:quiz_ui/constants.dart';
import 'package:quiz_ui/pages/dashboard.dart';
import 'package:quiz_ui/pages/makequiz_page.dart';
import 'package:quiz_ui/pages/profile.dart';
import 'package:quiz_ui/pages/user_quiz.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: onTabTapped,
      unselectedIconTheme: IconThemeData(
        color: Color.fromRGBO(202, 205, 219, 1),
      ),
      selectedIconTheme: IconThemeData(
        color: Constants.primaryColor,
      ),
      items: [
        BottomNavigationBarItem(
          label: "",
          icon: Icon(FlutterIcons.home_fea),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Icon(
            FlutterIcons.calendar_fea,
          ),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Icon(
            FlutterIcons.edit_fea,
          ),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Icon(
            FlutterIcons.user_fea,
          ),
        ),
      ],
    );
    
  }
  void onTabTapped(int value) {
    switch (value) {
      case 0:{
        Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
        break;
      }  
      case 1:{
        Navigator.push(context, MaterialPageRoute(builder: (context) => UserQuiz()));
        break;
      }    
      case 2:{
        Navigator.push(context, MaterialPageRoute(builder: (context) => MakeQuiz()));
        break;
      } 
      case 3:{
        Navigator.push(context, MaterialPageRoute(builder: (context) =>ProfilePage() ));
        break;
      } 
      default:
    }
  }
}
