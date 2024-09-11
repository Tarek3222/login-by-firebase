import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_by_firebase/firebase_options.dart';
import 'package:login_by_firebase/views/log_in_view.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogInView(),
    );
  }
}