import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fbase_app/add_note_screen.dart';
import 'package:fbase_app/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String email = "";
  List<Map<String, dynamic>> notes = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.scheduleFrameCallback((_) {
      getEmail();
      getNotes();
    });
  }

  getNotes() async {
    notes = [];
    var db = FirebaseFirestore.instance;
    await db.collection("notes").get().then((event) {
      for (var doc in event.docs) {
        setState(() {
          notes.add(doc.data());
        });
        // print("${doc.id} => ${doc.data()}");
      }
    });
  }

  getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString("user-email").toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome ${FirebaseAuth.instance.currentUser!.email!}',
          style: TextStyle(fontSize: 13),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Notes',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      OneContext.instance.push(
                          MaterialPageRoute(builder: (_) => LoginScreen()));
                    },
                    child: Text("Log out")),
                ElevatedButton(
                    onPressed: () {
                      OneContext.instance.push(
                          MaterialPageRoute(builder: (_) => AddNoteScreen()));
                    },
                    child: Text("Add Note"))
              ],
            ),
            SizedBox(
                height: 500,
                child: ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("Title: ${notes[index]['title']}"),
                        subtitle: Text("Body: ${notes[index]['body']}"),
                      );
                    })),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
