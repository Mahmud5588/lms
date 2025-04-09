import 'package:flutter/material.dart';
import 'package:lms_project/core/route/route_names.dart';
import 'package:lms_project/features/authentication/presentation/widget/button_continue_with.dart';
import 'package:lms_project/features/authentication/presentation/widget/my_elevated_button.dart';
import 'package:lms_project/features/authentication/presentation/widget/my_textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isRemember = false;
  bool observePassword = true;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  "Login to your Account",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 48,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                MyTextField(texts: "Email", icon: Icon(Icons.email)),
                SizedBox(height: 20),
                MyTextField(
                  texts: "Password",
                  obscureText: observePassword,
                  icon: Icon(Icons.lock),
                  element: IconButton(
                    onPressed: () {
                      setState(() {
                        observePassword = !observePassword;
                      });
                    },
                    icon:
                        observePassword
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Remember me",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    Checkbox(
                      activeColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      value: _isRemember,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _isRemember = newValue!;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                MyElevatedButton(text: "Sign In", onPressed: () {}),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RouteNames.forgotPasswordPage);
                  },
                  child: Text(
                    "Forgot the password?",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                    SizedBox(width: 10),
                    Text(
                      "Or Continue with",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                    Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonContinueWith(
                      icon: Icon(
                        Icons.facebook_outlined,
                        size: 30,
                        color: Colors.blue,
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(width: 20),
                    ButtonContinueWith(
                      icon: Image.asset(
                        "assets/images/google.png",
                        width: 30,
                        height: 30,
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(width: 20),
                    ButtonContinueWith(
                      icon: Icon(Icons.apple, color: Colors.black, size: 30),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 20),
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
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.blue),
                      ),
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
