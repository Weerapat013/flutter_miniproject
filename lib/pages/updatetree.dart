import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_miniproject/color.dart';
import 'package:http/http.dart' as http;

class UpdateTree extends StatefulWidget {
  final List userTrees;
  final int index;

  const UpdateTree({
    Key? key,
    required this.userTrees,
    required this.index,
  }) : super(key: key);

  @override
  State<UpdateTree> createState() => _UpdateTreeState();
}

class _UpdateTreeState extends State<UpdateTree> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController id = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController caption = TextEditingController();
  TextEditingController description = TextEditingController();

  Future editPost() async {
    const url = "http://192.168.1.136/addressbook/updateUserTree_proj.php";
    final uri = Uri.parse(url);
    final response = await http.post(uri, body: {
      'id': id.text,
      'title': title.text,
      'caption': caption.text,
      'description': description.text,
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
        //print('Update Post Error'); //Debug
      }
    }
  }

  @override
  void initState() {
    id.text = widget.userTrees[widget.index]['id'];
    title.text = widget.userTrees[widget.index]['title'];
    caption.text = widget.userTrees[widget.index]['caption'];
    description.text = widget.userTrees[widget.index]['description'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final id = widget.userTrees[widget.index]['id'];

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.primary,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: const Text('Edit Post'),
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                //Image Title
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 6),
                  child: CircleAvatar(
                    backgroundColor: greenPrimary,
                    radius: 75,
                    child: CircleAvatar(
                      backgroundColor: onAlertPrimary,
                      radius: 70,
                      child: Text(
                        id,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: greenPrimary, fontSize: 80),
                      ),
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
                    children: [
                      //Add Title
                      TextFormField(
                        controller: title,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Title';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 30.0),
                          hintText: "Add your Title",
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

                      //Add Caption
                      TextFormField(
                        controller: caption,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Title';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 30.0),
                          hintText: "Add your Caption",
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

                      //Add Description
                      TextFormField(
                        controller: description,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 50.0, horizontal: 30.0),
                          hintText: "Add some Description\n(limits 5 Line)",
                          hintStyle:
                              const TextStyle(color: onbackgroundPrimary_1),
                          filled: true,
                          fillColor: onAlertPrimary,
                          //focusColor: greenPrimary,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.red,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 5,
                      ),
                      const SizedBox(height: 20),

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
                                title.clear();
                                caption.clear();
                                description.clear();

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
                                  editPost();
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
