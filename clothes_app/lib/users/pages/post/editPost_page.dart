import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import '../../components/custom_appbar.dart';
import '../../utils/config.dart';
import '../success.dart';
import 'homePost_page.dart';

// ignore: must_be_immutable
class EditPost extends StatefulWidget {
  EditPost({required this.id});

  String id;

  @override
  State<EditPost> createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController title;
  late TextEditingController content;

  @override
  void initState() {
    super.initState();
    title = TextEditingController();
    content = TextEditingController();
    _getData();
  }

  Future<void> _getData() async {
    try {
      final response = await http.get(
        Uri.parse(
          "http://192.168.43.27:8080/api_clothes_store/post/detail.php?id='${widget.id}'",
        ),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          title = TextEditingController(text: data['title']);
          content = TextEditingController(text: data['content']);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _onUpdate(context) async {
    try {
      final response = await http.post(
        Uri.parse("http://192.168.43.27:8080/api_clothes_store/post/update.php"),
        body: {
          "id": widget.id,
          "title": title.text,
          "content": content.text,
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

  Future<void> _onDelete(context) async {
    try {
      final response = await http.post(
        Uri.parse("http://192.168.43.27:8080/api_clothes_store/post/delete.php"),
        body: {
          "id": widget.id,
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
        appTitle: 'Edit Postingan',
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
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: title,
                  decoration: InputDecoration(
                    labelText: "Title",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: content,
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText: "Content",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some content';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Config.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  "Update",
                  style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _onUpdate(context);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
