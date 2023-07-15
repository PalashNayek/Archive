import 'dart:ui';
import 'package:s2w/theme/color.dart';
import 'create_post.dart';
import 'package:flutter/material.dart';

class PostOnBoard extends StatefulWidget {
  const PostOnBoard({super.key});

  @override
  State<PostOnBoard> createState() => _PostOnBoardState();
}

class _PostOnBoardState extends State<PostOnBoard> {
  Widget? _child;
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    //Text('POST'),
    CreatePostScreen(),
    Text('STORY'),
    Text('REEL'),
    Text('LIVE'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          _child = CreatePostScreen();
          break;
        /*case 1:
          _child = NotificationContent();
          break;
        case 2:
          _child=ConversationList();
          // _child =UserListContent(); //SettingsContent();
          break;
        case 3:
          _child = AccountContent();
          break;*/
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: Text(
          "New Post",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

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
        selectedItemColor: Colors.white, // Color of the selected item
        unselectedItemColor: Colors.grey, // Color of the unselected items
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold), // Style of the selected label
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
