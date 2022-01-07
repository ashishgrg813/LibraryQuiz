import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  String srno;
  String Question;
  String MCQ_01;
  String MCQ_02, MCQ_03, MCQ_04, Desc_AK, MCQ_AK;

  Demo(
      {this.Question,
      this.srno,
      this.MCQ_01,
      this.MCQ_02,
      this.MCQ_03,
      this.MCQ_04,
      this.MCQ_AK,
      this.Desc_AK});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  var _visible1 = false;
  var _visible2 = false;
  Color colortoshow = Colors.yellowAccent[100];
  Color right = Colors.green;
  Color wrong = Colors.red;

  void checkanswer() {
    colortoshow = right;
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
                color: colortoshow,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0)),
                child: Text(
                  'A)  ' + widget.MCQ_01,
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  if (widget.MCQ_AK == 'A') {
                    String Answer = widget.MCQ_01;
                    if (widget.MCQ_01 == Answer) {
                      checkanswer();
                      debugPrint('correct Answer');
                    } else
                      debugPrint('Wrong Answer');
                  } else if (widget.MCQ_AK == 'B') {
                    String Answer = widget.MCQ_02;
                    if (widget.MCQ_01 == Answer) {
                      debugPrint('correct Answer');
                    } else
                      debugPrint('Wrong Answer');
                  } else if (widget.MCQ_AK == 'C') {
                    String Answer = widget.MCQ_03;
                    if (widget.MCQ_01 == Answer) {
                      debugPrint('correct Answer');
                    } else
                      debugPrint('Wrong Answer');
                  } else if (widget.MCQ_AK == 'D') {
                    String Answer = widget.MCQ_04;
                    if (widget.MCQ_01 == Answer) {
                      debugPrint('correct Answer');
                    } else
                      debugPrint('Wrong Answer');
                  }
                  setState(() {
                    _visible1 = !_visible1;
                  });
                },
              ),
              MaterialButton(
                minWidth: 400,
                color: colortoshow,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0)),
                child: Text(
                  'B)  ' + widget.MCQ_02,
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  if (widget.MCQ_AK == 'A') {
                    String Answer = widget.MCQ_01;
                    if (widget.MCQ_02 == Answer) {
                      debugPrint('correct Answer');
                    } else
                      debugPrint('Wrong Answer');
                  } else if (widget.MCQ_AK == 'B') {
                    String Answer = widget.MCQ_02;
                    if (widget.MCQ_02 == Answer) {
                      debugPrint('correct Answer');
                    } else
                      debugPrint('Wrong Answer');
                  } else if (widget.MCQ_AK == 'C') {
                    String Answer = widget.MCQ_03;
                    if (widget.MCQ_02 == Answer) {
                      debugPrint('correct Answer');
                    } else
                      debugPrint('Wrong Answer');
                  } else if (widget.MCQ_AK == 'D') {
                    String Answer = widget.MCQ_04;
                    if (widget.MCQ_02 == Answer) {
                      debugPrint('correct Answer');
                    } else
                      debugPrint('Wrong Answer');
                  }
                  setState(() {
                    _visible1 = !_visible1;
                  });
                },
              ),
              MaterialButton(
                minWidth: 400,
                color: colortoshow,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0)),
                child: Text(
                  'C)  ' + widget.MCQ_03,
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  if (widget.MCQ_AK == 'A') {
                    String Answer = widget.MCQ_01;
                    if (widget.MCQ_03 == Answer) {
                      debugPrint('correct Answer');
                    } else
                      debugPrint('Wrong Answer');
                  } else if (widget.MCQ_AK == 'B') {
                    String Answer = widget.MCQ_02;
                    if (widget.MCQ_03 == Answer) {
                      debugPrint('correct Answer');
                    } else
                      debugPrint('Wrong Answer');
                  } else if (widget.MCQ_AK == 'C') {
                    String Answer = widget.MCQ_03;
                    if (widget.MCQ_03 == Answer) {
                      debugPrint('correct Answer');
                    } else
                      debugPrint('Wrong Answer');
                  } else if (widget.MCQ_AK == 'D') {
                    String Answer = widget.MCQ_04;
                    if (widget.MCQ_03 == Answer) {
                      debugPrint('correct Answer');
                    } else
                      debugPrint('Wrong Answer');
                  }
                  setState(() {
                    _visible1 = !_visible1;
                  });
                },
              ),
              MaterialButton(
                minWidth: 400,
                color: colortoshow,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0)),
                child: Text(
                  'D)  ' + widget.MCQ_04,
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  if (widget.MCQ_AK == 'A') {
                    String Answer = widget.MCQ_01;
                    if (widget.MCQ_04 == Answer) {
                      debugPrint('correct Answer');
                    } else
                      debugPrint('Wrong Answer');
                  } else if (widget.MCQ_AK == 'B') {
                    String Answer = widget.MCQ_02;
                    if (widget.MCQ_04 == Answer) {
                      debugPrint('correct Answer');
                    } else
                      debugPrint('Wrong Answer');
                  } else if (widget.MCQ_AK == 'C') {
                    String Answer = widget.MCQ_03;
                    if (widget.MCQ_04 == Answer) {
                      debugPrint('correct Answer');
                    } else
                      debugPrint('Wrong Answer');
                  } else if (widget.MCQ_AK == 'D') {
                    String Answer = widget.MCQ_04;
                    if (widget.MCQ_04 == Answer) {
                      debugPrint('correct Answer');
                    } else
                      debugPrint('Wrong Answer');
                  }
                  setState(() {
                    _visible1 = !_visible1;
                  });
                },
              ),
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
              )
            ],
          )
        ],
      ),
    );
  }
}
