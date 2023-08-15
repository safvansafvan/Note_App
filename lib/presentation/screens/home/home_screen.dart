import 'package:flutter/material.dart';
import 'package:note_app/controller/core/constant.dart';
import 'package:note_app/presentation/screens/add_note/add_note.dart';
import 'package:note_app/presentation/screens/home/widget/custom_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const CustomBodyView(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNoteScreen(),
            ),
          );
        },
        label: const Text("Note", style: TextStyle(fontSize: 13)),
        tooltip: "add new note",
        elevation: 15,
        icon: const Icon(Icons.add),
        shape: RoundedRectangleBorder(
          borderRadius: CustomSize.commonRadius,
        ),
        hoverColor: CustomClr.deepPurple,
      ),
    );
  }
}
