import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Custom Dialog'),
      content: TextField(
        controller: textController,
        decoration: InputDecoration(hintText: 'Enter text'),
      ),
      actions: [
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
        ),
        TextButton(
          child: Text('OK'),
          onPressed: () {
            String enteredText = textController.text;
            // Do something with the entered text
            print('Entered text: $enteredText');
            Navigator.of(context).pop(); // Close the dialog
          },
        ),
      ],

    );
  }
}
