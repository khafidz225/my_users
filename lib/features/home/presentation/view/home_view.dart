import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('0'),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('add')),
              ElevatedButton(onPressed: () {}, child: const Text('min')),
            ],
          )
        ],
      ),
    );
  }
}
