import 'package:flutter/material.dart';
import 'package:note_app/controller/core/constant.dart';
import 'package:note_app/presentation/screens/edit_note/edit_note.dart';
import 'package:note_app/presentation/widgets/delete_dialog.dart';

class NotesShowingWidget extends StatelessWidget {
  const NotesShowingWidget({
    super.key,
    required this.subject,
    required this.content,
    this.date,
    this.updatedDate,
    this.id,
  });

  final String subject;
  final String content;
  final String? date;
  final String? updatedDate;
  final String? id;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.deepPurple[300], borderRadius: CustomSize.commonRadius),
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
                        subject,
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
                            DeleteDialog.cupertinoDelete(context, id);
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
                                    content: content,
                                    subject: subject,
                                    id: id!),
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
                    content,
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
                  "Created: ",
                  style: CustomFuction.texttStyle(
                      weight: FontWeight.w500,
                      color: CustomClr.kwhite70,
                      size: 16),
                ),
                Text(
                  date ?? "",
                  style: CustomFuction.texttStyle(
                      weight: FontWeight.w500,
                      color: CustomClr.kwhite70,
                      size: 16),
                )
              ],
            ),
            CustomHeight.height10,
            Row(
              children: [
                Text(
                  "Updated: ",
                  style: CustomFuction.texttStyle(
                      weight: FontWeight.w500,
                      color: CustomClr.kwhite70,
                      size: 16),
                ),
                Text(
                  updatedDate ?? "",
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
