import 'package:flutter/material.dart';
import 'package:note_app/presentation/screens/note_details/widget/appbar.dart';
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
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 100),
        child: NoteDetailsAppBar(id: id),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: ListView(
          children: [
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
    );
  }
}
