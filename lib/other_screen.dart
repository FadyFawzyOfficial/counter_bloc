import 'package:flutter/material.dart';

class OtherScreen extends StatelessWidget {
  const OtherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Other')),
      body: const Center(
        child: Text(
          'Other',
          style: TextStyle(fontSize: 100),
        ),
      ),
    );
  }
}
