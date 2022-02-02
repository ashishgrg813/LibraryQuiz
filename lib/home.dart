// ../lib/API/SimpleMethod/Que08_LoadLocalJson.dart
// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_constructors_in_immutables

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter_libraryquiz/SearchByName.dart';
import 'package:flutter_libraryquiz/drawer.dart';

import 'Testpage.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  List data;
  final List<String> Years = [
    'Select All',
    '2015',
    '2016',
    '2017',
    '2018',
    '2021'
  ];
  // List<KeyValueModel> Months = [
  //   KeyValueModel(key: '0', value: 'Select All'),
  //   KeyValueModel(key: '1', value: 'Jan'),
  //   KeyValueModel(key: '0', value: 'Feb'),
  // ];
  final List<String> Months = [
    'Select All',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12'
  ];

  String _level;
  dynamic questions = [];
  List<String> year = [];
  List convertedJsonData;
  List convertedJsonData1;
  List convertedJsonData2;
  String selectedYear;
  String selectedMonth;

  // @override
  // void initState() {
  //   super.initState();
  //   loadJson();
  // }

  // loadJson() async {
  //   String data = await rootBundle.loadString('assets/QueBank.json');
  //   convertedJsonData = json.decode(data);
  // }

  fetchdata() async {
    var data = await rootBundle.loadString('assets/QueBank.json');
    convertedJsonData = json.decode(data);
    if (selectedYear != null && selectedYear != 'Select All') {
      convertedJsonData = convertedJsonData
          .where((element) =>
              element['yr1'].toString().toLowerCase() ==
              (selectedYear.toLowerCase()))
          .toList();
    }
    if (selectedMonth != null && selectedMonth != 'Select All') {
      convertedJsonData = convertedJsonData
          .where((element) =>
              element['Mon1'].toString().toLowerCase() ==
              (selectedMonth.toLowerCase()))
          .toList();
    }
  }

  void filterdate() {
    if (selectedYear != null && selectedYear != 'Select All') {
      convertedJsonData = convertedJsonData
          .where((element) => element['yr1']
              .toString()
              .toLowerCase()
              .contains(selectedYear.toLowerCase()))
          .toList();
    }
  }

  void filtermonth() {
    if (selectedMonth != null && selectedMonth != 'Select All') {
      convertedJsonData = convertedJsonData
          .where((element) => element['Mon1']
              .toString()
              .toLowerCase()
              .contains(selectedMonth.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: DrawerMenu(),
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
                  selectedMonth = Months[0];
                  filterdate();
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
                  filtermonth();
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
                    child: Text('Search Topics'),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green[300]),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SearchScreen()));
                    })
              ],
            ),
            Expanded(
              child: Container(
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
                                          convertedJsonData[index]['Question'],
                                      style: TextStyle(fontSize: 15.0),
                                    ),
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

// class KeyValueModel {
//   String key;
//   String value;

//   KeyValueModel({this.key, this.value});
// }
