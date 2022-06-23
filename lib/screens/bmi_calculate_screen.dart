import 'package:flutter/material.dart';

class BmiCalculateScreen extends StatelessWidget {
  const BmiCalculateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculate BMI'),
      ),
      body: const Center(
        child: Text('Calculate BMI Screen'),
      ),
    );
  }
}
