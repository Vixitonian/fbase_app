// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(hintText: "Title"),
            ),
            TextField(
              controller: bodyController,
              decoration: InputDecoration(hintText: "Note Body"),
            ),
            ElevatedButton(
                onPressed: () {
                  var db = FirebaseFirestore.instance;
                  final note = <String, dynamic>{
                    "title": titleController.text.trim(),
                    "body": bodyController.text.trim(),
                    "createdAt": DateTime.now().toString()
                  };

                  db.collection("notes").add(note).then((doc) {
                    print('DocumentSnapshot added with ID: ${doc.id}');
                    Navigator.pop(context);
                  });
                },
                child: Text("Add Note"))
          ],
        ),
      ),
    );
  }
}
