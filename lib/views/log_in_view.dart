
import 'package:flutter/material.dart';
import 'package:login_by_firebase/widgets/login_view_body.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginViewBody(),
    );
  }
}
