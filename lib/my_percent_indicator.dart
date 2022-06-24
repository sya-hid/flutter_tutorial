import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MyPercentIndicator extends StatefulWidget {
  final String? title;
  const MyPercentIndicator({Key? key, this.title}) : super(key: key);

  @override
  State<MyPercentIndicator> createState() => _MyPercentIndicatorState();
}

class _MyPercentIndicatorState extends State<MyPercentIndicator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LinearPercentIndicator(
              lineHeight: 40,
              percent: 0.45,
              progressColor: Colors.deepPurple,
              backgroundColor: Colors.deepPurpleAccent,
              barRadius: const Radius.circular(20),
            ),
            CircularPercentIndicator(
              radius: 150,
              lineWidth: 40,
              progressColor: Colors.deepPurple,
              backgroundColor: Colors.deepPurpleAccent,
              percent: 0.45,
              circularStrokeCap: CircularStrokeCap.round,
              center: const Text(
                '45%',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
