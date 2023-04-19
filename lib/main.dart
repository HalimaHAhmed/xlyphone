import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const MusicApp());

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(child: XylophoneApp()),
      ),
    );
  }
}

class XylophoneApp extends StatefulWidget {
  const XylophoneApp({super.key});

  @override
  State<XylophoneApp> createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  List colors = [
    Colors.red,
    Colors.teal,
    Colors.green,
    Colors.blue,
    Colors.blueGrey,
    Colors.grey,
    Colors.amber,
  ];
  List sounds = [];
  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    for (int i = 1; i <= 7; i++) {
      sounds.add('note$i.wav');
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: sounds.asMap().entries.map((el) {
        final index = el.key;
        final sound = el.value;

        return Expanded(
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(colors[index]),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
            onPressed: () {
              player.play(AssetSource(sound));
            },
            child: Text('Playe Note ${index + 1}'),
          ),
        );
      }).toList(),
    );
  }
}
