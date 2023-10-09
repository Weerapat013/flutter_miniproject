import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_miniproject/color.dart';
import 'package:flutter_miniproject/pages/viewtree.dart';
import 'package:http/http.dart' as http;

class OurTrees extends StatefulWidget {
  const OurTrees({super.key});

  @override
  State<OurTrees> createState() => _OurTreesState();
}

class _OurTreesState extends State<OurTrees> {
  List<dynamic> trees = [];

  @override
  void initState() {
    getTrees();
    super.initState();
  }

  Future getTrees() async {
    // TODO: Need to change IP everytime to connect DB (ipconfig in CMD)
    const url = "http://172.21.245.138/addressbook/selectAllTree_proj.php";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    //print(response.statusCode); //Debug
    if (response.statusCode == 200) {
      final json = response.body;
      final data = jsonDecode(json);

      setState(() {
        trees = data;
        //print(trees); //Debug
      });
    } else {
      //print('Error Connection'); //Debug
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
              trees.length.toString(), //'1,000,000',
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
                itemCount: trees.length,
                itemBuilder: (context, index) {
                  final id = trees[index]['id'];
                  final title = trees[index]['title'];
                  final caption = trees[index]['caption'];

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
                      leading: GestureDetector(
                        child: CircleAvatar(
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
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ViewTree(
                                userTrees: trees,
                                index: index,
                              ),
                            ),
                          );
                        },
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
                      trailing: GestureDetector(
                        child: const Icon(
                          Icons.visibility,
                          color: greenPrimary,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ViewTree(
                                userTrees: trees,
                                index: index,
                              ),
                            ),
                          );
                        },
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
