import 'package:flutter/material.dart';
import 'package:flutter_miniproject/color.dart';
import 'package:flutter_miniproject/pages/account.dart';
import 'package:flutter_miniproject/pages/mytrees.dart';
import 'package:flutter_miniproject/pages/ourtrees.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const TabBarView(
        children: [
          OurTrees(),
          MyTrees(),
          Account(),
        ],
      ),
      bottomNavigationBar: const SafeArea(
        child: TabBar(
          labelColor: yellowSecondary,
          indicatorWeight: 5,
          indicatorColor: onYellowSecondary,
          tabs: [
            Tab(text: 'Our Trees', icon: Icon(Icons.forest)),
            Tab(text: 'My Trees', icon: Icon(Icons.nature_people)),
            Tab(text: 'Account', icon: Icon(Icons.account_circle)),
          ],
        ),
      )
    );
  }
}