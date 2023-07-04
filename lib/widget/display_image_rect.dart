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
        top: 0,
      )
    ]));
  }

  @override
  Widget buildTwo(BuildContext context) {
    final color = Color.fromRGBO(64, 105, 225, 1);

    return Center(
        child: Stack(children: [
      buildImage(color),
      Positioned(
        child: backPressIcon(color),
        left: 1,
        top: 5,
      )
    ]));
  }

  // Builds Profile Image
  Widget buildImage(Color color) {
    final image = imagePath.contains('https://')
        ? Image.network(
            filterQuality: FilterQuality.low,
            imagePath,
            errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
              return const Text('Failed to load image');
            },
            fit: BoxFit.cover,
          )
        : imagePath.contains('assets')
            ? Image.asset(
                imagePath,
                fit: BoxFit.cover,
              )
            : Image.file(
                File(imagePath),
                filterQuality: FilterQuality.low,
                fit: BoxFit.cover,
              );

    return ClipRRect(
      //or 15.0
      child: Container(
        height: 200.0,
        width: double.infinity,
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
  Widget backPressIcon(Color color) => buildCircle(
      all: 10,
      child: GestureDetector(
          onTap: onPressed,
          child: Icon(
            Icons.arrow_back,
            color: color,
            size: 20,
          )));

  // Builds Edit Icon on Profile Picture
  Widget buildEditIcon(Color color) => buildCircle(
      all: 10,
      child: GestureDetector(
          onTap: onPressed,
          child: Icon(
            Icons.edit,
            color: color,
            size: 20,
          )));

  // Builds/Makes Circle for Edit Icon on Profile Picture
  Widget buildCircle({required Widget child, required double all}) => ClipOval(
          child: Container(
        padding: EdgeInsets.all(all),
        color: Colors.white,
        child: child,
      ));
}
