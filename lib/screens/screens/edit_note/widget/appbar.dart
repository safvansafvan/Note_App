import 'package:flutter/material.dart';
import 'package:note_app/controller/core/constant.dart';
import 'package:note_app/controller/res/firestore.dart';
import 'package:note_app/screens/screens/home/home_screen.dart';
import 'package:note_app/screens/widgets/snackbar_widget.dart';

class EditNoteAppBar extends StatelessWidget {
  const EditNoteAppBar({
    super.key,
    required this.editContentController,
    required this.editSubjectController,
    required this.id,
    required this.subject,
    required this.content,
  });

  final TextEditingController editContentController;
  final TextEditingController editSubjectController;
  final String id;
  final String subject;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple[300],
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios, color: CustomClr.kwhite),
            ),
            Text(
              "A d d N o t e s",
              style: CustomFuction.texttStyle(
                  weight: FontWeight.w600, color: CustomClr.kwhite, size: 17),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: CustomClr.kwhite),
              ),
              child: TextButton(
                onPressed: () async {
                  if (editContentController.text.isNotEmpty ||
                      editSubjectController.text.isNotEmpty) {
                    await FireStore().edit(
                      id: id,
                      context: context,
                      subject: editSubjectController.text.isEmpty
                          ? subject
                          : editSubjectController.text,
                      content: editContentController.text.isEmpty
                          ? content
                          : editContentController.text,
                    );
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                    editContentController.clear();
                    editSubjectController.clear();
                  } else {
                    SnakBarWidget.snackBarWidget(
                        context: context,
                        title: "Add some changes",
                        clr: CustomClr.kred);
                  }
                },
                child: Text(
                  "Save",
                  style: CustomFuction.texttStyle(
                      weight: FontWeight.w600,
                      color: CustomClr.kwhite,
                      size: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
