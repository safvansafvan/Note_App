import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_app/controller/core/constant.dart';
import 'package:note_app/presentation/widgets/snackbar_widget.dart';
import 'package:uuid/uuid.dart';

class FireStore {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future addNotes(
      {required String subject, required String content, context}) async {
    String id = const Uuid().v1();
    try {
      firebaseFirestore.collection('notes').doc(id).set({
        'id': id,
        'content': content,
        'subject': subject,
        'date': DateTime.now()
      });
      SnakBarWidget.snackBarWidget(
          context: context, title: "Notes Added", clr: CustomClr.kgreen);
    } catch (e) {
      log(e.toString());
    }
  }
}
