import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:municipium/routers/app_router.gr.dart';
import 'package:municipium/ui/components/onboarding_components/onboarding_screen_component.dart';
import 'package:municipium/ui/components/page_indicators.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Expanded(
            child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                itemCount: 3,
                itemBuilder: (context, index) => const OnboardingScreenComponent(
                    textOnboarding:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,')),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    children:
                        List.generate(3, (index) => _buildIndicator(index))),
                _currentPage < 2
                    ? GestureDetector(
                        child: const Text(
                          'SKIP',
                          style: TextStyle(color: Colors.blue),
                        ),
                        onTap: () {
                          _pageController.animateToPage(2, duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
                        })
                    : GestureDetector(
                        onTap: () => context.pushRoute(OnboardingSearchMunicipalityRoute()),
                        child: const Text(
                        'Cerca il tuo comune',
                        style: TextStyle(color: Colors.blue),
                      ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildIndicator(int index) {
    return RoundedIndicator(
        indicatorColor: _currentPage == index ? Colors.blue : Colors.grey);
  }
}
