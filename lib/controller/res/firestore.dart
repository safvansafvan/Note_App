import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class FireStore {
  var isAddDataLoading = false;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future addNotes({required String subject, required String content}) async {
    isAddDataLoading = true;
    String id = const Uuid().v1();
    try {
      firebaseFirestore.collection('notes').doc(id).set({
        'id': id,
        'content': content,
        'subject': subject,
        'date': DateTime.now()
      });
      isAddDataLoading = false;
    } catch (e) {
      log(e.toString());
    }
    isAddDataLoading = false;
  }
}
