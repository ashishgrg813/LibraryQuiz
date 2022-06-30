import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter_libraryquiz/SearchByName.dart';
import 'package:flutter_libraryquiz/drawer.dart';
import 'package:flutter_libraryquiz/model.dart';

import 'Testpage.dart';

class nextpage extends StatefulWidget {
  String yr;
  String mon;

  nextpage({this.mon, this.yr});

  @override
  State<nextpage> createState() => _nextpageState();
}

class _nextpageState extends State<nextpage> {
  List<Quebank> convertedJsonData;
  dynamic questions = [];
  List<String> year = [];
  //List convertedJsonData;
//  List<Quebank> convertedJsonData1;
  List convertedJsonData2;
  String selectedYear;
  String selectedMonth;

  Future<List<Quebank>> fetchdata() async {
    String data = await rootBundle.loadString('assets/QueBank.json');
    convertedJsonData = quebankFromJson(data);

    // var data = await rootBundle.loadString('assets/QueBank.json');
    // convertedJsonData = json.decode(data);
    if (widget.yr != 'Select All') {
      convertedJsonData = convertedJsonData
          .where(
              (element) => element.yr1.toString().toLowerCase() == (widget.yr))
          .toList();
    }
    if (widget.mon != 'Select All') {
      convertedJsonData = convertedJsonData
          .where((element) =>
              element.mon1.toString().toLowerCase() == (widget.mon))
          .toList();
    }
    setState(() {});
  }

  // void filterdate() {
  //   if (selectedYear != null && selectedYear != 'Select All') {
  //     convertedJsonData = convertedJsonData
  //         .where((element) => element.yr1
  //             .toString()
  //             .toLowerCase()
  //             .contains(selectedYear.toLowerCase()))
  //         .toList();
  //   }
  // }

  // void filtermonth() {
  //   if (selectedMonth != null && selectedMonth != 'Select All') {
  //     convertedJsonData = convertedJsonData
  //         .where((element) => element.mon1
  //             .toString()
  //             .toLowerCase()
  //             .contains(selectedMonth.toLowerCase()))
  //         .toList();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Current Affairs",
              style: TextStyle(
                fontSize: 22.0,
              )),
        ),
        body: Container(
          child: FutureBuilder(
              // future: DefaultAssetBundle.of(context) //rootBundle
              future: fetchdata(),
              builder: (context, snapshot) {
                // Decode the JSON
                return ListView.builder(
                  // Build the ListView
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Demo(
                              srno: convertedJsonData[index].srno.toString(),
                              Question: convertedJsonData[index].question,
                              MCQ_01: convertedJsonData[index].mcqO1,
                              MCQ_02: convertedJsonData[index].mcqO2,
                              MCQ_03: convertedJsonData[index].mcqO3,
                              MCQ_04: convertedJsonData[index].mcqO4,
                              MCQ_AK: convertedJsonData[index].mcqAk,
                              Desc_AK: convertedJsonData[index].descAk,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            // Text(
                            //   "Sr No: " +
                            //       convertedJsonData[index]['srno']
                            //           .toString(),
                            //   style: TextStyle(fontSize: 15.0),
                            // ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Question: " +
                                    convertedJsonData[index].question,
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount:
                      convertedJsonData == null ? 0 : convertedJsonData.length,
                );
              }),
        ),
      ),
    );
  }
}
