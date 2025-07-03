import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';

class XylophonePage extends StatefulWidget {
  const XylophonePage({super.key});

  @override
  State<XylophonePage> createState() => _XylophonePageState();
}

class _XylophonePageState extends State<XylophonePage> {
  List<AudioPlayer> _soundIds = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    initSoundPool();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    for (final player in _soundIds) {
      player.dispose();
    }
    super.dispose();
  }

  Future<void> initSoundPool() async {
    List<String> notes = ['do1', 'do2', 're', 'mi', 'fa', 'sol', 'la', 'si'];
    for (final note in notes) {
      final player = AudioPlayer();
      await player.setAsset('assets/sounds/$note.wav');
      _soundIds.add(player);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('실로폰')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: gunbun('도', Colors.red, index: 0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: gunbun('레', Colors.orange, index: 1),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: gunbun('미', Colors.yellow, index: 2),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: gunbun('파', Colors.green, index: 3),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 48.0),
                  child: gunbun('솔', Colors.blue, index: 4),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 56.0),
                  child: gunbun('라', Colors.indigo, index: 5),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 64.0),
                  child: gunbun('시', Colors.purple, index: 6),
                ),
              ],
            ),
    );
  }

  Widget gunbun(String note, Color color, {required int index}) {
    return Container(
      width: 100,
      height: double.infinity,
      color: color,
      child: Center(
        child: GestureDetector(
          onTap: () {
            if (index < _soundIds.length) {
              _soundIds[index].seek(Duration.zero);
              _soundIds[index].play();
            }
          },
          child: Text(
            note,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
