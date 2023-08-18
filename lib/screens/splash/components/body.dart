import 'package:dove_frontend/preferences.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../home/home_screen.dart';
import '../components/splash_content.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "title": "Explore",
      "text": "Look around the world to find the country that needs your help.",
      "image": "assets/images/earth.gif"
    },
    {
      "title": "Back",
      "text":
          "Bet your SOL to the country at a considerable risk of being invaded.",
      "image": "assets/images/shield.png"
    },
    {
      "title": "Vote",
      "text":
          "Watch the world and update your vote on whether that country is being attacked.",
      "image": "assets/images/vote.png"
    },
    {
      "title": "Save",
      "text":
          "Once 50%+ votes decide the country is being invaded, all betted SOL will go to the country to push back the invasion!",
      "image": "assets/images/peace.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  title: splashData[index]["title"],
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    const Spacer(flex: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          child: Text(currentPage > 0 ? "Previous" : ""),
                          onPressed: () {
                            if (currentPage > 0) {
                              _pageController.animateToPage(currentPage - 1,
                                  curve: Curves.easeInOutCubic,
                                  duration: const Duration(milliseconds: 250));
                            }
                          },
                        ),
                        TextButton(
                          child: Text(currentPage == splashData.length - 1
                              ? "Let's Start!"
                              : "Next"),
                          onPressed: () async {
                            if (currentPage == splashData.length - 1) {
                              Preferences.splash = false;
                              Preferences.save();
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                HomeScreen.routeName,
                                ModalRoute.withName(HomeScreen.routeName),
                              );
                            } else {
                              _pageController.animateToPage(currentPage + 1,
                                  curve: Curves.easeInOutCubic,
                                  duration: const Duration(milliseconds: 250));
                            }
                          },
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
