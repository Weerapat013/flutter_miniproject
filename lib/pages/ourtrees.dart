import 'package:flutter/material.dart';
import 'package:flutter_miniproject/color.dart';

class OurTrees extends StatefulWidget {
  const OurTrees({super.key});

  @override
  State<OurTrees> createState() => _OurTreesState();
}

class _OurTreesState extends State<OurTrees> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          children: [
            //Title Data
            const Image(
                image: AssetImage('assets/images/undraw_environment_iaus.png')),
            Text(
              'The Trees have been Planted',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: onbackgroundPrimary_1),
            ),
            Text(
              '1,000,000',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: greenPrimary),
            ),

            //Line
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                width: width * 0.9,
                child: Container(
                  height: 4,
                  color: onYellowSecondary,
                ),
              ),
            ),

            //Lits Data
            SizedBox(
              width: width * 0.9,
              height: 300,
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
                      trailing: const Icon(
                        Icons.visibility,
                        color: greenPrimary,
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
