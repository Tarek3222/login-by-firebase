import 'package:flutter/material.dart';
import 'package:login_by_firebase/views/log_in_view.dart';
import 'package:login_by_firebase/widgets/custom_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomButton(
              text: 'Log out',
              onPressed: () {
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const LogInView()));
              }),
        ),
      ),
    );
  }
}
