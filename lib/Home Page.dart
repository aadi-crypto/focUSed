import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'Calendar Widget.dart';

import 'package:flutter/material.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromRGBO(231, 240, 237, 1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).viewPadding.top),
            SizedBox(height: 20 + 30),
            Text(
              'Tasks for Today',
              style: TextStyle(
                  fontSize: 43,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/EventEditingPage');
              },
              icon: Icon(CupertinoIcons.calendar_badge_plus),
              color: Colors.black,
            ),
            CalendarWidget(),
            Spacer(),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(232, 243, 254, 1),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(-10.5, -10.5),
                            blurRadius: 25),
                        BoxShadow(
                            color: Color.fromRGBO(214, 223, 230, 1),
                            offset: Offset(10.5, 10.5),
                            blurRadius: 25),
                      ],
                      borderRadius: BorderRadius.circular(10)),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/ReviseTimer');
                    },
                    onLongPress: () {
                      Navigator.pushNamed(context, '/Pomodoro');
                    },
                    child: Text(
                      "Start Studying!",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    )),
              ],
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
