import 'package:flutter/material.dart';
import 'package:login_by_firebase/widgets/back_ground_login.dart';
import 'package:login_by_firebase/widgets/signup_form.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key,});


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
            children: [
              const BackGroundView(ratio: 0.3,),
              const Positioned(
                top: 89,
                left: 20,
                child: Text(
                  "Sign up",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white),
                ),
              ),
              const Positioned(
                top: 140,
                left: 20,
                child: Text(
                  "Create an account to get started",
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
              ),
              Positioned(
                top: 102,
                left: 175,
                child: Image.asset(
                  'assets/images/signup_image.png',
                  width: 180,
                  height: 200,
                ),
              ),
              const Positioned(
                top: 255,
                left: 20,
                right: 20,
                child: SignupForm(),
              ),
            ],
          ),
      ),
    );
  }
}