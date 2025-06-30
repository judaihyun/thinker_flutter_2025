import 'package:flutter/material.dart';
import 'screen/bmi_page.dart';
import 'screen/slider_page.dart';
import 'screen/stop_watch_page.dart';
import 'screen/webview_page.dart';

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
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BmiScreen()),
                  );
                },
                child: const Text('BMI 계산기'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StopWatchPage(),
                    ),
                  );
                },
                child: const Text('스톱워치'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WebviewPage(),
                    ),
                  );
                },
                child: const Text('Webview'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SliderPage()),
                  );
                },
                child: const Text('전자액자'),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      Image.asset(
                        "assets/images/uphill2.gif",
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
