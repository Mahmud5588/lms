import 'package:flutter/material.dart';
import 'package:lms_project/features/authentication/presentation/widget/my_elevated_button.dart';
import 'package:lms_project/features/authentication/presentation/widget/on_boarding_widget.dart';

import '../../../../../core/route/route_names.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  final List<Map<String, dynamic>> _onboardingData = [
    {
      'title': 'We provide the best learning courses & great mentors!',
      'image': 'assets/images/on_boarding1.png',
      'buttonText': 'Next',
    },
    {
      'title': 'Learn anytime and anywhere easily and conveniently',
      'image': 'assets/images/on_boarding2.png',
      'buttonText': 'Next',
    },
    {
      'title': 'Let\'s improve your skills together with Elera right now!',
      'image': 'assets/images/on_boarding3.png',
      'buttonText': 'Get Started',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.pushReplacementNamed(context, RouteNames.signIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            // PageView - carousel
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnBoardingWidget(
                    title: _onboardingData[index]['title'],
                    imagePath: _onboardingData[index]['image'],
                  );
                },
              ),
            ),

            // Indicator dots
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_onboardingData.length, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    height: 8,
                    width: index == _currentPage ? 24 : 8,
                    decoration: BoxDecoration(
                      color:
                          index == _currentPage
                              ? const Color(0xff3366ff)
                              : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }),
              ),
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: MyElevatedButton(
                text: _onboardingData[_currentPage]['buttonText'],
                onPressed: _goToNextPage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
