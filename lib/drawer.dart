import 'package:flutter/material.dart';
import 'package:flutter_libraryquiz/SearchByName.dart';
import 'package:flutter_libraryquiz/home.dart';

class DrawerMenu extends StatefulWidget {
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [Colors.white, Colors.blue],
                stops: [0.3, 1],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 90.0,
                  height: 90.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                ),
                Text(
                  'Current Affairs',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.add_circle, color: Colors.blueAccent),
            title: Text(
              'Home',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Dashboard()));
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.search, color: Colors.blueAccent),
          //   title: Text(
          //     'Search',
          //     style: TextStyle(fontWeight: FontWeight.bold),
          //   ),
          //   onTap: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => SearchScreen()));
          //   },
          // ),
          ListTile(
            leading: Icon(Icons.category, color: Colors.blueAccent),
            title: Text(
              'Categories',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.add_chart, color: Colors.blueAccent),
            title: Text(
              'About Us',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
