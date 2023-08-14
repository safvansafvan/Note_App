import 'package:flutter/material.dart';
import 'package:note_app/presentation/widgets/delete_dialog.dart';
import '../../../controller/core/constant.dart';

class NoteDetailsScreen extends StatelessWidget {
  const NoteDetailsScreen(
      {super.key,
      required this.subject,
      required this.content,
      required this.date,
      required this.id});

  final String subject;
  final String content;
  final String date;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: SafeArea(
        child: Padding(
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
                  IconButton(
                    onPressed: () {
                      DeleteDialog.cupertinoDelete(context, id);
                    },
                    icon: Icon(
                      Icons.delete_outline_outlined,
                      color: CustomClr.kred,
                    ),
                  )
                ],
              ),
              CustomHeight.commonHeight,
              Row(
                children: [
                  Text(
                    "Subject:    ",
                    style: CustomFuction.texttStyle(
                        weight: FontWeight.w600,
                        color: CustomClr.kblack,
                        size: 16),
                  ),
                  Text(
                    subject,
                    style: CustomFuction.texttStyle(
                        weight: FontWeight.w600,
                        color: CustomClr.kblack,
                        size: 16),
                  ),
                ],
              ),
              CustomHeight.commonHeight,
              Row(
                children: [
                  Text(
                    "Date:         ",
                    style: CustomFuction.texttStyle(
                        weight: FontWeight.w600,
                        color: CustomClr.kblack,
                        size: 16),
                  ),
                  Text(
                    date,
                    style: CustomFuction.texttStyle(
                        weight: FontWeight.w600,
                        color: CustomClr.kblack,
                        size: 15),
                  ),
                ],
              ),
              CustomHeight.commonHeight,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Content:   ",
                    style: CustomFuction.texttStyle(
                        weight: FontWeight.w600,
                        color: CustomClr.kblack,
                        size: 16),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Text(
                        content,
                        style: CustomFuction.texttStyle(
                            weight: FontWeight.w600,
                            color: CustomClr.kblack,
                            size: 15),
                        maxLines: null,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
