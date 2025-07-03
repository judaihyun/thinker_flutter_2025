import 'package:flutter/material.dart';
import 'dart:async';

class StopWatchPage extends StatefulWidget {
  const StopWatchPage({super.key});

  @override
  State<StopWatchPage> createState() => _StopWatchPageState();
}

class _StopWatchPageState extends State<StopWatchPage> {
  final Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;
  final List<String> _lapTimes = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _stopwatch.stop();
    super.dispose();
  }

  void _startStopwatch() {
    if (!_stopwatch.isRunning) {
      _stopwatch.start();
      _timer = Timer.periodic(const Duration(milliseconds: 10), (Timer t) {
        if (mounted) {
          setState(() {});
        }
      });
    }
  }

  void _stopStopwatch() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
      _timer?.cancel();
      _timer = null;
    }
  }

  void _resetStopwatch() {
    _stopStopwatch();
    if (mounted) {
      setState(() {
        _stopwatch.reset();
        _lapTimes.clear();
      });
    }
  }

  void _recordLapTime() {
    if (mounted) {
      final int milliseconds = _stopwatch.elapsedMilliseconds;
      final int hundreds = (milliseconds / 10).floor() % 100;
      final int seconds = (milliseconds / 1000).floor();

      setState(() {
        _lapTimes.insert(
          0,
          '${_lapTimes.length + 1}등 $seconds.${hundreds.toString().padLeft(2, '0')}',
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final int milliseconds = _stopwatch.elapsedMilliseconds;
    final int hundreds = (milliseconds / 10).floor() % 100;
    final int seconds = (milliseconds / 1000).floor();

    return Scaffold(
      appBar: AppBar(title: const Text('스톱워치')),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(seconds.toString(), style: const TextStyle(fontSize: 50)),
              Text(hundreds.toString().padLeft(2, '0')),
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
                onPressed: _resetStopwatch,
                child: const Icon(Icons.refresh),
              ),
              FloatingActionButton(
                onPressed: _stopwatch.isRunning
                    ? _stopStopwatch
                    : _startStopwatch,
                child: Icon(
                  _stopwatch.isRunning ? Icons.pause : Icons.play_arrow,
                ),
              ),
              FloatingActionButton(
                backgroundColor: Colors.green,
                onPressed: _recordLapTime,
                child: const Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
