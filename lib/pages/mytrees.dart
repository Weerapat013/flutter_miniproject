import 'package:flutter/material.dart';

class MyTrees extends StatefulWidget {
  const MyTrees({super.key});

  @override
  State<MyTrees> createState() => _MyTreesState();
}

class _MyTreesState extends State<MyTrees> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          children: [
            Text(
              'My Trees',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
    );
  }
}