import 'package:demo_batch2/components/my_custom_button.dart';
import 'package:demo_batch2/constant/constants.dart';
import 'package:demo_batch2/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool? isLogin = preferences.getBool("isLoggedIn");
    if (isLogin == true) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => DashboardScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            TextField(
              decoration: myInputDecoration.copyWith(hintText: "Email"),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: myInputDecoration.copyWith(hintText: "Password"),
            ),
            SizedBox(height: 20),
            MyCustomButton(
              title: "Login",
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              onClick: () async {
                print("Login button clicked");

                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                preferences.setBool("isLoggedIn", true);
                preferences.setString("username", "John");
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => DashboardScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
