import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_miniproject/color.dart';
import 'package:flutter_miniproject/pages/addtree.dart';
import 'package:flutter_miniproject/pages/viewtree.dart';
import 'package:http/http.dart' as http;

class MyTrees extends StatefulWidget {
  const MyTrees({super.key});

  @override
  State<MyTrees> createState() => _MyTreesState();
}

class _MyTreesState extends State<MyTrees> {
  List<dynamic> userTrees = [];

  @override
  void initState() {
    getUserTree();
    super.initState();
  }

  Future getUserTree() async {
    const url = "http://192.168.1.136/addressbook/selectUserTree_proj.php";
    final uri = Uri.parse(url);
    final response = await http.post(uri);
    //print(response.statusCode); //Debug
    if (response.statusCode == 200) {
      final json = response.body;
      final data = jsonDecode(json);

      setState(() {
        userTrees = data;
        //print(userTrees); //Debug
      });
    } else {
      //print('Error Connection'); //Debug
    }
  }

  Future deletePost(postID) async {
    const url = "http://192.168.1.136/addressbook/deleteUserTree_proj.php";
    final uri = Uri.parse(url);
    var post = {};

    post['id'] = postID;
    final response = await http.post(uri, body: post);
    //print(response.statusCode);
    if (response.statusCode == 200) {
      final json = response.body;
      final result = jsonDecode(json);

      if (result == "Success") {
        //print('Delete Post Success');
        getUserTree();
      } else {
        //print('Delete Post Error');
      }
    }
  }

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
                        userTrees.length.toString(),
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
                onPressed: () async {
                  //Receive return value after .Pop
                  var refresh = await Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => const AddTree(),
                    ),
                  );

                  //After .Pop then refresh data
                  if (refresh == 'refresh') {
                    setState(() {
                      getUserTree();
                    });
                  }
                },
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
                itemCount: userTrees.length,
                itemBuilder: (context, index) {
                  final id = userTrees[index]['id'];
                  final title = userTrees[index]['title'];
                  final caption = userTrees[index]['caption'];
                  //final userId = userTrees[index]['userid'];

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
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: onAlertPrimary, //Insert Data Here!!
                        child: Text(
                          id,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: greenPrimary),
                        ),
                      ),
                      title: Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: greenPrimary),
                      ),
                      subtitle: Text(
                        caption,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //View
                          GestureDetector(
                            child: const Icon(
                              Icons.visibility,
                              size: 30,
                              color: greenPrimary,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ViewTree(
                                    userTrees: userTrees,
                                    index: index,
                                  ),
                                ),
                              );
                            },
                          ),

                          //Delete
                          GestureDetector(
                            child: const Icon(
                              Icons.delete,
                              size: 20,
                              color: alertPrimary,
                            ),
                            onTap: () {
                              deletePost(id);
                            },
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
