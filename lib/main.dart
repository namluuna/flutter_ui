import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_ui/blocs/auth_bloc.dart';
import 'package:quiz_ui/pages/choose_language.dart';
import 'package:quiz_ui/pages/create_account.dart';
import 'package:quiz_ui/pages/dashboard.dart';
import 'package:quiz_ui/pages/home.dart';
import 'package:quiz_ui/pages/lesson_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthBloc authBloc;
  final Widget child;
  const MyApp({Key key, this.authBloc, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.rubikTextTheme(
            TextTheme(),
          ),
        ),
        initialRoute: "/",
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }
  
  @override
  // ignore: override_on_non_overriding_member
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }

  static MyApp of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType(aspect: MyApp);
  }
}

Route<dynamic> _onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (BuildContext context) {
        return Home();
      });
    case "/create-account":
      return MaterialPageRoute(builder: (BuildContext context) {
        return RegisterPage();
      });
    case "/choose-language":
      return MaterialPageRoute(builder: (BuildContext context) {
        return ChooseLanguage();
      });
    case "/dashboard":
      return MaterialPageRoute(builder: (BuildContext context) {
        return Dashboard();
      });
    case "/lesson-screen":
      return MaterialPageRoute(builder: (BuildContext context) {
        return LessonScreen();
      });
    default:
      return MaterialPageRoute(builder: (BuildContext context) {
        return Home();
      });
  }
}
