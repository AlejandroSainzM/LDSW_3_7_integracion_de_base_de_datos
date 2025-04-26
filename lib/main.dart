import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const LDSWFirebaseApp());
}

class LDSWFirebaseApp extends StatelessWidget {
  const LDSWFirebaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LDSW 3.7 Firebase Integration',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Firebase Demo'),
        ),
        body: const Center(
          child: FirebaseButton(),
        ),
      ),
    );
  }
}

class FirebaseButton extends StatelessWidget {
  const FirebaseButton({super.key});

  Future<void> addData() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    await users.add({
      'name': 'Alejandro',
      'email': 'alejandro@ejemplo.com',
      'createdAt': Timestamp.now(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: addData,
      child: const Text('Agregar datos a Firebase'),
    );
  }
}
