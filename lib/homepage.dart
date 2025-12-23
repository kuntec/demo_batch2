import 'package:demo_batch2/components/my_custom_button.dart';
import 'package:demo_batch2/constant/constants.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text("Homepage"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Register",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  )),
              SizedBox(height: 20),
              TextField(
                decoration: myInputDecoration.copyWith(hintText: "First Name"),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: myInputDecoration.copyWith(hintText: "Last Name"),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: myInputDecoration.copyWith(hintText: "Email"),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: myInputDecoration.copyWith(hintText: "Password"),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyCustomButton(
                    title: "Register",
                    backgroundColor: Colors.blue,
                    textColor: Colors.white,
                    width: 200,
                    onClick: () {
                      print("Register button clicked");
                    },
                  ),
                  MyCustomButton(
                    title: "Cancel",
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    onClick: () {
                      print("Cancel button clicked");
                    },
                  ),
                  //  ElevatedButton(onPressed: () {}, child: Text("Register")),
                  // ElevatedButton(onPressed: () {}, child: Text("Cancel")),
                ],
              ),
              SizedBox(height: 20),
              Text("Forgot Password?"),
              SizedBox(height: 20),
              //MyCustomButton(),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: Colors.grey,
        height: 100,
      ),
    );
  }
}
