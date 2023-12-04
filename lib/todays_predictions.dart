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
              Image.asset('assets/images/circle.png'),
              const SizedBox(height: 32),
              OutlinedButton(
                onPressed: () {},
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
