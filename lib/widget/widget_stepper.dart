import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyStepper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StepperState();
  }
}

class _StepperState extends State {
  int _currentStep = 0;
  final List<Step> _steps = [
    Step(
        title: Text('Step1'),
        subtitle: Icon(Icons.exposure_zero),
        content: Text('我是内容'),
        isActive: true),
    Step(
        title: Text('Step2'),
        subtitle: Icon(Icons.exposure_plus_1),
        content: Text('我是内容'),
        isActive: true),
    Step(
        title: Text('Step3'),
        subtitle: Icon(Icons.exposure_plus_2),
        content: Text('我是内容'),
        isActive: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Stepper(
      steps: _steps,
      currentStep: _currentStep,
      onStepTapped: (step) {
        setState(() {
          _currentStep = step;
        });
      },
      onStepCancel: () {
        setState(() {
          if (_currentStep > 0) {
            _currentStep = _currentStep - 1;
          } else {
            _currentStep = 0;
          }
        });
      },
      onStepContinue: () {
        setState(() {
          if (_currentStep < _steps.length - 1) {
            _currentStep = _currentStep + 1;
          } else {
            _currentStep = 0;
          }
        });
      },
    );
  }
}
