import 'package:flutter/material.dart';
import 'package:logic_flutter_selections/root.dart';

void main() {
  runApp(LogicWithYusuf());
}

class LogicWithYusuf extends StatelessWidget {
  const LogicWithYusuf({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Root());
  }
}
