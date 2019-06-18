import 'package:flutter/material.dart';
import 'package:smart_attendance/pages/screens/teacher/info.dart';
import 'package:smart_attendance/pages/screens/teacher/attendance.dart';
import 'package:smart_attendance/pages/screens/teacher/generate.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:smart_attendance/pages/screens/Home/teacher1.dart';







class Lecture extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LectureState();
  }
}
class LectureState extends State<Lecture> {

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent) {
    print("BACK BUTTON!"); // Do some stuff.
    _showDialog();
    return true;
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Do you want to close attendance of this lecture?"),

          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Yes"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Teacher()),
                );


              },
            ),
          ],
        );
      },
    );
  }



  int _selectedTab = 0;
  final _pageOptions = [
    GenerateScreen(),
    Info(),
    Attendance(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.grey,
          primaryTextTheme: TextTheme(
            title: TextStyle(color: Colors.white),
          )),
      home: Scaffold(

        body: _pageOptions[_selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          onTap: (int index) {
            setState(() {
              _selectedTab = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('QR CODE'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('INFO'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('ATTENDENCE'),
            ),
          ],
        ),
      ),
    );
  }}