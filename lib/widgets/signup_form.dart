import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_by_firebase/constants.dart';
import 'package:login_by_firebase/service/auth_service.dart';
import 'package:login_by_firebase/widgets/custom_button.dart';
import 'package:login_by_firebase/widgets/custom_text_form_field.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({
    super.key,
  });

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isObscure = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email, password, name;
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
              hintText: 'Enter your name',
              label: 'Name',
              inputType: TextInputType.name,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person,
                  color: kPrimaryColor,
                ),
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter your name';
                }
                return null;
              },
              onChanged: (data) {
                name = data;
              },
            ),
            const SizedBox(
              height: 20,
            ),
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
              height: 60,
            ),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                    backgroundColor: kPrimaryColor,
                  ))
                : CustomButton(
                    text: 'Sign Up',
                    onPressed: () async {
                      await signup(context);
                    }),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(color: kPrimaryColor),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signup(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        setState(() {
          isLoading = true;
        });
        // ignore: unused_local_variable
        final credential = await AuthService().signUp(
            email: email!.trim(), password: password ?? 'admin1234'.trim());
        // ignore: use_build_context_synchronously
        showSnackBar(context, 'Account created successfully', Colors.green);
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        // ignore: use_build_context_synchronously
        showSnackBar(context, e.message.toString(), Colors.red);
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
