import 'package:flutter/material.dart';
import 'package:s2w/screens/postImage.dart';


class PostOnBoard extends StatefulWidget {
  const PostOnBoard({super.key});

  @override
  State<PostOnBoard> createState() => _PostOnBoardState();
}

class _PostOnBoardState extends State<PostOnBoard> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    //Container(),
    Text('POST'),
    Text('STORY'),
    Text('REEL'),
    Text('LIVE'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      /*if (_selectedIndex == 0) {
        *//*Navigator.push(
            context, MaterialPageRoute(builder: (context) => UserPostImages()));*//*
      }*/
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Post'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'POST',
              backgroundColor: Color(0xff080053)
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'STORY',
            backgroundColor: Color(0xff080053)
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'REEL',
            backgroundColor: Color(0xff080053)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'LIVE',
            backgroundColor: Color(0xff080053)
          ),
        ],
        currentIndex: _selectedIndex,
        selectedIconTheme: IconThemeData(opacity: 0.0, size: 0),
        unselectedIconTheme: IconThemeData(opacity: 0.0, size: 0),
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
