import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_by_firebase/constants.dart';
import 'package:login_by_firebase/service/auth_service.dart';
import 'package:login_by_firebase/views/home_view.dart';
import 'package:login_by_firebase/views/sign_up_view.dart';
import 'package:login_by_firebase/widgets/custom_button.dart';
import 'package:login_by_firebase/widgets/custom_text_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isObscure = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email, password;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            CustomTextFormField(
              hintText: 'Enter your email',
              label: 'Email',
              inputType: TextInputType.emailAddress,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.email,
                  color: kPrimaryColor,
                ),
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter your email';
                }
                return null;
              },
              onChanged: (data) {
                email = data;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              hintText: 'Enter your Password',
              label: 'Password',
              inputType: TextInputType.visiblePassword,
              obscureText: isObscure,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                icon: Icon(
                  isObscure ? Icons.visibility_off : Icons.visibility,
                  color: kPrimaryColor,
                ),
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter your password';
                }
                return null;
              },
              onChanged: (data) {
                password = data;
              },
            ),
            const SizedBox(
              height: 40,
            ),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : CustomButton(
                    text: 'Login',
                    onPressed: () async {
                      await validateUser(context);
                    }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account?',
                  style: TextStyle(color: kPrimaryColor),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpView()));
                    },
                    child: const Text(
                      'SignUp',
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  validateUser(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        setState(() {
          isLoading = true;
        });
        // ignore: unused_local_variable
        final user = await AuthService()
            .signIn(email: email!.trim(), password: password!.trim());
        Navigator.pushReplacement(
            // ignore: use_build_context_synchronously
            context, MaterialPageRoute(builder: (context) => const HomeView()));
      } on FirebaseAuthException catch (e) {
        showSnackBar(
          // ignore: use_build_context_synchronously
          context,
          e.message.toString(),
          Colors.red,
        );
      } catch (e) {
        // ignore: use_build_context_synchronously
        showSnackBar(context, e.toString(), Colors.red);
      }
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
