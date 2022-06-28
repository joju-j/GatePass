import 'package:flutter/material.dart';

class PendingLogsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Screen')),
      body: Center(
        child: Text(
          'pending logs',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}