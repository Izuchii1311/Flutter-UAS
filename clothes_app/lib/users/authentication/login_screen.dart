import 'dart:convert';

import 'package:clothes_app/users/authentication/registrasi_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../api_connection/api_connection.dart';
import '../utils/config.dart';
import '../pages/main_layouts.dart';
import '../model/user.dart';
import '../userPreferences/userPreferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isObscure = true.obs;

  loginUserNow() async {
    try {
      var res = await http.post(
        Uri.parse(API.login),
        body: {
          "user_email": emailController.text.trim(),
          "user_password": passwordController.text.trim(),
        },
      );

      if (res.statusCode == 200) {
        var resLogin = jsonDecode(res.body);

        if (resLogin['success'] == true) {
          Fluttertoast.showToast(msg: "Login Berhasil.");

          // parse Json data
          User userInfo = User.fromJson(resLogin['userData']);
          await RememberUserPrefs.storeUserInfo(userInfo);

          Future.delayed(Duration(milliseconds: 2000), () {
            Get.to(MainLayouts());
          });
        } else {
          Fluttertoast.showToast(msg: "Login Gagal.");
        }
      }
    } catch (e) {
      print("Error::" + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(height: 100),
                const Text(
                  "Login Akun",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Image.asset("assets/images/doctors.png"),
                ),
                SizedBox(height: 30),
                // Text
                const Text(
                  "Login dan masuk ke aplikasi.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 92, 92, 92),
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 25),
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Masukkan Email Anda...';
                    }
                    if (value.length < 6) {
                      return 'Email setidaknya harus memiliki minimal 6 karakter.';
                    }
                    if (!value.contains('@')) {
                      return 'Email harus mengandung simbol @.';
                    }
                    return null; // Validasi berhasil, tidak ada pesan kesalahan.
                  },
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    labelText: 'Email',
                    alignLabelWithHint: true,
                    prefixIcon: Icon(Icons.email_outlined),
                    prefixIconColor: Config.primaryColor,
                  ),
                ),
                const SizedBox(height: 18),
                Obx(() => TextFormField(
                      controller: passwordController,
                      obscureText: isObscure.value,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Masukkan Password Anda...';
                        }
                        if (value.length < 8) {
                          return 'Password harus memiliki minimal 8 karakter.';
                        }
                        return null; // Validasi berhasil, tidak ada pesan kesalahan.
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Password',
                        prefixIcon: const Icon(Icons.lock_outline),
                        prefixIconColor: Config.primaryColor,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            isObscure.value = !isObscure.value;
                          },
                          child: Icon(
                            isObscure.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )),
                const SizedBox(height: 18),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Config.primaryColor,
                      fixedSize: Size(
                        MediaQuery.of(context).size.width - 20,
                        50,
                      ),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        loginUserNow();
                      }
                    },
                    child: Text("Login"),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Belum punya akun? '),
                    TextButton(
                      onPressed: () {
                        Get.to(RegistrasiPage());
                      },
                      child: Text(
                        'Registrasi',
                        style: TextStyle(
                          color: Config.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    // Navigator.of(context).pushNamed('main');
                  },
                  child: const Text(
                    'Lupa Kata Sandi?',
                    style: TextStyle(
                      color: Config.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
