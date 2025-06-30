import 'package:flutter/material.dart';
import 'dart:async';

class StopWatchPage extends StatefulWidget {
  const StopWatchPage({super.key});

  @override
  State<StopWatchPage> createState() => _StopWatchPageState();
}

class _StopWatchPageState extends State<StopWatchPage> {
  Timer? timer;
  int _time = 0;
  bool _isRunning = false;

  List<String> _lapTimes = [];

  void _clickButton() {
    _isRunning = !_isRunning;
    if (_isRunning) {
      _startTimer();
    } else {
      _stopTimer();
    }
  }

  void _startTimer() {
    timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        _time++;
      });
    });
  }

  void _stopTimer() {
    timer?.cancel();
  }

  void _resetTimer() {
    _isRunning = false;
    timer?.cancel();
    _lapTimes.clear();
    _time = 0;
  }

  void _recordLapTime(String time) {
    _lapTimes.insert(0, '${_lapTimes.length + 1}등 $time');
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int sec = _time ~/ 100;
    String hundreds = (_time % 100).toString().padLeft(2, '0');

    return Scaffold(
      appBar: AppBar(title: Text('스톱워치')),
      body: Column(
        children: [
          const SizedBox(width: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('$sec', style: TextStyle(fontSize: 50)),
              Text(hundreds),
            ],
          ),
          SizedBox(
            height: 200,
            width: 100,
            child: ListView(
              children: _lapTimes
                  .map((time) => Center(child: Text(time)))
                  .toList(),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.orange,
                onPressed: () {
                  setState(() {
                    _resetTimer();
                  });
                },
                child: Icon(Icons.refresh),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _clickButton();
                  });
                },
                child: _isRunning ? Icon(Icons.pause) : Icon(Icons.play_arrow),
              ),
              FloatingActionButton(
                backgroundColor: Colors.green,
                onPressed: () {
                  setState(() {
                    _recordLapTime('$sec.$hundreds');
                  });
                },
                child: Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
