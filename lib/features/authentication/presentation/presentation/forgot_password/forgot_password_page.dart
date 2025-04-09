import 'package:flutter/material.dart';
import 'package:lms_project/core/route/route_names.dart';
import 'package:lms_project/features/authentication/presentation/widget/forgot_widget.dart';
import 'package:lms_project/features/authentication/presentation/widget/my_elevated_button.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Forgot Password",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.signIn);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                Image.asset("assets/images/forgot_password.png"),
                const SizedBox(height: 40),
                const Text(
                  "Select which contact details should we use to reset your password",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    ContactOptionCard(
                      icon: Icons.sms,
                      title: "Via SMS",
                      value: "+1 111 ******99",
                      isSelected: selectedIndex == 0,
                      onTap: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    ContactOptionCard(
                      icon: Icons.email,
                      title: "Via Email",
                      value: "and***ley@yourdomain.com",
                      isSelected: selectedIndex == 1,
                      onTap: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // Continue Button
                MyElevatedButton(
                  text: "Continue",
                  onPressed: () {
                    Navigator.pushNamed(context, RouteNames.sendCodePage);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
