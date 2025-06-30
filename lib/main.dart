import 'package:flutter/material.dart';
import 'screen/home_page.dart';
import 'screen/scroll_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.black),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('홈', style: TextStyle(color: Colors.blue)),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              '$_count',
              style: TextStyle(color: Colors.redAccent, fontSize: 70),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _count++;
                });
              },
              child: const Text('+1'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _count++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
