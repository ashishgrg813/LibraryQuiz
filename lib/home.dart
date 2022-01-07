// ../lib/API/SimpleMethod/Que08_LoadLocalJson.dart
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter_libraryquiz/SearchByName.dart';

import 'Testpage.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  List data;
  final List<String> Years = ['2015', '2016', '2017', '2018', '2019'];
  final List<String> Months = ['Jan', 'Feb', 'March', 'April', 'May', 'June'];
  String _level;
  List<String> year = [];
  String selectedYear;
  String selectedMonth;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Current Affairs"),
        ),
        body: Column(
          children: [
            DropdownButton<String>(
              isExpanded: true,
              iconSize: 30.0,
              hint: Text('Select Year'),
              value: selectedYear,
              items: Years.map((value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  selectedYear = val;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            DropdownButton<String>(
              isExpanded: true,
              iconSize: 30.0,
              hint: Text('Select Month'),
              value: selectedMonth,
              items: Months.map((value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  selectedMonth = val;
                });
              },
            ),
            Row(
              children: [
                Text("Level: "),
                Radio(
                  value: "Low",
                  groupValue: _level,
                  onChanged: (value) {
                    setState(() {
                      _level = value;
                    });
                  },
                ),
                Text(
                  "Low",
                  style: TextStyle(),
                ),
                Radio(
                  value: "High",
                  groupValue: _level,
                  onChanged: (value) {
                    setState(() {
                      _level = value;
                    });
                  },
                ),
                Text("High    "),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green[300]),
                  ),
                  child: Text('Search Topics'),
                )
              ],
            ),
            Expanded(
              child: Container(
                child: FutureBuilder(
                    // future: DefaultAssetBundle.of(context) //rootBundle
                    future: rootBundle.loadString('assets/QueBank.json'),
                    builder: (context, snapshot) {
                      // Decode the JSON
                      var convertedJsonData =
                          json.decode(snapshot.data.toString());

                      return ListView.builder(
                        // Build the ListView
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Demo(
                                    srno: convertedJsonData[index]['srno']
                                        .toString(),
                                    Question: convertedJsonData[index]
                                        ['Question'],
                                    MCQ_01: convertedJsonData[index]['MCQ_O1'],
                                    MCQ_02: convertedJsonData[index]['MCQ_O2'],
                                    MCQ_03: convertedJsonData[index]['MCQ_O3'],
                                    MCQ_04: convertedJsonData[index]['MCQ_O4'],
                                    MCQ_AK: convertedJsonData[index]['MCQ_AK'],
                                    Desc_AK: convertedJsonData[index]
                                        ['Desc_AK'],
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Text(
                                    "Sr No: " +
                                        convertedJsonData[index]['srno']
                                            .toString(),
                                    style: TextStyle(fontSize: 15.0),
                                  ),
                                  Text(
                                    "Question: " +
                                        convertedJsonData[index]['Question'],
                                    style: TextStyle(fontSize: 15.0),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: convertedJsonData == null
                            ? 0
                            : convertedJsonData.length,
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
