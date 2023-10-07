import 'package:flutter/material.dart';
import 'package:flutter_miniproject/color.dart';

class AddTree extends StatefulWidget {
  const AddTree({super.key});

  @override
  State<AddTree> createState() => _AddTreeState();
}

class _AddTreeState extends State<AddTree> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController caption = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.primary,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: const Text('Add tree'),
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                //Image Title
                const Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 6),
                  child: CircleAvatar(
                    backgroundColor: greenPrimary,
                    radius: 75,
                    child: CircleAvatar(
                      backgroundColor: onAlertPrimary,
                      radius: 70,
                      child: Icon(
                        Icons.park,
                        color: greenPrimary,
                        size: 60,
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Title';
                          }
                          return null;
                        },
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
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              child: Text(
                                'Confirm',
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
