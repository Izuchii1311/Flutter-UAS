import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../userPreferences/current_user.dart';
import '../utils/config.dart';
import '../components/appointment_card.dart';
import '../components/doctor_card.dart';
import 'infoProfile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CurrentUser _currentUser = Get.put(CurrentUser());

  List<Map<String, dynamic>> medCat = [
    {
      "icon": FontAwesomeIcons.userDoctor,
      "category": "Doctors",
    },
    {
      "icon": FontAwesomeIcons.stethoscope,
      "category": "Cek Kesehatan",
    },
    {
      "icon": FontAwesomeIcons.eye,
      "category": "Periksa Mata",
    },
    {
      "icon": FontAwesomeIcons.glasses,
      "category": "Kacamata",
    },
    {
      "icon": Icons.healing_outlined,
      "category": "Katarak",
    },
    {
      "icon": Icons.health_and_safety_outlined,
      "category": "Minus / Plus",
    },
  ];

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: [
                        Text(
                          "Welcome " + (_currentUser.user.user_name),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ]
                    ),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InfoProfile()),
                          );
                        },
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/images/profile1.jpg'),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15),
                Divider(
                  color: Colors.grey,
                  thickness: 1.0,
                ),
                SizedBox(height: 15),
                const Text(
                  'Kategori',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                SizedBox(
                  height: Config.heightSize * 0.05,
                  child: ListView(
                    scrollDirection: Axis.horizontal,                  
                    children: List<Widget>.generate(medCat.length, (index) {
                      return Card(
                        margin: const EdgeInsets.only(right: 20),
                        color: Config.primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              FaIcon(
                                medCat[index]['icon'], 
                                color: Colors.white
                              ),
                              const SizedBox(
                                width: 20
                                ),
                              Text(
                                medCat[index]['category'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white
                                ),
                              ),
                            ],
                          )
                        ),
                      );
                    }),
                  ),
                ),
                Config.spaceSmall,
                const Text(
                  'Jadwal hari ini',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                const AppointmentCard(),
                Config.spaceSmall,
                const Text(
                  'Top Doctors',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                Column(
                  children: List.generate(10, (index) {
                    return const DoctorCard(
                      route: 'doc_details'
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
