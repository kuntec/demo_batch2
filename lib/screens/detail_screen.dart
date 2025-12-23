import 'package:demo_batch2/components/my_custom_button.dart';
import 'package:demo_batch2/constant/constants.dart';
import 'package:demo_batch2/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  String title;
  String description;
  DetailScreen({super.key, required this.title, required this.description});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Detail Screen"),
      ),
      body: Center(
        child: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "Title : ${widget.title}",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "Description : ${widget.description}",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: kMarginLarge),
                MyCustomButton(
                    title: "Back to Dashboard With Reset",
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    width: 200,
                    onClick: () {
                      Navigator.pop(context, true);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => DashboardScreen()));
                    }),
                SizedBox(height: kMarginLarge),
                MyCustomButton(
                    title: "Back to Dashboard Without Reset",
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    width: 200,
                    onClick: () {
                      Navigator.pop(context);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => DashboardScreen()));
                    })
              ],
            )),
      ),
    );
  }
}
