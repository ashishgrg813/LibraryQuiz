// ignore: file_names
// ignore_for_file: avoid_unnecessary_containers, file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'model.dart';

class Demo extends StatefulWidget {
  String yr;
  String mon;

  Demo({this.mon, this.yr});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  List<Quebank> convertedJsonData;
  int index = 0;

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

    if (widget.mon != 'Select All' && widget.mon != "0") {
      convertedJsonData = convertedJsonData
          .where((element) =>
              element.mon1.toString().toLowerCase() == (widget.mon))
          .toList();
    }
    setState(() {});
  }

  String MCQ_AK;
  var _visible1 = false;
  Color colortoshow1 = Colors.yellowAccent[100];
  Color colortoshow2 = Colors.yellowAccent[100];
  Color colortoshow3 = Colors.yellowAccent[100];
  Color colortoshow4 = Colors.yellowAccent[100];
  Color right = Colors.green;
  Color wrong = Colors.red;
  Color reset = Colors.yellowAccent[100];

  void checkAnswer(String ans, int one, String actans) {
    if (actans == "A") {
      setState(() {
        colortoshow1 = right;
      });
    }

    if (actans == "B") {
      setState(() {
        colortoshow2 = right;
      });
    }

    if (actans == "C") {
      setState(() {
        colortoshow3 = right;
      });
    }

    if (actans == "D") {
      setState(() {
        colortoshow4 = right;
      });
    }

    if (ans != actans && one == 1) {
      setState(() {
        colortoshow1 = wrong;
      });
    }

    if (ans != actans && one == 2) {
      setState(() {
        colortoshow2 = wrong;
      });
    }

    if (ans != actans && one == 3) {
      setState(() {
        colortoshow3 = wrong;
      });
    }

    if (ans != actans && one == 4) {
      setState(() {
        colortoshow4 = wrong;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchdata();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Affairs'),
      ),
      body: convertedJsonData == null
          ? Center(
              child: CircularProgressIndicator(
              backgroundColor: Colors.blue,
              strokeWidth: 6.0,
              color: Colors.green,
            ))
          : Container(
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      child: Text(
                        'Question:  ' + convertedJsonData[index]?.question,
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  Column(
                    children: [
                      MaterialButton(
                          minWidth: 400,
                          color: colortoshow1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22.0)),
                          child: Text(
                            'A)  ' + convertedJsonData[index]?.mcqO1,
                            style: TextStyle(fontSize: 18),
                          ),
                          onPressed: () {
                            checkAnswer(
                                "A", 1, convertedJsonData[index]?.mcqAk);
                            _visible1 = true;
                          }),
                      MaterialButton(
                          minWidth: 400,
                          color: colortoshow2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22.0)),
                          child: Text(
                            'B)  ' + convertedJsonData[index]?.mcqO2,
                            style: TextStyle(fontSize: 18),
                          ),
                          onPressed: () {
                            checkAnswer(
                                "B", 2, convertedJsonData[index]?.mcqAk);
                            _visible1 = true;
                          }),
                      MaterialButton(
                          minWidth: 400,
                          color: colortoshow3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22.0)),
                          child: Text(
                            'C)  ' + convertedJsonData[index]?.mcqO3,
                            style: TextStyle(fontSize: 18),
                          ),
                          onPressed: () {
                            checkAnswer(
                                "C", 3, convertedJsonData[index]?.mcqAk);
                            _visible1 = true;
                          }),
                      MaterialButton(
                          minWidth: 400,
                          color: colortoshow4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22.0)),
                          child: Text(
                            'D)  ' + convertedJsonData[index]?.mcqO4,
                            style: TextStyle(fontSize: 18),
                          ),
                          onPressed: () {
                            checkAnswer(
                                "D", 4, convertedJsonData[index]?.mcqAk);
                            _visible1 = true;
                          }),
                      Visibility(
                        visible: _visible1,
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            children: [
                              Container(
                                child: Text(
                                  'Correct Answer is : ' +
                                      convertedJsonData[index]?.mcqAk,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Container(
                                child: Text(
                                  convertedJsonData[index]?.descAk,
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          if (index != 0) {
                                            index = index - 1;
                                          }
                                          colortoshow1 = colortoshow2 =
                                              colortoshow3 =
                                                  colortoshow4 = reset;
                                          _visible1 = false;
                                        });
                                      },
                                      child: Text('Previous',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                          )),
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.red)),
                                    ),
                                    Expanded(child: Center()),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          index = index + 1;
                                          colortoshow1 = colortoshow2 =
                                              colortoshow3 =
                                                  colortoshow4 = reset;
                                          _visible1 = false;
                                        });
                                      },
                                      child: Text('Next',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                          )),
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.green)),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
