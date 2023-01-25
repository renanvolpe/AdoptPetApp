import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Adote um pet"),
        ),
        body: Center(
          child: Container(
            child: TextButton(
              onPressed: () {
                context.push("/animals");
              },
              child: const Text("Vamos adotar"),
            ),
          ),
        ));
  }
}
