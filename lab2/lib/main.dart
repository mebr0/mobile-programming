import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

void main() => runApp(const MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Pomodoro(),
));

class Pomodoro extends StatefulWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  State<Pomodoro> createState() => _PomodoroState();
}

enum Phase {
  study,
  pause,
  none,
}

class _PomodoroState extends State<Pomodoro> {
  static const int study = 25;
  static const int pause = 5;

  static NumberFormat format = NumberFormat("00");

  int seconds = 0;
  double percent = 0;
  double part = 0;
  Phase current = Phase.none;

  late Timer timer;

  _click() {
    if (_active()) {
      _stop();
    } else {
      _start();
    }
  }

  _start() {
    _reset(Phase.study);

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        seconds--;
        if (seconds <= 0) {
          _reset(current == Phase.study ? Phase.pause : Phase.study);
          return;
        }

        int target = _max();
        percent = (target - seconds) / target;
      });
    });
  }

  _stop() {
    setState(() {
      seconds = 0;
      part = 0;
      current = Phase.none;
    });

    timer.cancel();
  }

  _reset(Phase phase) {
    current = phase;
    percent = 0;
    seconds = _max();
    part = seconds / 100;
  }

  int _max() {
    return (current == Phase.study ? study : pause) * 60;
  }

  bool _active() {
    return current != Phase.none;
  }

  String _stateStr() {
    switch (current) {
      case Phase.study:
        return "Study time!";
      case Phase.pause:
        return "Relax time!";
      case Phase.none:
        return "";
    }
  }

  String _timeStr() {
    return "${format.format(seconds ~/ 60)}:${format.format(seconds % 60)}";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            color: Colors.black,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 40.0),
                  child: Text(
                    "Pomodoro Timer",
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 40.0
                    ),
                  ),
                ),
                Expanded(
                  child: CircularPercentIndicator(
                    percent: percent,
                    animation: true,
                    animateFromLastPercent: true,
                    radius: 300.0,
                    lineWidth: 20.0,
                    backgroundColor: Colors.white24,
                    progressColor: Colors.white30,
                    center: Text(
                      _timeStr(),
                      style: const TextStyle(
                        color: Colors.white30,
                        fontSize: 80.0,
                      ),
                    ),
                  ),
                ),
                Text(
                  _stateStr(),
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 50,
                  ),
                ),
                const SizedBox(height: 30.0),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 60.0),
                          child: ElevatedButton(
                            onPressed: _click,
                            style: ElevatedButton.styleFrom(
                              primary: _active() ? Colors.white12 : Colors.white24,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                _active() ? "Stop" : "Start",
                                style: TextStyle(
                                  color: _active() ? Colors.red : Colors.green,
                                  fontSize: 26.0,
                                ),
                              ),
                            ),
                          )
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}

