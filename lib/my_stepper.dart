import 'package:flutter/material.dart';

class MyStepper extends StatefulWidget {
  final String? title;
  const MyStepper({Key? key, this.title}) : super(key: key);

  @override
  State<MyStepper> createState() => _MyStepperState();
}

class _MyStepperState extends State<MyStepper> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Stepper(
        currentStep: currentStep,
        steps: const [
          Step(title: Text('Step 1'), content: Text('Content Step 1')),
          Step(title: Text('Step 2'), content: Text('Content Step 2')),
          Step(title: Text('Step 3'), content: Text('Content Step 3')),
          Step(title: Text('Step 4'), content: Text('Content Step 4')),
        ],
        onStepTapped: (index) {
          setState(() {
            currentStep = index;
          });
        },
        onStepContinue: () {
          if (currentStep != 3) {
            setState(() {
              currentStep += 1;
            });
          }
        },
        onStepCancel: () {
          if (currentStep != 0) {
            setState(() {
              currentStep -= 1;
            });
          }
        },
      ),
    );
  }
}
