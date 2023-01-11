import 'package:app4/common/widget/custom_button.dart';
import 'package:app4/common/widget/sizeconfig.dart';
import 'package:app4/features/auth/screens/login_screen.dart';
import 'package:app4/features/onboarding/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = '/onboarding-screen';
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<SliderModel> slides = [];
  int currentIndex = 0;
  bool isLastPage = false;
  final _controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    slides = getSlides();
    _controller.addListener(() {
      setState(() {
        currentIndex = _controller.page!.round();
      });
    });
  }

  void jumpToPage(int page) {
    setState(() {
      currentIndex = page;
    });
    _controller.animateToPage(page,
        duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) {
                setState(() => isLastPage = value == 1);
              },
              itemCount: slides.length,
              itemBuilder: (context, index) {
                //contents of the slider
                return Slider(
                    image: slides[index].getImage(),
                    title: slides[index].getTitle(),
                    description: slides[index].getDescription());
              },
            ),
          ),
        ],
      ),
      bottomSheet: isLastPage
          ? Container(
              color: Colors.white,
              padding: EdgeInsets.only(
                bottom: SizeConfig.safeBlockVertical! * 2,
                right: SizeConfig.safeBlockHorizontal! * 4,
                left: SizeConfig.safeBlockHorizontal! * 4,
              ),
              child: CustomButton(
                color: Colors.yellowAccent,
                text: 'Get Started',
                onTap: () async {
                  //navigate directly to auth screen
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('testpage', true);

                  Navigator.popAndPushNamed(context, LoginScreen.routeName);
                },
              ),
            )
          : Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () => _controller.jumpToPage(2),
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      )),
                  //container created for dots
                  Center(
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 2,
                      effect: const WormEffect(
                        spacing: 16,
                        dotColor: Color.fromARGB(66, 4, 0, 255),
                        activeDotColor: Color.fromARGB(255, 5, 5, 5),
                      ),
                      onDotClicked: (index) => _controller.animateToPage(index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn),
                    ),
                  ),
                  TextButton(
                    onPressed: () => _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class Slider extends StatelessWidget {
  final String? image, title, description;

  //constructor
  const Slider({super.key, this.image, this.title, this.description});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(
            image.toString(),
          ),
        ),
        SizedBox(height: SizeConfig.blockSizeVertical! * 2),
        Padding(
          padding: EdgeInsets.only(
              left: SizeConfig.safeBlockHorizontal! * 0.9,
              right: SizeConfig.safeBlockHorizontal! * 0.9),
          child: Text(
            title.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal! * 7.5,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 151, 22, 22),
            ),
          ),
        ),
        SizedBox(height: SizeConfig.blockSizeVertical! * 2.5),
        Padding(
          padding: EdgeInsets.only(
              left: SizeConfig.safeBlockHorizontal! * 6,
              right: SizeConfig.safeBlockHorizontal! * 6),
          child: Text(
            description.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: SizeConfig.safeBlockHorizontal! * 4.5,
            ),
          ),
        ),
        SizedBox(height: SizeConfig.blockSizeVertical! * 2),
      ],
    );
  }
}
