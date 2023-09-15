import 'package:flutter/material.dart';
import 'package:mume/src/ui/homescreen.dart';
import 'package:mume/src/utils/theme_provider.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  String sheetTitle = 'title';

  int stepSelected = 0;

  PageController controller = PageController(initialPage: 0);

  List<Widget> titleList = <Widget>[
    const Text(
      'User friendly mp3 music player your device',
      textAlign: TextAlign.center,
      style: TextStyle(
          fontFamily: 'Poppins', fontSize: 24, fontWeight: FontWeight.w500),
    ),
    const Text(
      'We provide a better audio experience than others',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
    ),
    const Text(
      'Listen to the best audio with Mume now!',
      textAlign: TextAlign.center,
      style: TextStyle(
          fontFamily: 'Poppins', fontSize: 24, fontWeight: FontWeight.w500),
    )
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints:
                const BoxConstraints.expand(), // Makes the container fullscreen
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/woman_listening.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 230,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  color:
                      themeProvider.isDarkMode ? Colors.black : Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 100,
                          child: PageView.builder(
                            controller: controller,
                            itemCount: 3,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return titleList[index];
                            },
                            onPageChanged: (value) {
                              setState(() {
                                stepSelected = value;
                              });
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 8,
                              width: stepSelected == 0 ? 24 : 10,
                              decoration: BoxDecoration(
                                  color: stepSelected == 0
                                      ? Colors.orange
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Container(
                                height: 8,
                                width: stepSelected == 1 ? 24 : 10,
                                decoration: BoxDecoration(
                                    color: stepSelected == 1
                                        ? Colors.orange
                                        : Colors.grey,
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                            ),
                            Container(
                              height: 8,
                              width: stepSelected == 2 ? 24 : 10,
                              decoration: BoxDecoration(
                                  color: stepSelected == 2
                                      ? Colors.orange
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(6)),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.orange),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32))))),
                          onPressed: () {
                            stepSelected == 0 || stepSelected == 1
                                ? controller.nextPage(
                                    duration: const Duration(milliseconds: 30),
                                    curve: Curves.ease)
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Text(
                              stepSelected == 0 || stepSelected == 1
                                  ? 'Next'
                                  : 'Get Started',
                              style: const TextStyle(color: Colors.white),
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
