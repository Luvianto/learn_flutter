import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class BirthdayApp extends StatelessWidget {
  const BirthdayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Birthday Wishes',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: GreetingScreen(),
    );
  }
}

class GreetingScreen extends StatefulWidget {
  const GreetingScreen({super.key});

  @override
  _GreetingScreenState createState() => _GreetingScreenState();
}

class _GreetingScreenState extends State<GreetingScreen>
    with SingleTickerProviderStateMixin {
  double _xPosition = 0;
  double _yPosition = 0;
  double _xDirection = 1;
  double _yDirection = 1;
  double _speed = 2;
  Random _random = Random();

  late Timer _timer;
  late Size _screenSize;

  @override
  void initState() {
    super.initState();
    _startMovingText();
  }

  void _startMovingText() {
    _timer = Timer.periodic(Duration(milliseconds: 16), (timer) {
      setState(() {
        _xPosition += _xDirection * _speed;
        _yPosition += _yDirection * _speed;

        if (_xPosition <= 0 || _xPosition >= _screenSize.width - 300) {
          _xDirection *= -1;
          _randomizeColor();
        }
        if (_yPosition <= 0 || _yPosition >= _screenSize.height - 100) {
          _yDirection *= -1;
          _randomizeColor();
        }
      });
    });
  }

  void _randomizeColor() {
    setState(() {
      _speed = _random.nextDouble() * 3 + 2; // Randomize speed as well
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _screenSize = MediaQuery.of(context).size;
    });

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'lib/images/muka.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: _xPosition,
            top: _yPosition,
            child: Text(
              'HAPPY BIRTHDAY!',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(5.0, 5.0),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 300),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    textStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WishesScreen()),
                    );
                  },
                  child: const Text('DUAR!'),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WishesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lorem Ipsum'),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Jalan-jalan ke bakmi alun \n'
            'Jangan lupa beli pangsit kuah \n'
            'Selamat Ulang Tahun \n'
            'Semoga bahagia selalu dan banyak berkah \n',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
