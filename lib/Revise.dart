import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class ReviseTimer extends StatefulWidget {
  @override
  _ReviseTimerState createState() => _ReviseTimerState();
}

class _ReviseTimerState extends State<ReviseTimer> {
  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = LinearGradient(
      colors: <Color>[
        Color.fromRGBO(0, 200, 156, 1),
        Color.fromRGBO(0, 200, 156, 1),
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
            SizedBox(height: 20 + 30),
            SizedBox(height: 80),
            Text('Revise',
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
              Revise(),
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

class Revise extends StatelessWidget {
  const Revise({
    Key? key,
  }) : super(key: key);

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
          duration: 5,
          initialDuration: 0,
          controller: CountDownController(),
          width: 260,
          height: 260,
          ringGradient: null,
          ringColor: Color.fromRGBO(167, 228, 0, 1), //color of background
          fillColor: Colors.green, //color of progress bar
          backgroundGradient: SweepGradient(colors: [
            Color.fromRGBO(0, 200, 156, 1),
            Color.fromRGBO(0, 135, 52, 1),
            Color.fromRGBO(141, 226, 0, 1),
            Color.fromRGBO(0, 200, 156, 1),
          ]),
          strokeWidth: 20.0,
          strokeCap: StrokeCap.round,
          isReverse: false,
          isTimerTextShown: false,
          autoStart: true,
          onStart: () {},
          onComplete: () {
            Navigator.pushNamed(context, '/Pomodoro');
          },
        )
      ],
    );
  }
}
