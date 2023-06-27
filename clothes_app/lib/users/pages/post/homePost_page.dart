import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../components/custom_appbar.dart';
import '../../utils/config.dart';
import '../main_layouts.dart';
import 'addPost_page.dart';
import 'detailPost_page.dart';
import 'editPost_page.dart';

class HomePost extends StatefulWidget {
  @override
  HomePostState createState() => HomePostState();
}

class HomePostState extends State<HomePost> {
  List<dynamic> _get = [];

  final _lightColors = [
    Colors.amber.shade300,
    Colors.lightGreen.shade300,
    Colors.lightBlue.shade300,
    Colors.orange.shade300,
    Colors.pinkAccent.shade100,
    Colors.tealAccent.shade100
  ];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    try {
      final response = await http.get(
        Uri.parse("http://192.168.43.27:8080/api_clothes_store/post/list.php"),
      );

      // if the response is successful
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // entry data to the variable list _get
        setState(() {
          _get = data;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: 'Postingan Kami',
        icon: const FaIcon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainLayouts(),
          ),
        );
        // Navigator.pop(context);
        },
      ),
      body: _get.length != 0
          ? ListView.builder(
              itemCount: _get.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    int postId = int.parse(_get[index]['id']);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPost(postId: postId),
                      ),
                    );
                  },
                  child: Card(
                    // make random color for every card
                    color: _lightColors[index % _lightColors.length],
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${_get[index]['title']}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 25),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              EditPost(id: _get[index]['id']),
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      FontAwesomeIcons.edit,
                                      color: Colors.white,
                                      size: 22,
                                    ),
                                  ),
                                )
                              ]),
                          SizedBox(height: 10),
                          Text(
                            '${_get[index]['date']}',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          : Center(
              child: Text(
                "No Data Available",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Config.primaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPost()),
          );
        },
      ),
    );
  }
}
