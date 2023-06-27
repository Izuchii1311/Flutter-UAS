import 'package:clothes_app/users/components/service_section.dart';
import 'package:flutter/material.dart';

import '../utils/config.dart';

class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 6,
            decoration: BoxDecoration(
              color: Config.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height:40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pelayanan Kami',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Colors.white
                      )
                    ),
                      Icon(
                      Icons.info,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 27),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'High Tech - High Touch, ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text: 'Komitmen kami untuk memberikan pelayanan yang terbaik bagi Anda',
                        style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic
                        ),
                      ),
                    ],
                  ),
                )
              ),
              SizedBox(height: 40),
              ServiceSection()
            ],
          ),
        ],
      ),
    );
  }
}
