import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/config.dart';

class Success extends StatelessWidget {
  const Success({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  final String? title;
  final Null Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Lottie.asset('assets/successfully-done.json'),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text(
                "Successfully",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Config.primaryColor,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width - 20,
                      50,
                    ),
                  ),
                  onPressed: onPressed,
                  child: Text(title!),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}