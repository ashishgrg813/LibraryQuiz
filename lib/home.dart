// ../lib/API/SimpleMethod/Que08_LoadLocalJson.dart
// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_constructors_in_immutables

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter_libraryquiz/SearchByName.dart';
import 'package:flutter_libraryquiz/drawer.dart';
import 'package:flutter_libraryquiz/model.dart';
import 'package:flutter_libraryquiz/nextpage.dart';

import 'Testpage.dart';
import 'month.dart';

// class KeyValueModel {
//   String key;
//   String value;

//   KeyValueModel({this.key, this.value});
// }

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  List<Quebank> convertedJsonData;
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
  //   KeyValueModel(key: '2', value: 'Feb'),
  // ];
  //  Map<String, String> Months={
  //   'Select All': 'JAN',

  // }

  // final List<String> Months = [
  //   'Select All',
  //   '1',
  //   '2',
  //   '3',
  //   '4',
  //   '5',
  //   '6',
  //   '7',
  //   '8',
  //   '9',
  //   '10',
  //   '11',
  //   '12'
  // ];

  String _level;
  dynamic questions = [];
  List<String> year = [];
  //List convertedJsonData;
//  List<Quebank> convertedJsonData1;
  List convertedJsonData2;
  List<Month> monthdata;
  String selectedYear;
  String selectedMonth;

  // @override
  // void initState() {
  //   super.initState();
  //   loadJson();
  // }

  // loadJson() async {
  //   String data = await rootBundle.loadString('assets/QueBank.json');
  //   convertedJsonData = quebankFromJson(data);
  // }

  Future<List<Month>> fetchmonth() async {
    String data = await rootBundle.loadString('assets/month.json');
    setState(() {
      monthdata = monthFromJson(data);
    });
    return monthdata;
  }

  // Future<List<Quebank>> fetchdata() async {
  //   String data = await rootBundle.loadString('assets/QueBank.json');
  //   convertedJsonData = quebankFromJson(data);

  //   // var data = await rootBundle.loadString('assets/QueBank.json');
  //   // convertedJsonData = json.decode(data);
  //   if (selectedYear != null && selectedYear != 'Select All') {
  //     convertedJsonData = convertedJsonData
  //         .where((element) =>
  //             element.yr1.toString().toLowerCase() ==
  //             (selectedYear.toLowerCase()))
  //         .toList();
  //   }
  //   if (selectedMonth != null && selectedMonth != 'Select All') {
  //     convertedJsonData = convertedJsonData
  //         .where((element) =>
  //             element.mon1.toString().toLowerCase() ==
  //             (selectedMonth.toLowerCase()))
  //         .toList();
  //   }
  // }

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
  void initState() {
    // TODO: implement initState
    fetchmonth();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: DrawerMenu(),
        appBar: AppBar(
          title: Text("Current Affairs",
              style: TextStyle(
                fontSize: 22.0,
              )),
        ),
        body: Container(
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(colors: [
          //     Color(0xFF68988c),
          //     Color(0xFF68988c),
          //     Color(0xFF687bcc),
          //     Color(0xFFfe6a97),
          //     Color(0xFFe17763),
          //     Color(0xFF555ebd),
          //   ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          // ),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(15)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Please select Year and Month',
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(15)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<String>(
                  isExpanded: true,
                  iconSize: 30.0,
                  hint: Text(
                    'Select Year',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),
                  ),
                  value: selectedYear,
                  items: Years.map((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,
                          style: TextStyle(
                            fontSize: 22.0,
                          )),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      selectedYear = val;
                      //selectedMonth = monthdata[0].month;
                      //filterdate();
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: DropdownButton<String>(
                  isExpanded: true,
                  iconSize: 30.0,
                  hint: Text(
                    'Select Month',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),
                  ),
                  value: selectedMonth,
                  items: monthdata?.map((value) {
                    return DropdownMenuItem<String>(
                      child: Text(value.month,
                          style: TextStyle(
                            fontSize: 22.0,
                          )),
                      value: value.value.toString(),
                    );
                  })?.toList(),
                  onChanged: (val) {
                    setState(() {
                      selectedMonth = val;
                      //filtermonth();
                    });
                  },
                ),
              ),
              Padding(padding: EdgeInsets.all(15)),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Demo(
                              yr: selectedYear,
                              mon: selectedMonth,
                            )));
                  },
                  child: Text('Submit',
                      style: TextStyle(
                        fontSize: 22.0,
                      )))

              // Row(
              //   children: [
              //     Text("Level: "),
              //     Radio(
              //       value: "Low",
              //       groupValue: _level,
              //       onChanged: (value) {
              //         setState(() {
              //           _level = value;
              //         });
              //       },
              //     ),
              //     Text(
              //       "Low",
              //       style: TextStyle(),
              //     ),
              //     Radio(
              //       value: "High",
              //       groupValue: _level,
              //       onChanged: (value) {
              //         setState(() {
              //           _level = value;
              //         });
              //       },
              //     ),
              //     Text("High    "),
              //     ElevatedButton(
              //         child: Text('Search Topics'),
              //         style: ButtonStyle(
              //           backgroundColor:
              //               MaterialStateProperty.all<Color>(Colors.green[300]),
              //         ),
              //         onPressed: () {
              //           Navigator.of(context).push(MaterialPageRoute(
              //               builder: (context) => SearchScreen()));
              //         })
              //   ],
              // ),
              ,
              // Expanded(
              //   child: Container(
              // child: FutureBuilder(
              //     // future: DefaultAssetBundle.of(context) //rootBundle
              //     future: fetchdata(),
              //     builder: (context, snapshot) {
              //       // Decode the JSON
              //       return ListView.builder(
              //         // Build the ListView
              //         itemBuilder: (BuildContext context, int index) {
              //           return GestureDetector(
              //             onTap: () {
              //               Navigator.of(context).push(
              //                 MaterialPageRoute(
              //                   builder: (context) => Demo(
              //                     srno: convertedJsonData[index]
              //                         .srno
              //                         .toString(),
              //                     Question: convertedJsonData[index].question,
              //                     MCQ_01: convertedJsonData[index].mcqO1,
              //                     MCQ_02: convertedJsonData[index].mcqO2,
              //                     MCQ_03: convertedJsonData[index].mcqO3,
              //                     MCQ_04: convertedJsonData[index].mcqO4,
              //                     MCQ_AK: convertedJsonData[index].mcqAk,
              //                     Desc_AK: convertedJsonData[index].descAk,
              //                   ),
              //                 ),
              //               );
              //             },
              //             child: Card(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.stretch,
              //                 children: <Widget>[
              //                   // Text(
              //                   //   "Sr No: " +
              //                   //       convertedJsonData[index]['srno']
              //                   //           .toString(),
              //                   //   style: TextStyle(fontSize: 15.0),
              //                   // ),
              //                   Padding(
              //                     padding: const EdgeInsets.all(8.0),
              //                     child: Text(
              //                       "Question: " +
              //                           convertedJsonData[index].question,
              //                       style: TextStyle(fontSize: 15.0),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           );
              //         },
              //         itemCount: convertedJsonData == null
              //             ? 0
              //             : convertedJsonData.length,
              //       );
              //     }),
              //       ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
