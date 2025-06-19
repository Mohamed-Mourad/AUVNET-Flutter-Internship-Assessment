import 'package:auvnet_task/core/router/app_router.dart';
import 'package:auvnet_task/presentation/onboarding/bloc/onboarding_bloc.dart';
import 'package:auvnet_task/presentation/onboarding/widgets/get_started_button.dart';
import 'package:auvnet_task/presentation/onboarding/widgets/onboarding_background.dart';
import 'package:auvnet_task/presentation/onboarding/widgets/onboarding_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auvnet_task/injection_container.dart' as di;

// A simple model for our onboarding page data
class OnboardingPageModel {
  final String title;
  final String description;

  OnboardingPageModel({required this.title, required this.description});
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.serviceLocator<OnboardingBloc>(),
      child: const _OnboardingView(),
    );
  }
}

class _OnboardingView extends StatelessWidget {
  const _OnboardingView();

  // Static data for the onboarding pages
  static final List<OnboardingPageModel> _pages = [
    OnboardingPageModel(
      title: "all-in-one delivery",
      description:
      "Order groceries, medicines, and meals delivered straight to your door",
    ),
    OnboardingPageModel(
      title: "User-to-User Delivery",
      description: "Send or receive items from other users quickly and easily",
    ),
    OnboardingPageModel(
      title: "Sales & Discounts",
      description: "Discover exclusive sales and deals every day",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();

    return BlocListener<OnboardingBloc, OnboardingState>(
      listener: (context, state) {
        if (state is NavigateToLogin) {
          Navigator.of(context).pushReplacementNamed(AppRouter.loginRoute);
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            const OnboardingBackground(),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 90.0),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Image.asset(
                          'assets/images/nawel.png',
                          // height: 336,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: PageView.builder(
                        controller: pageController,
                        itemCount: _pages.length,
                        onPageChanged: (index) {
                          context.read<OnboardingBloc>().add(PageChanged(index));
                        },
                        itemBuilder: (context, index) {
                          return OnboardingContent(
                            title: _pages[index].title,
                            description: _pages[index].description,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 40),
                    _NavigationButtons(pageController: pageController),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigationButtons extends StatelessWidget {
  final PageController pageController;

  const _NavigationButtons({required this.pageController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        final bool isLastPage = state.currentPage == _OnboardingView._pages.length - 1;

        if (isLastPage) {
          // Show only the "Get Started" button on the last page.
          return Column(
            children: [
              GetStartedButton(
                function: () {
                  context.read<OnboardingBloc>().add(OnboardingCompleted());
                },
                text: "Get Started",
              ),
              const SizedBox(height: 12),
              const TextButton(
                onPressed: null,
                child: Text(""),
              ),
            ],
          );
        } else {
          // Show both buttons in a column on other pages.
          return Column(
            children: [
              GetStartedButton(
                function: () {
                  context.read<OnboardingBloc>().add(OnboardingCompleted());
                },
                text: "Get Started",
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                },
                child: const Text("Next"),
              ),
            ],
          );
        }
      },
    );
  }
}
