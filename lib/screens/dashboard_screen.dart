import 'package:demo_batch2/api/APICall.dart';
import 'package:demo_batch2/components/my_custom_button.dart';
import 'package:demo_batch2/constant/constants.dart';
import 'package:demo_batch2/models/GetAllServicesData.dart';
import 'package:demo_batch2/screens/all_services_screen.dart';
import 'package:demo_batch2/screens/detail_screen.dart';
import 'package:demo_batch2/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int? _counter;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _counter = 0;
  }

  void logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            title: Text("Dashboard"),
            actions: [
              IconButton(
                icon: Icon(Icons.logout),
                onPressed: logout,
              )
            ]),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyCustomButton(
                title: "All Services",
                backgroundColor: Colors.green,
                textColor: Colors.white,
                width: 150,
                onClick: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AllServicesScreen()));
                }),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: cardDecoration,
              child: Image.asset("assets/images/christmas.jpg"),
            ),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: cardDecoration,
              child: Image.network(
                "https://cdn.pixabay.com/photo/2024/11/10/10/32/christmas-9187543_1280.jpg",
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: cardDecoration,
              child: Column(
                children: [
                  Text(
                    "Counter $_counter",
                    style:
                        titleFont.copyWith(color: Colors.green, fontSize: 22),
                    // style: TextStyle(
                    //     fontSize: 20,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.orange),
                  ),
                  SizedBox(height: kMarginLarge),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyCustomButton(
                        title: "Increment",
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        onClick: () {
                          setState(() {
                            _counter = _counter! + 1;
                          });
                          print("Counter value: $_counter");
                        },
                      ),
                      MyCustomButton(
                        title: "Decrement",
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        onClick: () {
                          setState(() {
                            _counter = _counter! - 1;
                          });
                          print("Counter value: $_counter");
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: kMarginLarge),
            Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                decoration: cardDecoration,
                child: Column(
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: myInputDecoration.copyWith(hintText: "Title"),
                    ),
                    SizedBox(height: kMarginLarge),
                    TextField(
                      controller: descriptionController,
                      decoration:
                          myInputDecoration.copyWith(hintText: "Description"),
                    ),
                    SizedBox(height: kMarginLarge),
                    MyCustomButton(
                      title: "Go To Detail Screen",
                      backgroundColor: Colors.orange,
                      textColor: Colors.white,
                      width: 200,
                      onClick: () async {
                        print("Title : ${titleController.text}");
                        print("Description : ${descriptionController.text}");
                        var result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              title: titleController.text,
                              description: descriptionController.text,
                            ),
                          ),
                        );
                        print("Result = $result");
                        if (result) {
                          reset();
                        }
                        //reset();
                      },
                    ),
                  ],
                )),
            MyCustomButton(
                title: "Show Toast",
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                onClick: () async {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.red,
                    content: Text(
                      "This is a toast message",
                      style: TextStyle(fontSize: 20),
                    ),
                  ));
                  APICall apiCall = APICall();
                  GetAllServicesData data = await apiCall.getAllServices();
                  print(data.services![0].nameEn);
                }),
          ],
        )));
  }

  void reset() {
    setState(() {
      _counter = 0;
    });
    titleController.text = "";
    descriptionController.text = "";
  }
}
