import 'package:flutter/material.dart';
import 'package:login_by_firebase/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
      body: SignUpViewBody(),
    );
  }
}