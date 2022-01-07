// ignore: file_names
import 'package:flutter/material.dart';

class nextQue extends StatefulWidget {
  String srno;
  String Question;
  String MCQ_01;
  String MCQ_02, MCQ_03, MCQ_04, Desc_AK, MCQ_AK;

  nextQue(
      {this.Question,
      this.srno,
      this.MCQ_01,
      this.MCQ_02,
      this.MCQ_03,
      this.MCQ_04,
      this.MCQ_AK,
      this.Desc_AK});

  @override
  State<nextQue> createState() => _nextQueState();
}

class _nextQueState extends State<nextQue> {
  var _visible1 = false;
  Color colortoshow1 = Colors.yellowAccent[100];
  Color colortoshow2 = Colors.yellowAccent[100];
  Color colortoshow3 = Colors.yellowAccent[100];
  Color colortoshow4 = Colors.yellowAccent[100];
  Color right = Colors.green;
  Color wrong = Colors.red;

  void checkAnswer(String ans, int one) {
    if (widget.MCQ_AK == "A") {
      setState(() {
        colortoshow1 = right;
      });
    }

    if (widget.MCQ_AK == "B") {
      setState(() {
        colortoshow2 = right;
      });
    }

    if (widget.MCQ_AK == "C") {
      setState(() {
        colortoshow3 = right;
      });
    }

    if (widget.MCQ_AK == "D") {
      setState(() {
        colortoshow4 = right;
      });
    }

    if (ans != widget.MCQ_AK && one == 1) {
      setState(() {
        colortoshow1 = wrong;
      });
    }

    if (ans != widget.MCQ_AK && one == 2) {
      setState(() {
        colortoshow2 = wrong;
      });
    }

    if (ans != widget.MCQ_AK && one == 3) {
      setState(() {
        colortoshow3 = wrong;
      });
    }

    if (ans != widget.MCQ_AK && one == 4) {
      setState(() {
        colortoshow4 = wrong;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Affairs'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Text(
                widget.srno + '. ' + widget.Question,
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
                    'A)  ' + widget.MCQ_01,
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    checkAnswer("A", 1);
                    _visible1 = true;
                  }),
              MaterialButton(
                  minWidth: 400,
                  color: colortoshow2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0)),
                  child: Text(
                    'B)  ' + widget.MCQ_02,
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    checkAnswer("B", 2);
                    _visible1 = true;
                  }),
              MaterialButton(
                  minWidth: 400,
                  color: colortoshow3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0)),
                  child: Text(
                    'C)  ' + widget.MCQ_03,
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    checkAnswer("C", 3);
                    _visible1 = true;
                  }),
              MaterialButton(
                  minWidth: 400,
                  color: colortoshow4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0)),
                  child: Text(
                    'D)  ' + widget.MCQ_04,
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    checkAnswer("D", 4);
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
                          'Correct Answer is : ' + widget.MCQ_AK,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Container(
                        child: Text(
                          widget.Desc_AK,
                          style: TextStyle(fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ElevatedButton(onPressed: () {}, child: Text('Next Question'))
            ],
          )
        ],
      ),
    );
  }
}
