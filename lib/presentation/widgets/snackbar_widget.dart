import 'package:flutter/material.dart';
import 'package:note_app/controller/core/constant.dart';

class SnakBarWidget {
  static snackBarWidget(
      {required context, required String title, required Color clr}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 350,
        backgroundColor: clr,
        shape: RoundedRectangleBorder(
          borderRadius: CustomSize.commonRadius,
        ),
        behavior: SnackBarBehavior.floating,
        content: Center(
          child: Text(
            title,
            style: CustomFuction.texttStyle(
                weight: FontWeight.w500, color: CustomClr.kwhite, size: 15),
          ),
        ),
      ),
    );
  }
}
