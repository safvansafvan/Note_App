import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/controller/res/firestore.dart';
import 'package:note_app/presentation/screens/home_screen.dart';

class DeleteDialog {
  static void cupertinoDelete(context, id) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Delete'),
          content: const Text('Are you sure you want to delete this note'),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            CupertinoDialogAction(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
                await FireStore().delete(id: id, context: context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
