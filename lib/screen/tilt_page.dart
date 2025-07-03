import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sensors_plus/sensors_plus.dart';

class TiltPage extends StatefulWidget {
  const TiltPage({super.key});

  @override
  State<TiltPage> createState() => _TiltPageState();
}

class _TiltPageState extends State<TiltPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double width = 100;
    const double height = 100;
    final centerX = MediaQuery.of(context).size.width / 2 - width / 2;
    final centerY = MediaQuery.of(context).size.height / 2 - height / 2;

    return Scaffold(
      body: Stack(
        children: [
          StreamBuilder<AccelerometerEvent>(
            stream: accelerometerEventStream(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              final event = snapshot.data!;
              List<double> values = [event.x, event.y, event.z];
              print(values);

              return Positioned(
                left: centerX + values[0] * 20,
                top: centerY + values[1] * 20,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  width: width,
                  height: height,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
