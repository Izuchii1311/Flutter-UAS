import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../authentication/login_screen.dart';
import '../components/custom_appbar.dart';
import '../userPreferences/current_user.dart';
import '../userPreferences/userPreferences.dart';

class InfoProfile extends StatefulWidget {
  const InfoProfile({Key? key}) : super(key: key);

  @override
  _InfoProfileState createState() => _InfoProfileState();
}

class _InfoProfileState extends State<InfoProfile> {
  final CurrentUser _currentUser = Get.put(CurrentUser());

  signOutUser() async {
    var resultResponse = await Get.dialog(AlertDialog(
        backgroundColor: Colors.grey,
        title: const Text(
          "Logout",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        content: const Text("Are You Sure? Logout??"),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("No", style: TextStyle(color: Colors.black)),
          ),
          TextButton(
            onPressed: () {
              Get.back(result: "loggedOut");
            },
            child: Text("Yes", style: TextStyle(color: Colors.black)),
          )
        ]));

    if (resultResponse == "loggedOut") {
      // delete remove user data
      RememberUserPrefs.removeUserInfo().then((value) {
        Get.off(LoginScreen());
      });
    }
  }

  Widget userInfoItemProfile(IconData iconData, String userData) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: Row(
        children: [
          Icon(
            iconData,
            size: 30,
            color: Colors.black,
          ),
          const SizedBox(width: 16),
          Text(
            userData,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: "Info Profile",
        icon: const FaIcon(Icons.arrow_back_ios),
        actions: [
          // 
        ],
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/profile1.jpg'),
                    ),
                    SizedBox(height: 50, width: 30),
                    Column(
                      children: [
                        Container(
                          child: Text(
                            _currentUser.user.user_name,
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height:10),
                        Container(
                          child: Text(
                            _currentUser.user.user_email,
                            style: TextStyle(
                                color: Colors.blueGrey[400],
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(height:10),
                        Material(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(8),
                        child: InkWell(
                          onTap: () {
                            signOutUser();
                          },
                          borderRadius: BorderRadius.circular(32),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 12,
                            ),
                            child: Text("Logout",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                          ),
                        ),
                      ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blueGrey[200],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              '203',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 20),
                            ),
                          ),
                          Container(
                            child: Text(
                              'Comments',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.blueGrey),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              '932',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 20),
                            ),
                          ),
                          Container(
                            child: Text(
                              'Following',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.blueGrey),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              '30',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 20),
                            ),
                          ),
                          Container(
                            child: Text(
                              'Like',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.blueGrey),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blueGrey[200],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 30),
                      child: Text(
                        'Berita Kesukaan',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey[300],
                            ),
                            child: Center(
                                child: Text('Kesehatan',
                                    style: TextStyle(color: Colors.blueGrey))),
                          ),
                          Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey[300],
                            ),
                            child: Center(
                                child: Text('Obat',
                                    style: TextStyle(color: Colors.blueGrey))),
                          ),
                          Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey[300],
                            ),
                            child: Center(
                                child: Text('Mata',
                                    style: TextStyle(color: Colors.blueGrey))),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey[300],
                            ),
                            child: Center(
                                child: Text('Dokter',
                                    style: TextStyle(color: Colors.blueGrey))),
                          ),
                          Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey[300],
                            ),
                            child: Center(
                                child: Text('Klinik',
                                    style: TextStyle(color: Colors.blueGrey))),
                          ),
                          Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey[300],
                            ),
                            child: Center(
                                child: Text('Food',
                                    style: TextStyle(color: Colors.blueGrey))),
                          ),
                          Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey[300],
                            ),
                            child: Center(
                                child: Text('Gaya Hidup',
                                    style: TextStyle(color: Colors.blueGrey))),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
