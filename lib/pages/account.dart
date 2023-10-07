import 'package:flutter/material.dart';
import 'package:flutter_miniproject/color.dart';
import 'package:flutter_miniproject/pages/contact.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //User Image
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: CircleAvatar(
                  backgroundColor: onAlertPrimary, //Todo: Insert Data Here!!
                  radius: 100,
                ),
              ),

              //User Data
              SizedBox(
                width: width * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Line
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Container(
                        height: 4,
                        color: onYellowSecondary,
                      ),
                    ),

                    //User Data
                    Text(
                      'Name:',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: onbackgroundPrimary_1),
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 50),
                        Flexible(
                          child: Text(
                            'Weerapat Phutthamongkhon', //Todo: Insert Data Here!!
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: greenPrimary),
                          ),
                        ),
                      ],
                    ),

                    Text(
                      'Birthday:',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: onbackgroundPrimary_1),
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 50),
                        Flexible(
                          child: Text(
                            '24-03-2544', //Todo: Insert Data Here!!
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: greenPrimary),
                          ),
                        ),
                      ],
                    ),

                    Text(
                      'Address:',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: onbackgroundPrimary_1),
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 50),
                        Flexible(
                          child: Text(
                            '91/118 ถ.เลี่ยงเมือง อ.เมือง จ.สุราษฎร์ธานี 84000', //Todo: Insert Data Here!!
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: greenPrimary),
                          ),
                        ),
                      ],
                    ),

                    Text(
                      'Email:',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: onbackgroundPrimary_1),
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 50),
                        Flexible(
                          child: Text(
                            '6340011013@email.com', //Todo: Insert Data Here!!
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: greenPrimary),
                          ),
                        ),
                      ],
                    ),

                    Text(
                      'Tel:',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: onbackgroundPrimary_1),
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 50),
                        Flexible(
                          child: Text(
                            '064-0253302', //Todo: Insert Data Here!!
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: greenPrimary),
                          ),
                        ),
                      ],
                    ),

                    //Line
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        height: 4,
                        color: onYellowSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              //Button Settings
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: SizedBox(
                  height: 60,
                  width: 250,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    icon: const Icon(
                      Icons.settings,
                      size: 34,
                    ),
                    label: Text(
                      'Setting',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: Theme.of(context).colorScheme.onPrimary),
                    ), // <-- Text
                  ),
                ),
              ),

              //Button Contact us
              Padding(
                padding: const EdgeInsets.only(bottom: 36),
                child: SizedBox(
                  height: 60,
                  width: 250,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ContactUs(),
                        ),
                      );
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
                    icon: const Icon(
                      Icons.phone,
                      size: 34,
                    ),
                    label: Text(
                      'Contact us',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: greenPrimary),
                    ), // <-- Text
                  ),
                ),
              ),

              //Button Logout
              Padding(
                padding: const EdgeInsets.only(bottom: 36),
                child: SizedBox(
                  height: 60,
                  width: 250,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: onAlertPrimary,
                      backgroundColor: alertPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    icon: Text(
                      'Logout',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: onAlertPrimary),
                    ),
                    label: const Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Icon(
                        Icons.logout,
                        size: 34,
                      ),
                    ), // <-- Text
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
