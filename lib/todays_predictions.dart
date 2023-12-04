import 'package:flutter/material.dart';

class TodaysPredictions extends StatefulWidget {
  const TodaysPredictions({super.key});

  @override
  State<TodaysPredictions> createState() => _TodaysPredictionsState();
}

class _TodaysPredictionsState extends State<TodaysPredictions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}
