import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreProvider with ChangeNotifier {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Map<String, dynamic>>> getTasks(String category) {
    print("Fetching tasks for category: $category");
    return _db
        .collection('tasks')
        .doc(category)
        .collection('taskList')
        .snapshots()
        .handleError((error) {
      print("Error fetching tasks: $error");
    }).map((snapshot) {
      print("Snapshot received for category: $category");
      final data = snapshot.docs.map((doc) {
        print("Document data: ${doc.data()}");
        return doc.data();
      }).toList();
      print("Fetched tasks for category '$category': $data");
      return data;
    });
  }
}
