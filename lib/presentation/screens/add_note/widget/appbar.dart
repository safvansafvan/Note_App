import 'package:flutter/material.dart';
import 'package:note_app/controller/core/constant.dart';
import 'package:note_app/controller/res/firestore.dart';
import 'package:note_app/presentation/widgets/snackbar_widget.dart';

class AddNoteAppBar extends StatelessWidget {
  const AddNoteAppBar({
    super.key,
    required this.conController,
    required this.subController,
  });

  final TextEditingController conController;
  final TextEditingController subController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple[300],
      child: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: CustomClr.kwhite,
            ),
          ),
          Text(
            "A d d N o t e",
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
                if (conController.text.isNotEmpty &&
                    subController.text.isNotEmpty) {
                  await FireStore().addNotes(
                    context: context,
                    subject: subController.text,
                    content: conController.text,
                  );
                  conController.clear();
                  subController.clear();
                } else {
                  SnakBarWidget.snackBarWidget(
                      context: context,
                      title: "Add values",
                      clr: CustomClr.kred);
                }
              },
              child: Text(
                "Save",
                style: CustomFuction.texttStyle(
                    weight: FontWeight.w600, color: CustomClr.kwhite, size: 14),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
