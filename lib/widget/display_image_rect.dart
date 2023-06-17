import 'dart:io';

import 'package:flutter/material.dart';

class DisplayImageRect extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;

  // Constructor
  const DisplayImageRect({
    Key? key,
    required this.imagePath,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Color.fromRGBO(64, 105, 225, 1);

    return Center(
        child: Stack(children: [
      buildImage(color),
      Positioned(
        child: buildEditIcon(color),
        right: 1,

      )
    ]));
  }

  // Builds Profile Image
  Widget buildImage(Color color) {
    final image = imagePath.contains('https://')
        ? Image.network(
            imagePath,
            fit: BoxFit.cover,
          )
        : imagePath.contains('assets')
            ? Image.asset(
                imagePath,
                fit: BoxFit.cover,
              )
            : Image.file(
                File(imagePath),
                fit: BoxFit.cover,
      filterQuality: FilterQuality.low,
              );

    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0), //or 15.0
      child: Container(
        height: 200.0,
        width: 330.0,
        color: Color(0xffFF0E58),
        child: image,
      ),
    );
    /* return CircleAvatar(
      radius: 3,
      backgroundColor: color,
      child: CircleAvatar(
        backgroundImage: image as ImageProvider,
        radius: 3,
      ),
    );*/
  }

  // Builds Edit Icon on Profile Picture
  Widget buildEditIcon(Color color) => buildCircle(
      all: 15,
      child: GestureDetector(
          onTap: onPressed,
          child: Icon(
            Icons.edit,
            color: color,
            size: 25,
          )));

  // Builds/Makes Circle for Edit Icon on Profile Picture
  Widget buildCircle({required Widget child, required double all}) => ClipOval(
          child: Container(
        padding: EdgeInsets.all(all),
        color: Colors.white,
        child: child,
      ));
}
