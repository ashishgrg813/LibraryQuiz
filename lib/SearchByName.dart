// // ignore_for_file: use_key_in_widget_constructors, unnecessary_new, unused_local_variable, prefer_const_constructors, file_names

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'dart:convert';

// import 'package:flutter_libraryquiz/Testpage.dart';

// class SearchScreen extends StatefulWidget {
//   SearchScreenState createState() => SearchScreenState();
// }

// class SearchScreenState extends State<SearchScreen> {
//   List persons = [];
//   List original = [];
//   TextEditingController txtQuery = new TextEditingController();

//   void loadData() async {
//     String jsonStr = await rootBundle.loadString('assets/QueBank.json');
//     var json = jsonDecode(jsonStr);
//     persons = json; //one will be used to build the list
//     original = json; // second will be used to search
//     setState(() {});
//   }

//   void search(String query) {
//     if (query.isEmpty) {
//       persons = original;
//       setState(() {});
//       return;
//     }

//     query = query.toLowerCase();
//     //print(query);
//     List result = [];
//     persons.forEach((p) {
//       var name = p["Question"].toString().toLowerCase();
//       if (name.contains(query)) {
//         result.add(p);
//       }
//     });

//     persons = result;
//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();

//     loadData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Search Topics'),
//       ),
//       body: Column(
//           // mainAxisSize: MainAxisSize.max,
//           // mainAxisAlignment: MainAxisAlignment.start,
//           // crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               margin: EdgeInsets.all(10),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 10),
//                   TextFormField(
//                     controller: txtQuery,
//                     onChanged: search,
//                     decoration: InputDecoration(
//                       hintText: "Search By Subject",
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(4.0)),
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black)),
//                       prefixIcon: Icon(Icons.search),
//                       suffixIcon: IconButton(
//                         icon: Icon(Icons.clear),
//                         onPressed: () {
//                           txtQuery.text = '';
//                           search(txtQuery.text);
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             _listView(persons)
//           ]),
//     );
//   }
// }

// Widget _listView(persons) {
//   final valTxt = TextStyle(
//       fontSize: 10.0, color: Colors.black, fontWeight: FontWeight.bold);

//   final valTxt2 = TextStyle(
//       fontSize: 10.0, color: Colors.green, fontWeight: FontWeight.bold);
//   return Expanded(
//     child: ListView.builder(
//         itemCount: persons.length,
//         itemBuilder: (context, index) {
//           var person = persons[index];
//           return GestureDetector(
//             onTap: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) => Demo(
//                     srno: persons[index]['srno'].toString(),
//                     Question: persons[index]['Question'],
//                     MCQ_01: persons[index]['MCQ_O1'],
//                     MCQ_02: persons[index]['MCQ_O2'],
//                     MCQ_03: persons[index]['MCQ_O3'],
//                     MCQ_04: persons[index]['MCQ_O4'],
//                     MCQ_AK: persons[index]['MCQ_AK'],
//                     Desc_AK: persons[index]['Desc_AK'],
//                   ),
//                 ),
//               );
//             },
//             child: Card(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: <Widget>[
//                   // Text(
//                   //   "Sr No: " + persons[index]['srno'].toString(),
//                   //   style: TextStyle(fontSize: 15.0),
//                   // ),
//                   Text(
//                     "Question: " + persons[index]['Question'],
//                     style: TextStyle(fontSize: 15.0),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }),
//   );
// }
