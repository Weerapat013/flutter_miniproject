import 'package:flutter/material.dart';
import 'package:flutter_miniproject/color.dart';

class MyTrees extends StatefulWidget {
  const MyTrees({super.key});

  @override
  State<MyTrees> createState() => _MyTreesState();
}

class _MyTreesState extends State<MyTrees> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          children: [
            //Title Data
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.park,
                      size: 60,
                      color: greenPrimary,
                    ),
                    Container(
                      width: 5,
                      height: 80,
                      color: Colors.amber,
                    ),
                    Text(
                      'You Planted: ',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: onYellowSecondary),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        '36', //Todo: Insert Data Here!!
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: greenPrimary),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Button Add Data
            SizedBox(
              height: 70,
              width: 300,
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                icon: const Icon(
                  Icons.add_circle,
                  size: 34,
                ),
                label: Text(
                  'Add Tree',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ), // <-- Text
              ),
            ),

            //List Title
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: SizedBox(
                width: width * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'The Trees You Planted',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: onYellowSecondary),
                      ),
                    ),
                    Container(
                      height: 4,
                      color: onYellowSecondary,
                    ),
                  ],
                ),
              ),
            ),

            //List Data
            SizedBox(
              width: width * 0.9,
              height: 442,
              //color: Colors.amber,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: onbackgroundPrimary_1,
                        ),
                      ),
                    ),
                    child: ListTile(
                      leading: const CircleAvatar(
                        radius: 30,
                        backgroundColor: onAlertPrimary, //Insert Data Here!!
                        child: null,
                      ),
                      title: Text(
                        'This is Title', //Todo: Insert Data Here!!
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: greenPrimary),
                      ),
                      subtitle: Text(
                        'This is Caption', //Todo: Insert Data Here!!
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      trailing: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //View
                          Icon(
                            Icons.visibility,
                            size: 30,
                            color: greenPrimary,
                          ),

                          //Delete
                          Icon(
                            Icons.delete,
                            size: 20,
                            color: alertPrimary,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
