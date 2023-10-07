import 'package:flutter/material.dart';

class OurTrees extends StatefulWidget {
  const OurTrees({super.key});

  @override
  State<OurTrees> createState() => _OurTreesState();
}

class _OurTreesState extends State<OurTrees> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          children: [
            Text(
              'Our Trees',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
    );
  }
}