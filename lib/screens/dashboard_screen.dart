import 'package:demo_batch2/components/my_custom_button.dart';
import 'package:demo_batch2/constant/constants.dart';
import 'package:demo_batch2/screens/detail_screen.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          title: Text("Dashboard"),
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: cardDecoration,
              child: Column(
                children: [
                  Text(
                    "Counter $_counter",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
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
