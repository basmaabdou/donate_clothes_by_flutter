// قم بتعريف صفحة جديدة (مثال)
import 'package:flutter/material.dart';

class DonatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Next Page'),
      ),
      body: Center(
        child: Text('This is your Donate page content.'),
      ),
    );
  }
}
