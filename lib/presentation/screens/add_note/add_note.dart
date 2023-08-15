import 'package:flutter/material.dart';
import 'package:note_app/controller/core/constant.dart';
import 'package:note_app/presentation/screens/add_note/widget/appbar.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController subController = TextEditingController();
    TextEditingController conController = TextEditingController();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 100),
        child: AddNoteAppBar(
            conController: conController, subController: subController),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            CustomHeight.commonHeight,
            TextFormField(
              controller: subController,
              maxLength: 20,
              decoration: const InputDecoration(
                hintText: "Subject",
                prefixIcon: Icon(Icons.subject_rounded),
              ),
            ),
            CustomHeight.commonHeight,
            SizedBox(
              child: TextFormField(
                controller: conController,
                maxLines: null,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Content",
                  prefixIcon: Icon(Icons.content_paste),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
