import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_ui/constants.dart';
import 'package:quiz_ui/pages/login_page.dart';
import 'package:quiz_ui/pages/makequiz_page.dart';
import 'package:quiz_ui/pages/profile.dart';
import 'package:quiz_ui/widgets/border_text_field.dart';
import 'package:quiz_ui/widgets/course_card.dart';
import 'package:quiz_ui/widgets/instructor_card.dart';
import 'package:quiz_ui/widgets/topics_list.dart';
import 'package:quiz_ui/widgets/user_menu_bar.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
   int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: onTabTapped, // new
       currentIndex: _currentIndex,
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
      ), 
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 30.0,
                ),
                UserMenuBar(),
                SizedBox(
                  height: 15.0,
                ),
                BorderTextField(
                  prefixIcon: Icon(
                    FlutterIcons.search_fea,
                    color: Colors.grey,
                  ),
                  borderRadius: 50.0,
                  hintText: "Search...",
                ),
                SizedBox(
                  height: 30.0,
                ),
                TopicsList(),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Courses",
                      style: TextStyle(
                        fontSize: 21.0,
                        color: Constants.primaryTextColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "View all",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Constants.captionTextColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.0,
                ),
                Container(
                  height: 22.0,
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 10.0,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: Constants.courseLevels.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(
                        Constants.courseLevels[index],
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight:
                              index == 0 ? FontWeight.w600 : FontWeight.w400,
                          color: index == 0
                              ? Constants.primaryColor
                              : Constants.captionTextColor,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  height: ScreenUtil().setHeight(167.0),
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 10.0,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: Constants.courses.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CourseCard(
                        course: Constants.courses[index],
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "Instructors",
                  style: TextStyle(
                    fontSize: 21.0,
                    color: Constants.primaryTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  height: ScreenUtil().setHeight(140.0),
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 10.0,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: Constants.instructors.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InstructorCard(
                        instructor: Constants.instructors[index],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onTabTapped(int value) {
    switch (value) {
      case 0:{
        Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
        break;
      }  
      case 1:{
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
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
