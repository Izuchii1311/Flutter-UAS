import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../api_connection/api_connection.dart';
import '../utils/config.dart';
import '../model/user.dart';
import 'login_screen.dart';

class RegistrasiPage extends StatefulWidget {
  const RegistrasiPage({Key? key}) : super(key: key);

  @override
  _RegistrasiPageState createState() => _RegistrasiPageState();
}

class _RegistrasiPageState extends State<RegistrasiPage> {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isObscure = true.obs;

  Future<void> validateUserEmail() async {
    try {
      var res = await http.post(
        Uri.parse(API.validasiEmail),
        // body: {
        //   'user_email': emailController.text.trim(),
        // },
      );

      if (res.statusCode == 200) {
        var resValidate = jsonDecode(res.body);

        if (resValidate['emailFound'] == true) {
          Fluttertoast.showToast(
            msg: "Email sudah digunakan, silahkan gunakan email lain.",
          );
        } else {
          registerAndSaveUserRecord();
        }
      } else {
        Fluttertoast.showToast(
          msg: "Registrasi Gagal.",
        );
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(
        msg: "An error occurred. Please try again.",
      );
    }
  }

  Future<void> registerAndSaveUserRecord() async {
    User userModel = User(
      1,
      nameController.text.trim(),
      emailController.text.trim(),
      passwordController.text.trim(),
    );

    try {
      var res = await http.post(
        Uri.parse(API.registrasi),
        body: userModel.toJson(),
      );

      if (res.statusCode == 200) {
        var resRegistrasi = jsonDecode(res.body);

        if (resRegistrasi['success'] == true) {
          Fluttertoast.showToast(msg: "Registrasi Berhasil.");
          setState(() {
            nameController.clear();
            emailController.clear();
            passwordController.clear();
          });
          Get.to(LoginScreen());
        } else {
          Fluttertoast.showToast(msg: "Registrasi Gagal.");
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
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
                // Title
                const Text(
                  "Buat Akun Baru",
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
                  "Daftar dan Masuk sebagai pengguna baru.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 92, 92, 92),
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 25),
                TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Masukkan Nama Anda...';
                    }
                    if (value.length < 3) {
                      return 'Nama harus memiliki minimal 3 karakter.';
                    }
                    if (value.contains(RegExp(r'\d'))) {
                      return 'Nama tidak boleh mengandung angka.';
                    }
                    return null; // Validasi berhasil, tidak ada pesan kesalahan.
                  },
                  decoration: const InputDecoration(
                    hintText: 'Nama Lengkap',
                    labelText: 'Nama Lengkap',
                    alignLabelWithHint: true,
                    prefixIcon: Icon(Icons.person_outlined),
                    prefixIconColor: Config.primaryColor,
                  ),
                ),
                const SizedBox(height: 18),
                // Email
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
                // Password
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
                        validateUserEmail();
                      }
                    },
                    child: Text("Registrasi"),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Sudah punya akun? '),
                    TextButton(
                      onPressed: () {
                        Get.to(LoginScreen());
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Config.primaryColor,
                        ),
                      ),
                    ),
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
