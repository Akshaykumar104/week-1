import 'package:flutter/material.dart';
import 'package:practice/veggies.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: const Center(child: Text("S  H  O  P  P  I  N  G")),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => const Veggies(),))
;},
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(200, 60),
            backgroundColor: Colors.deepPurple[100],
          ),
          child: const Text("S H O P"),

        ),
      ),
    );
  }
}
