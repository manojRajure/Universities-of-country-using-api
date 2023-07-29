import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});
  static var countryName = "";
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Colleges',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        shadowColor: Color.fromARGB(255, 13, 66, 3),
        elevation: 10,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                MyHome.countryName = value;
              },
              decoration: InputDecoration(
                labelText: 'Enter Country Name',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Material(
              color: Colors.teal,
              elevation: 10,
              shadowColor: Color.fromARGB(255, 13, 66, 3),
              borderRadius: BorderRadius.circular(20),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'result');
                },
                child: Text(
                  'Search',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
