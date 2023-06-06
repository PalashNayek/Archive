import 'package:flutter/material.dart';
import 'package:s2w/theme/color.dart';

class GenderWidget extends StatelessWidget {
  final VoidCallback onclick;
  final String title;
  final IconData icon;

  final bool isSelected;

  GenderWidget({
    required this.isSelected,
    required this.onclick,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onclick,
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
        decoration: BoxDecoration (
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? primary : null,
        ),//change color based on your need
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  style: TextStyle(color: isSelected?Colors.white:Colors.grey),
                ),
                Icon(
                  icon,
                  ////??? What variable should i use to finish
                  color: isSelected == true ? Colors.white: Colors.black,
                  size: 30,
                ),
                /*SizedBox(
                  height: 20,
                  //??? What variable should i use to finish
                  child: isSelected == true ? Text('Selected') : null,
                )*/
              ],
            )),
      ),
    );
  }
}