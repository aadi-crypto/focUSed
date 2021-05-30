import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class Pomodoro extends StatefulWidget {
  @override
  _PomodoroState createState() => _PomodoroState();
}

class _PomodoroState extends State<Pomodoro> {
  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = LinearGradient(
      colors: <Color>[
        Color.fromRGBO(255, 191, 149, 1),
        Color.fromRGBO(255, 61, 80, 1)
      ],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
    return Material(
      color: Color.fromRGBO(231, 240, 237, 1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).viewPadding.top),
            SizedBox(height: 20 + 30 + 80),
            Text('Focus',
                style: TextStyle(
                    fontSize: 78,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()..shader = linearGradient)),
            Stack(alignment: Alignment.center, children: <Widget>[
              Container(
                width: 317,
                height: 317,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
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
                    ]),
              ),
              FocusTimer(),
              Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(232, 243, 254, 1),
                ),
              ),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(214, 223, 230, 1),
                          offset: Offset(10.5, 10.5),
                          blurRadius: 15),
                    ]),
              ),
            ]),
            Spacer()
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class FocusTimer extends StatelessWidget {
  FocusTimer({
    Key? key,
  }) : super(key: key);
  CountDownController _focusController = CountDownController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          height: 280,
          width: 280,
        ),
        CircularCountDownTimer(
          duration: 10,
          initialDuration: 0,
          controller: _focusController,
          width: 260,
          height: 260,
          ringGradient: null,
          ringColor: Color.fromRGBO(244, 197, 203, 1), //color of background
          fillColor: Color.fromRGBO(230, 96, 119, 1), //color of progress bar
          backgroundGradient: SweepGradient(colors: [
            Color.fromRGBO(250, 134, 157, 1),
            Color.fromRGBO(255, 242, 154, 1),
            Colors.red,
            Color.fromRGBO(250, 134, 157, 1)
          ]),
          strokeWidth: 20.0,
          strokeCap: StrokeCap.round,
          isReverse: false,
          isTimerTextShown: false,
          autoStart: true,
          onStart: () {
            print('Countdown Started');
          },
          onComplete: () {
            print('Countdown Ended');
            CupertinoAlertDialog(
              title: new Text("Session ended"),
              content: new Text(
                  "Would like to go ahead and continue after a break or end the session?"),
              actions: <Widget>[
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text("Another session!"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/ReviseTimer');
                  },
                ),
                CupertinoDialogAction(
                  child: Text("I have finished my task"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                )
              ],
            );
          },
        )
      ],
    );
  }
}
