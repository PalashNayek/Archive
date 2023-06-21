import 'dart:io';

import 'package:flutter/material.dart';

class DisplayImage extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;

  // Constructor
  const DisplayImage({
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
            left: 55,
            top: 65,
          )
        ]));
  }

  // Builds Profile Image
  Widget buildImage(Color color) {
    final image = imagePath.contains('https://')
        ? NetworkImage(imagePath)
        :imagePath.contains('assets') ?AssetImage (imagePath): FileImage(File(imagePath));

    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Align(
        alignment: Alignment.topLeft,
        child: CircleAvatar(
          radius: 50,
          backgroundColor: color,
          child: CircleAvatar(
            backgroundImage: image as ImageProvider,
            radius: 50,
          ),
        ),
      ),
    );
  }

  // Builds Edit Icon on Profile Picture
  Widget buildEditIcon(Color color) => buildCircle(
      all: 5,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: GestureDetector(
            onTap: onPressed,
            child: Icon(
            Icons.edit,
            color: color,
            size: 25,
        )),
      )
  );

  // Builds/Makes Circle for Edit Icon on Profile Picture
  Widget buildCircle({required Widget child, required double all}) =>
      ClipOval(
          child: Container(
            padding: EdgeInsets.all(all),
            color: Colors.white,
            child: child,
          ));
}