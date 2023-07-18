import 'package:flutter/material.dart';
import 'package:trail_library/screens/aboutus.dart';
import 'package:trail_library/screens/gallery.dart';
import 'package:trail_library/screens/newsa.dart';

class MyHomePage extends StatefulWidget {
  //final String title;
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facebook'),
      ),
      body: Column(
        children: [
          Text("Hello"),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(
          Icons.motorcycle,
          color: Colors.green,
          size: 30,
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AboutUs()));
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Gallery()));
                },
                icon: Icon(
                  Icons.assignment_turned_in,
                  color: Colors.red,
                  size: 30.0,
                )),
                IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewsA()));
                },
                icon: Icon(
                  Icons.comment,
                  color: Colors.red,
                  size: 30.0,
                ))
          ],
        ),
      ),
    );
  }
}
