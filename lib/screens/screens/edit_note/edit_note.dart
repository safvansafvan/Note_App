import 'package:flutter/material.dart';
import 'package:note_app/screens/screens/edit_note/widget/appbar.dart';
import '../../../controller/core/constant.dart';

class EditNoteScreen extends StatelessWidget {
  const EditNoteScreen(
      {super.key,
      required this.id,
      required this.subject,
      required this.content});

  final String id;
  final String subject;
  final String content;
  @override
  Widget build(BuildContext context) {
    TextEditingController editSubjectController = TextEditingController();
    TextEditingController editContentController = TextEditingController();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 100),
        child: EditNoteAppBar(
            editContentController: editContentController,
            editSubjectController: editSubjectController,
            id: id,
            subject: subject,
            content: content),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            CustomHeight.commonHeight,
            TextFormField(
              controller: editSubjectController,
              maxLength: 20,
              decoration: InputDecoration(
                hintText: subject,
                prefixIcon: const Icon(Icons.subject_rounded),
              ),
            ),
            CustomHeight.commonHeight,
            SizedBox(
              child: TextFormField(
                controller: editContentController,
                initialValue: content,
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: content,
                  prefixIcon: const Icon(Icons.content_paste),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
