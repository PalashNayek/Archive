import 'package:flutter/material.dart';

void showCustomSnackBar(String message, BuildContext context, {bool isError = true}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(SnackBar(key: UniqueKey(), content: Text(message),
      margin:EdgeInsets.only(left: 10,bottom: 10,right: 10),
      behavior: SnackBarBehavior.floating ,
      dismissDirection: DismissDirection.down,
      backgroundColor: isError ? Colors.red : Colors.green)
  );
}
