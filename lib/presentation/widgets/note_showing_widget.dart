import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/controller/core/constant.dart';
import 'package:note_app/presentation/screens/edit_note/edit_note.dart';
import 'package:note_app/presentation/widgets/delete_dialog.dart';

class NotesShowingWidget extends StatelessWidget {
  const NotesShowingWidget({
    super.key,
    required this.snap,
  });

  final Map<String, dynamic> snap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple[300],
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      Text(
                        "Subject:  ",
                        style: CustomFuction.texttStyle(
                            weight: FontWeight.w500,
                            color: CustomClr.kwhite70,
                            size: 16),
                      ),
                      Text(
                        snap['subject'],
                        style: CustomFuction.texttStyle(
                          weight: FontWeight.w500,
                          color: CustomClr.kwhite70,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuButton(
                  color: CustomClr.kwhite70,
                  elevation: 15,
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        child: InkWell(
                          onTap: () {
                            DeleteDialog.cupertinoDelete(context, snap['id']);
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.delete_outline_outlined,
                                color: CustomClr.kred,
                              ),
                              const Text("Delete")
                            ],
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditNoteScreen(
                                    content: snap['content'],
                                    subject: snap['subject'],
                                    id: snap['id']),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.edit,
                                color: CustomClr.kblue,
                              ),
                              const Text("Edit")
                            ],
                          ),
                        ),
                      )
                    ];
                  },
                )
              ],
            ),
            Row(
              children: [
                Text(
                  "Content: ",
                  style: CustomFuction.texttStyle(
                      weight: FontWeight.w500,
                      color: CustomClr.kwhite70,
                      size: 16),
                ),
                Expanded(
                  child: Text(
                    snap['content'],
                    style: CustomFuction.texttStyle(
                        weight: FontWeight.w500,
                        color: CustomClr.kwhite70,
                        size: 16),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            CustomHeight.height10,
            Row(
              children: [
                Text(
                  "Date: ",
                  style: CustomFuction.texttStyle(
                      weight: FontWeight.w500,
                      color: CustomClr.kwhite70,
                      size: 16),
                ),
                Text(
                  DateFormat.yMEd().format(snap['date'].toDate()),
                  style: CustomFuction.texttStyle(
                      weight: FontWeight.w500,
                      color: CustomClr.kwhite70,
                      size: 16),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
