import 'package:flutter/material.dart';
import 'package:flutter_miniproject/color.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.primary,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: const Text('Contact Us'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Data of Editor 1
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/editor1.jpg'),
                    radius: 75,
                  ),
                ),
                Text(
                  'Boorapa Chaenarom',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: greenPrimary),
                ),
                Text(
                  '6340011007',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: onbackgroundPrimary_1),
                ),
                const SizedBox(height: 8),
                Text(
                  'Email: 6340011007@psu.ac.th',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  'Tel: 087-1231234',
                  style: Theme.of(context).textTheme.bodySmall,
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

                //Data of Editor 2
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/editor2.jpg'),
                    radius: 75,
                  ),
                ),
                Text(
                  'Weerapat Phutthamongkhon',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: greenPrimary),
                ),
                Text(
                  '6340011013',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: onbackgroundPrimary_1),
                ),
                const SizedBox(height: 8),
                Text(
                  'Email: 6340011013@psu.ac.th',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  'Tel: 064-0253302',
                  style: Theme.of(context).textTheme.bodySmall,
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

                //Educational information
                //Faculty
                Text(
                  'Faculty', 
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: onbackgroundPrimary_1),
                ),
                Text(
                  'SCIENCE AND INDUSTRIAL TECHNOLOGY',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: greenPrimary),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                //Major
                Text(
                  'Major',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: onbackgroundPrimary_1),
                ),
                Text(
                  'Information Technology',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: greenPrimary),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                //University
                Text(
                  'University',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: onbackgroundPrimary_1),
                ),
                Text(
                  'Prince of Songkla University International College, Suratthani Campus',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: greenPrimary),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
