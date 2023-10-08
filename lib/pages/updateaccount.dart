import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_miniproject/color.dart';
import 'package:http/http.dart' as http;

class UpdateAccount extends StatefulWidget {
  final List user;
  final int index;

  const UpdateAccount({
    Key? key,
    required this.user,
    required this.index,
  }) : super(key: key);

  @override
  State<UpdateAccount> createState() => _UpdateAccountState();
}

class _UpdateAccountState extends State<UpdateAccount> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController id = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController birthday = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  Future editUser() async {
    const url = "http://192.168.1.136/addressbook/updateUser_proj.php";
    final uri = Uri.parse(url);
    final response = await http.post(uri, body: {
      'id': id.text,
      'fullname': fullname.text,
      'address': address.text,
      'email': email.text,
      'phone': phone.text,
    });

    //print(response.statusCode); //Debug
    if (response.statusCode == 200) {
      final json = response.body;
      final data = jsonDecode(json);

      if (data == 'Success') {
        //print(data); //Debug
        setState(() {
          Navigator.pop(context, 'refresh');
        });
      } else {
        //print('Update User Error'); //Debug
      }
    }
  }

  @override
  void initState() {
    id.text = widget.user[widget.index]['id'];
    fullname.text = widget.user[widget.index]['fullname'];
    birthday.text = widget.user[widget.index]['birthday'];
    address.text = widget.user[widget.index]['address'];
    email.text = widget.user[widget.index]['email'];
    phone.text = widget.user[widget.index]['phone'];
    password.text = widget.user[widget.index]['password'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final id = widget.user[widget.index]['id'];

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.primary,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: const Text('Edit User Account'),
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //Image Title
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 6),
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

                  //Button Add Picture
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.photo_camera,
                      color: onbackgroundPrimary_1,
                      size: 24,
                    ),
                  ),

                  //List of TextFormField
                  SizedBox(
                    width: width * 0.85,
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

                        //Update username
                        Text(
                          'Name:',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: onbackgroundPrimary_1),
                        ),
                        TextFormField(
                          controller: fullname,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Fullname';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 30.0),
                            hintText: "Add your Fullname",
                            hintStyle:
                                const TextStyle(color: onbackgroundPrimary_1),
                            filled: true,
                            fillColor: onAlertPrimary,
                            //focusColor: greenPrimary,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        //Update birthday (Read only!!)
                        Text(
                          'Birthday:',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: onbackgroundPrimary_1),
                        ),
                        TextFormField(
                          controller: birthday,
                          readOnly: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Username';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 30.0),
                            hintText: "Add your Birthday",
                            hintStyle:
                                const TextStyle(color: onbackgroundPrimary_1),
                            filled: true,
                            fillColor: onAlertPrimary,
                            //focusColor: greenPrimary,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        //Update address
                        Text(
                          'Address:',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: onbackgroundPrimary_1),
                        ),
                        TextFormField(
                          controller: address,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Address';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 30.0),
                            hintText: "Add your Address",
                            hintStyle:
                                const TextStyle(color: onbackgroundPrimary_1),
                            filled: true,
                            fillColor: onAlertPrimary,
                            //focusColor: greenPrimary,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        //Update email
                        Text(
                          'Email:',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: onbackgroundPrimary_1),
                        ),
                        TextFormField(
                          controller: email,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 30.0),
                            hintText: "Add your Email",
                            hintStyle:
                                const TextStyle(color: onbackgroundPrimary_1),
                            filled: true,
                            fillColor: onAlertPrimary,
                            //focusColor: greenPrimary,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        //Update phone number
                        Text(
                          'Tel:',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: onbackgroundPrimary_1),
                        ),
                        TextFormField(
                          controller: phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Phone number';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 30.0),
                            hintText: "Add your Phone number",
                            hintStyle:
                                const TextStyle(color: onbackgroundPrimary_1),
                            filled: true,
                            fillColor: onAlertPrimary,
                            //focusColor: greenPrimary,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        //Password (Read only!!)
                        Text(
                          'Password: (Read only)',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: onbackgroundPrimary_1),
                        ),
                        TextFormField(
                          controller: password,
                          readOnly: true,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 30.0),
                            hintText: "This is your Password",
                            hintStyle:
                                const TextStyle(color: onbackgroundPrimary_1),
                            filled: true,
                            fillColor: onAlertPrimary,
                            //focusColor: greenPrimary,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        //Confirm Password (for Validate)
                        Text(
                          'Confirm Password:',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: onbackgroundPrimary_1),
                        ),
                        TextFormField(
                          controller: confirmPassword,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Confirm your Password';
                            }
                            if (value != password.text) {
                              return "Passwords don't match, Please check Password";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 30.0),
                            hintText: "Please Confirm your Password",
                            hintStyle:
                                const TextStyle(color: onbackgroundPrimary_1),
                            filled: true,
                            fillColor: onAlertPrimary,
                            //focusColor: greenPrimary,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),

                        //Line
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Container(
                            height: 4,
                            color: onYellowSecondary,
                          ),
                        ),

                        //Button Bar
                        ButtonBar(
                          alignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //Cancel Button
                            SizedBox(
                              height: 60,
                              width: 140,
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
                                  'Cancel',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                              ),
                            ),

                            //Summit Button
                            SizedBox(
                              height: 60,
                              width: 170,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    editUser();
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                                child: Text(
                                  'Save',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(color: onGreenPrimary),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
