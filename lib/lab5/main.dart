import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const _size = 25.0;
const _bgColor = Colors.green;
const _borderColor = Colors.grey;
const _borderWidth = 3.0;
const _borderRadius = 4.0;

// Цифра 6 на сітці 5 x 7: '1' - піксель, '0' - порожнє місце
const _digitSix = [
  '01111',
  '10000',
  '10000',
  '11110',
  '10001',
  '10001',
  '01110',
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Pixel digit 6'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: _buildDigit(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildDigit() {
    return _digitSix.map(_buildLine).toList();
  }

  Widget _buildLine(String line) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: line
          .split('')
          .map((c) => c == '1' ? _buildDot() : _buildEmpty())
          .toList(),
    );
  }

  Widget _buildDot() {
    return Container(
      width: _size,
      height: _size,
      decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(_borderRadius),
        ),
        border: Border.all(
          color: _borderColor,
          width: _borderWidth,
        ),
      ),
    );
  }

  Widget _buildEmpty() {
    return const SizedBox(
      width: _size,
      height: _size,
    );
  }
}