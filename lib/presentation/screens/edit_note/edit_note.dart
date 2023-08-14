import 'package:flutter/material.dart';
import 'package:note_app/controller/res/firestore.dart';
import 'package:note_app/presentation/screens/home_screen.dart';
import 'package:note_app/presentation/widgets/snackbar_widget.dart';
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
      backgroundColor: Colors.deepPurple[100],
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                Text(
                  "N o t e s",
                  style: CustomFuction.texttStyle(
                      weight: FontWeight.w600,
                      color: CustomClr.kblack,
                      size: 17),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: CustomClr.kblack),
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
                          color: CustomClr.kblack,
                          size: 14),
                    ),
                  ),
                ),
              ],
            ),
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
