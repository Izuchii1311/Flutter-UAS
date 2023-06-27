import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../userPreferences/current_user.dart';
import 'jadwal_page.dart';
import 'home_page.dart';
import 'services_page.dart';
import 'profile_page.dart';

class MainLayouts extends StatelessWidget {
  final CurrentUser _rememberCurrentUser = Get.put(CurrentUser());
  final PageController _page = PageController();
  
  final List<Widget> _fragmentScreens = [
    HomePage(),
    JadwalPage(),
    ServicesPage(),
    ProfilePage(),
  ];

  final List<Map<String, dynamic>> _navigationButtonsProperties = [
    {
      "active_icon": Icons.home,
      "non_active_icon": Icons.home_outlined,
      "label": "Home",
    },
    {
      "active_icon": Icons.article,
      "non_active_icon": Icons.article_outlined,
      "label": "Jadwal",
    },
    {
      "active_icon": FontAwesomeIcons.boxOpen,
      "non_active_icon": FontAwesomeIcons.box,
      "label": "Services",
    },
    {
      "active_icon": Icons.person,
      "non_active_icon": Icons.person_outline,
      "label": "Profile",
    },
  ];

  final RxInt _indexnumber = 0.obs;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CurrentUser>(
      init: _rememberCurrentUser,
      initState: (currentState) {
        _rememberCurrentUser.getUserInfo();
      },
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Obx(
              () => _fragmentScreens[_indexnumber.value],
            ),
          ),
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              currentIndex: _indexnumber.value,
              onTap: (value) {
                _indexnumber.value = value;
                  _page.animateToPage(
                    value,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                );
              },
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: Colors.white,
              unselectedItemColor: Color.fromARGB(59, 66, 66, 66),
              items: List.generate(4, (index) {
                final navBtnProperty = _navigationButtonsProperties[index];
                return BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  icon: Icon(navBtnProperty["non_active_icon"]),
                  activeIcon: Icon(navBtnProperty['active_icon']),
                  label: navBtnProperty['label'],
                );
              }),
            ),
          ),
        );
      },
    );
  }
}