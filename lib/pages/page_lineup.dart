import 'package:flutter/material.dart';

class LineupPage extends StatefulWidget {
  const LineupPage({super.key});

  @override
  State<LineupPage> createState() => _LineupPageState();
}

class _LineupPageState extends State<LineupPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Lineup Sayfası'),
      ),
    );
  }
}
