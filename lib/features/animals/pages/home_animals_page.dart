import 'package:flutter/material.dart';

class HomeAnimalsPage extends StatefulWidget {
  const HomeAnimalsPage({Key? key}) : super(key: key);

  @override
  State<HomeAnimalsPage> createState() => _HomeAnimalsPageState();
}

class _HomeAnimalsPageState extends State<HomeAnimalsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Primeira página animals"),
    );
  }
}
