import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FirebaseDataStore extends StatefulWidget {
  const FirebaseDataStore({super.key});

  @override
  State<FirebaseDataStore> createState() => _FirebaseDataStoreState();
}

class _FirebaseDataStoreState extends State<FirebaseDataStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 30,
            width: 30,
            color: Colors.lightBlue,
          ),
        ],
      ),
    );
  }
}
