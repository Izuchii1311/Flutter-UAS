import 'package:flutter/material.dart';

import '../pages/post/homePost_page.dart';
import '../utils/config.dart';

class ServiceSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        padding: EdgeInsets.all(25),
        crossAxisCount: 2,
        children: [
          Card(
            margin: EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Home()),
                // );
              },
              splashColor: Config.primaryColor,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/images/icon/manHealthWorker.png",
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Cataract Center",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                // 
              },
              splashColor: Config.primaryColor,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/images/icon/womanHealthWorker.png",
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Netra Diabetic Eye Center",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.orange,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                //
              },
              splashColor: Config.primaryColor,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/images/icon/medica_health.png",
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Retina Center",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                //
              },
              splashColor: Config.primaryColor,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/images/icon/hospital.png",
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Pelayanan BPJS",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                //
              },
              splashColor: Config.primaryColor,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/images/icon/pill.png",
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Pembelian Obat",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePost()),
                );
              },
              splashColor: Config.primaryColor,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/images/icon/postIcon.png",
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "News Post",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
