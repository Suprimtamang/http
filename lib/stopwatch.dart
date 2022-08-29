import 'dart:async';
import 'package:flutter/material.dart';

//step 1 : creating stateful widget
class StopWatch extends StatefulWidget {
  const StopWatch({Key? key}) : super(key: key);

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  int timeleft = 5;

  void _startCountdown() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeleft > 0) {
        setState(() {
          timeleft--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[800],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      timeleft.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  MaterialButton(
                    onPressed: _startCountdown,
                    child: Text(
                      'S T A R T',
                      style: TextStyle(
                          backgroundColor: Colors.white,
                          fontSize: 50,
                          color: Colors.blue),
                    ),
                  )
                ]),
          ),
        ));
  }
}
