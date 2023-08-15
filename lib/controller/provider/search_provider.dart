import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_app/model/note_model.dart';

class SearchProvider extends ChangeNotifier {
  final TextEditingController searchController = TextEditingController();
  List<NoteData> allNotesForSearching = [];
  List<NoteData> foundedNotes = [];
  bool isShowNotes = false;
  Future<void> getAllNotes() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('notes').get();
      allNotesForSearching.clear();
      for (QueryDocumentSnapshot<Map<String, dynamic>> document
          in snapshot.docs) {
        Map<String, dynamic> data = document.data();
        allNotesForSearching.add(NoteData(
            content: data['content'],
            subject: data['subject'],
            date: data['date'].toString(),
            updatedDate: data['editdate'].toString()));
      }
    } catch (e) {
      log(e.toString());
    }
  }

  filterNotes() {
    List<NoteData> result = [];

    if (searchController.text.isEmpty) {
      result = [];
    } else {
      result = allNotesForSearching
          .where((element) => element.subject!
              .toLowerCase()
              .startsWith(searchController.text.toLowerCase()))
          .toList();
    }
    foundedNotes = result;
    notifyListeners();
  }

  showNotes() {
    isShowNotes = true;
    notifyListeners();
  }

  hideNotes() {
    isShowNotes = false;
    notifyListeners();
  }

  clearController() {
    searchController.clear();
    isShowNotes = false;
  }
}
