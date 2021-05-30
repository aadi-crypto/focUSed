import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'Break.dart';
import 'EventEditingPage.dart';
import 'EventProvider.dart';
import 'Home Page.dart';
import 'Pomodoro.dart';
import 'Revise.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          darkTheme: ThemeData.dark(),
          theme: ThemeData.light(),
          routes: <String, WidgetBuilder>{
            '/': (context) => HomePage2(),
            '/Pomodoro': (context) => Pomodoro(),
            '/EventEditingPage': (context) => EventEditingPage(),
            '/ReviseTimer': (context) => ReviseTimer(),
            '/Break': (context) => Break()
          }));
}
