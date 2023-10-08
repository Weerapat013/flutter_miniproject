import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_miniproject/color.dart';
import 'package:flutter_miniproject/pages/contact.dart';
import 'package:flutter_miniproject/pages/updateaccount.dart';
import 'package:http/http.dart' as http;

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  List<dynamic> user = [];

  @override
  void initState() {
    getUser();
    super.initState();
  }

  Future getUser() async {
    const url = "http://192.168.1.136/addressbook/selectUser_proj.php";
    final uri = Uri.parse(url);
    final response = await http.post(uri);
    print(response.statusCode); //Debug
    if (response.statusCode == 200) {
      final json = response.body;
      final data = jsonDecode(json);

      setState(() {
        user = data;
        print(user); //Debug
      });
    } else {
      print('Error Connection'); //Debug
    }
  }

  @override
  Widget build(BuildContext context) {
    final id = user[0]['id'];
    final name = user[0]['fullname'];
    final birthday = user[0]['birthday'];
    final address = user[0]['address'];
    final email = user[0]['email'];
    final tel = user[0]['phone'];

    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //User Image
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: CircleAvatar(
                  backgroundColor: onAlertPrimary,
                  radius: 100,
                  child: Text(
                    id,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: greenPrimary),
                  ),
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
                            name,
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
                            birthday,
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
                            address,
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
                            email,
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
                            tel,
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
                    onPressed: () async {
                      var refresh = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateAccount(
                            user: user,
                            index: 0,
                          ),
                        ),
                      );

                      if (refresh == 'refresh') {
                        setState(() {
                          getUser();
                        });
                      }
                    },
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
