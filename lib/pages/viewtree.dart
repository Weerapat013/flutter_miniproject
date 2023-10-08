import 'package:flutter/material.dart';
import 'package:flutter_miniproject/color.dart';

class ViewTree extends StatefulWidget {
  final List userTrees;
  final int index;

  const ViewTree({
    Key? key,
    required this.userTrees,
    required this.index,
  }) : super(key: key);

  @override
  State<ViewTree> createState() => _ViewTreeState();
}

class _ViewTreeState extends State<ViewTree> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final id = widget.userTrees[widget.index]['id'];
    final title = widget.userTrees[widget.index]['title'];
    final caption = widget.userTrees[widget.index]['caption'];
    final description = widget.userTrees[widget.index]['description'];

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
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 10),
                child: CircleAvatar(
                  backgroundColor: onAlertPrimary, //Todo: Insert Data Here!!
                  radius: 100,
                  child: Text(
                    id,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: greenPrimary,
                          fontSize: 80,
                        ),
                  ),
                ),
              ),

              //Title
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: greenPrimary),
              ),

              Text(
                caption,
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

              //
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
                    description,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),

              //Button Back
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: SizedBox(
                  height: 60,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: greenPrimary,
                      backgroundColor: onAlertPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      side: const BorderSide(
                        color: greenPrimary,
                        width: 5,
                      ),
                    ),
                    child: Text(
                      'Back',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
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
