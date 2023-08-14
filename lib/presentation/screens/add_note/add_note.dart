import 'package:flutter/material.dart';
import 'package:note_app/controller/core/constant.dart';
import 'package:note_app/controller/res/firestore.dart';
import 'package:note_app/presentation/widgets/snackbar_widget.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController subController = TextEditingController();
    TextEditingController conController = TextEditingController();
    GlobalKey<FormState> formKeyAdd = GlobalKey<FormState>();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 100),
        child: Container(
          color: Colors.deepPurple[300],
          child: Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
                        weight: FontWeight.w600,
                        color: CustomClr.kwhite,
                        size: 17),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: CustomClr.kblack),
                    ),
                    child: TextButton(
                      onPressed: () async {
                        if (conController.text.isNotEmpty &&
                            subController.text.isNotEmpty) {
                          await FireStore().addNotes(
                            subject: subController.text,
                            content: conController.text,
                          );
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
                            weight: FontWeight.w600,
                            color: CustomClr.kwhite,
                            size: 14),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKeyAdd,
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
      ),
    );
  }
}
