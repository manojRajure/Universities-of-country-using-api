import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:information_app/home.dart';

class MyResult extends StatefulWidget {
  const MyResult({super.key});

  @override
  State<MyResult> createState() => _MyResultState();
}

class _MyResultState extends State<MyResult> {
  var country = MyHome.countryName;
  var session = [];
  int ListC = 0;
  @override
  void initState() {
    print('result page open');
    getData();
    // TODO: implement initState
    super.initState();
  }

  getData() async {
    var url =
        Uri.parse('http://universities.hipolabs.com/search?country=$country');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      session = jsonDecode(response.body);
      print(session);
      setState(() {
        ListC = session.length;
      });
      return session;
    } else {
      throw Exception('Failed to load country data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Result'),
        centerTitle: true,
        shadowColor: Color.fromARGB(255, 13, 66, 3),
        elevation: 10,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: ListC,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(top: 20, right: 10, left: 10),
              child: Container(
                margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                height: 100,
                child: Card(
                  elevation: 8,
                  shadowColor: Color.fromARGB(255, 7, 75, 13),
                  color: const Color.fromARGB(255, 213, 251, 247),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'College Name:',
                            style: GoogleFonts.lato().copyWith(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            session[index]['name'].toString(),
                            style: GoogleFonts.lato().copyWith(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'State:',
                            style: GoogleFonts.lato().copyWith(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            session[index]['state-province'].toString(),
                            style: GoogleFonts.lato().copyWith(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        session[index]['web_pages'].toString(),
                        style: GoogleFonts.lato().copyWith(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
