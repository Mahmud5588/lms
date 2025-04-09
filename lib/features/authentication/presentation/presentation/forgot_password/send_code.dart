import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lms_project/features/authentication/presentation/widget/code_field.dart';
import 'package:lms_project/features/authentication/presentation/widget/my_elevated_button.dart';

import '../../../../../core/route/route_names.dart';

class SendCodePage extends StatefulWidget {
  const SendCodePage({super.key});

  @override
  State<SendCodePage> createState() => _SendCodePageState();
}

class _SendCodePageState extends State<SendCodePage> {
  int _seconds = 60;
  Timer? _timer;

  void _startTimer() {
    _timer?.cancel();
    _seconds = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (_seconds > 0) {
            _seconds--;
          } else {
            timer.cancel();
          }
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Forgot Password",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.forgotPasswordPage);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Text(
                "Code has been sent to +1 111 ******99",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CodeField(),
                  SizedBox(width: 10),
                  CodeField(),
                  SizedBox(width: 10),
                  CodeField(),
                  SizedBox(width: 10),
                  CodeField(),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                _seconds > 0
                    ? "Resend code in $_seconds seconds"
                    : "You can now resend the code",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 450),
              MyElevatedButton(
                text: "Verify",
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.createNewPassword);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
