// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TodaysPredictions extends StatefulWidget {
  const TodaysPredictions({super.key});

  @override
  State<TodaysPredictions> createState() => _TodaysPredictionsState();
}

class _TodaysPredictionsState extends State<TodaysPredictions> {
  var _rotation = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FittedBox(
                child: Text(
                  'Try your fortune!',
                  style: TextStyle(
                    fontSize: 48,
                    fontFamily: 'YuseiMagic',
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/images/circle.png'),
                  AnimatedRotation(
                    curve: Curves.fastEaseInToSlowEaseOut,
                    duration: const Duration(seconds: 9),
                    turns: _rotation,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 32),
                      child: Transform.rotate(
                        angle: 3.14 * 3 / 2,
                        child: const Icon(
                          Icons.forward,
                          size: 90,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 32),
              OutlinedButton(
                onPressed: () async {
                  setState(() {
                    _rotation += 15 + Random().nextDouble();
                  });

                  final response = await http.get(Uri.parse('http://yerkee.com/api/fortune'));
                  final fortune = jsonDecode(response.body)['fortune'];
                  await Future.delayed(const Duration(seconds: 9));
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                        'Your fortune is:',
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'YuseiMagic',
                        ),
                      ),
                      content: Text(
                        fortune,
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'YuseiMagic',
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.redAccent,
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                child: const Text('Predict',
                    style: TextStyle(
                      fontSize: 48,
                      fontFamily: 'YuseiMagic',
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
