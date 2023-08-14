import 'package:flutter/material.dart';
import '../../../controller/core/constant.dart';

class NoteDetailsScreen extends StatelessWidget {
  const NoteDetailsScreen(
      {super.key,
      required this.subject,
      required this.content,
      required this.date});

  final String subject;
  final String content;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  onPressed: () {},
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
              children: [
                Text(
                  "Content:   ",
                  style: CustomFuction.texttStyle(
                      weight: FontWeight.w600,
                      color: CustomClr.kblack,
                      size: 16),
                ),
                SizedBox(
                  child: Text(
                    content,
                    style: CustomFuction.texttStyle(
                        weight: FontWeight.w600,
                        color: CustomClr.kblack,
                        size: 15),
                    maxLines: null,
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
