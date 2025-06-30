import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.height, required this.weight});

  final double height;
  final double weight;

  String _calculateBMI(final double bmi) {
    if (bmi >= 35) {
      return '고도 비만';
    } else if (bmi >= 30) {
      return '중도 비만';
    } else if (bmi >= 25) {
      return '경도 비만';
    } else if (bmi >= 23) {
      return '과체중';
    } else if (bmi >= 18.5) {
      return '정상';
    } else {
      return '저체중';
    }
  }

  Widget _buildResultIcon(final String result) {
    if (result == '고도 비만') {
      return Icon(Icons.sentiment_very_satisfied, color: Colors.red, size: 100);
    } else if (result == '중도 비만') {
      return Icon(Icons.sentiment_satisfied, color: Colors.orange, size: 100);
    } else if (result == '경도 비만') {
      return Icon(Icons.sentiment_satisfied, color: Colors.yellow, size: 100);
    } else if (result == '과체중') {
      return Icon(Icons.sentiment_satisfied, color: Colors.blue, size: 100);
    } else if (result == '정상') {
      return Icon(Icons.sentiment_satisfied, color: Colors.green, size: 100);
    } else {
      return Icon(
        Icons.sentiment_very_dissatisfied,
        color: Colors.red,
        size: 100,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double bmi = weight / (height * height);

    String result = _calculateBMI(bmi);

    return Scaffold(
      appBar: AppBar(
        title: const Text('결과', style: TextStyle(color: Colors.blue)),
      ),
      body: Center(
        child: Column(
          children: [
            Text(result, style: TextStyle(fontSize: 36)),
            _buildResultIcon(result),
          ],
        ),
      ),
    );
  }
}
