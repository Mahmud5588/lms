import 'package:flutter/material.dart';
import 'package:lms_project/features/authentication/presentation/widget/my_elevated_button.dart';
import 'package:lms_project/features/authentication/presentation/widget/my_textfield.dart';

import '../../../../../core/route/route_names.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  bool observePassword = false;
  bool _isRemember = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Create New Password",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.sendCodePage);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/images/create_new_password.png"),
              SizedBox(height: 60),
              const Text(
                "Create Your New Password",
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              SizedBox(height: 20),
              MyTextField(
                texts: "New Password",
                obscureText: true,
                icon: Icon(Icons.lock, color: Colors.black),
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
              SizedBox(height: 10),
              MyTextField(
                texts: "Repeat Password",
                obscureText: observePassword,
                icon: Icon(Icons.lock, color: Colors.black),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Remember me",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
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
              SizedBox(height: 100),
              MyElevatedButton(text: "Continue", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
