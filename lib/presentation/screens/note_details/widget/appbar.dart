import 'package:flutter/material.dart';
import 'package:note_app/controller/core/constant.dart';
import 'package:note_app/presentation/widgets/delete_dialog.dart';

class NoteDetailsAppBar extends StatelessWidget {
  const NoteDetailsAppBar({
    super.key,
    required this.id,
  });

  final String id;

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
              icon: Icon(
                Icons.arrow_back_ios,
                color: CustomClr.kwhite,
              ),
            ),
            Text(
              "N o t e s",
              style: CustomFuction.texttStyle(
                  weight: FontWeight.w600, color: CustomClr.kwhite, size: 17),
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
      ),
    );
  }
}
