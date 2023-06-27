import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import '../../components/custom_appbar.dart';
import '../success.dart';
import 'homePost_page.dart';

class DetailPost extends StatefulWidget {
  final int postId;

  const DetailPost({Key? key, required this.postId}) : super(key: key);

  @override
  _DetailPostState createState() => _DetailPostState();
}

class _DetailPostState extends State<DetailPost> {
  late Future<Map<String, dynamic>> _postFuture;

  @override
  void initState() {
    super.initState();
    _postFuture = _fetchPostData();
  }

  Future<Map<String, dynamic>> _fetchPostData() async {
    final response = await http.get(Uri.parse('http://192.168.43.27:8080/api_clothes_store/post/detail.php?id=${widget.postId.toString()}'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch post data');
    }
  }

  Future<void> _onDelete(context) async {
    try {
      final response = await http.post(
        Uri.parse("http://192.168.43.27:8080/api_clothes_store/post/delete.php"),
        body: {
          "id": widget.postId.toString(),
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data["message"]);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Success(
              title: "Kembali ke Menu Postingan",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePost(),
                  ),
                );
              }
            ),
          )
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: 'Postingan',
        icon: const FaIcon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Delete Note"),
                      content: Text("Are you sure you want to delete this note?"),
                      actions: [
                        TextButton(
                          child: Text("Cancel"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text("Delete"),
                          onPressed: () {
                            _onDelete(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Icon(
                Icons.delete,
                color: Colors.redAccent,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _postFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final postData = snapshot.data!;

            return SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${postData['title']}',
                    style: TextStyle(
                      fontSize: 40, 
                      fontWeight: FontWeight.bold
                      ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Author: ${postData['author']}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Upload: ${postData['date']}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Content: ${postData['content']}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
