import 'package:flutter/material.dart';
import 'package:lms_project/core/route/route_names.dart';
import 'package:lms_project/features/authentication/presentation/widget/continue_with_button.dart';
import 'package:lms_project/features/authentication/presentation/widget/my_elevated_button.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage("assets/images/sign_in.png")),
                SizedBox(height: 20),
                Text(
                  "Let's you in",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 48,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                ContinueWithButton(
                  onPressed: () {},
                  texts: "Continue with Facebook",
                  icon: Icon(Icons.facebook, size: 25, color: Colors.blue),
                ),
                SizedBox(height: 20),
                ContinueWithButton(
                  onPressed: () {},
                  texts: "Continue with Google",
                  icon: Image.asset(
                    "assets/images/google.png",
                    width: 20,
                    height: 20,
                  ),
                ),
                SizedBox(height: 20),
                ContinueWithButton(
                  onPressed: () {},
                  texts: "Continue with Apple",
                  icon: Icon(Icons.apple, size: 25, color: Colors.black),
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                    SizedBox(width: 10),
                    Text("OR", style: TextStyle(fontWeight: FontWeight.w600)),
                    Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                  ],
                ),
                SizedBox(height: 30),
                MyElevatedButton(
                  text: "Sign in with password",
                  onPressed: () {
                    Navigator.pushNamed(context, RouteNames.login);
                  },
                ),

                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.signUp);
                      },
                      child: Text("Sign up"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
