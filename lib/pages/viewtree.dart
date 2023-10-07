import 'package:flutter/material.dart';
import 'package:flutter_miniproject/color.dart';

class ViewTree extends StatefulWidget {
  const ViewTree({super.key});

  @override
  State<ViewTree> createState() => _ViewTreeState();
}

class _ViewTreeState extends State<ViewTree> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.primary,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: const Text('Back'),
        ),
        body: Center(
          child: Column(
            children: [
              //Tree Image
              const Padding(
                padding: EdgeInsets.only(top: 30, bottom: 10),
                child: CircleAvatar(
                  backgroundColor: onAlertPrimary, //Todo: Insert Data Here!!
                  radius: 100,
                ),
              ),

              //Title
              Text(
                'Title Here',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: greenPrimary),
              ),

              Text(
                'Caption Here',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: onbackgroundPrimary_1),
              ),
              //Line
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Container(
                      height: 4,
                      width: width * 0.9,
                      color: onYellowSecondary,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Description',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: const Color.fromARGB(255, 83, 83, 83)),
                    ),
                  ),
                ],
              ),
              Container(
                width: width * 0.8,
                height: 200,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: onAlertPrimary,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Text(
                    '1\n2\n3\n4\n5',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
