import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: Center(child: Text("@ 2025 Flutter Api App")),
    );
  }
}
