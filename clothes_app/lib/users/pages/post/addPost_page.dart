// ignore_for_file: unused_field, prefer_const_constructors, avoid_print

import 'dart:convert';

import 'package:clothes_app/users/pages/post/homePost_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import '../../components/custom_appbar.dart';
import '../../utils/config.dart';
import '../success.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddState();
}

class _AddState extends State<AddPost> {
  final _formKey = GlobalKey<FormState>();

  //inisialize field
  var title = TextEditingController();
  var content = TextEditingController();

  Future _onSubmit() async {
    try {
      return await http.post(
        Uri.parse(
            "http://192.168.43.27:8080/api_clothes_store/post/create.php"),
        body: {
          "title": title.text,
          "content": content.text,
        },
      ).then((value) {
        //print message after insert to database
        //you can improve this message with alert dialog
        var data = jsonDecode(value.body);
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
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: 'Buat Postingan Baru',
        icon: const FaIcon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              TextFormField(
                controller: title,
                validator: (val) =>
                    val!.isEmpty ? "Masukkan Judul Postingan..." : null,
                decoration: const InputDecoration(
                  hintText: 'Title',
                  labelText: 'Title',
                  alignLabelWithHint: true,
                  prefixIconColor: Config.primaryColor,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Content',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              TextFormField(
                controller: content,
                keyboardType: TextInputType.multiline,
                minLines: 5,
                maxLines: null,
                validator: (val) =>
                    val!.isEmpty ? "Inputkan Isi Content Post..." : null,
                decoration: const InputDecoration(
                  hintText: 'Content',
                  labelText: 'Content',
                  alignLabelWithHint: true,
                  prefixIconColor: Config.primaryColor,
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Config.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  //validate
                  if (_formKey.currentState!.validate()) {
                    //send data to database with this method
                    _onSubmit();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
