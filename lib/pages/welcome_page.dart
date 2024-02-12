import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traveller/widgets/app_large_text.dart';
import 'package:traveller/widgets/app_text.dart';
import '../misc/colors.dart';
import '../widgets/responsive_button.dart';
import 'home_page.dart'; // Import your HomePage widget

// Assuming ResponsiveButton is defined in another file, make sure it supports onPressed
// If not, modify it accordingly or see the example definition provided previously

class WelcomePageData {
  final String imageName;
  final String mainText;
  final String subTitle;
  final String description;

  WelcomePageData({
    required this.imageName,
    required this.mainText,
    required this.subTitle,
    required this.description,
  });
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List<WelcomePageData> pages = [
    WelcomePageData(
      imageName: "welcome-four.jpg",
      mainText: "Trips",
      subTitle: "Mountain",
      description: "Make your way into the mountains of Ella and feel freedom on a whole new level!",
    ),
    WelcomePageData(
      imageName: "welcome-two.jpg",
      mainText: "Adventure",
      subTitle: "Trails",
      description: "Journey through the roads and get lost within the freedom!",
    ),
    WelcomePageData(
      imageName: "welcome-three.jpg",
      mainText: "Explore",
      subTitle: "City",
      description: "Discover the vibrant life and culture of the city's heart.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: pages.length,
        itemBuilder: (_, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("img/" + pages[index].imageName),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 80, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(text: pages[index].mainText),
                      AppText(text: pages[index].subTitle, size: 30),
                      SizedBox(height: 20),
                      Container(
                        width: 250,
                        child: AppText(
                          text: pages[index].description,
                          color: Colors.black,
                          size: 18,
                        ),
                      ),
                      SizedBox(height: 40),
                      Container(
                        width: 200,
                        child: ResponsiveButton(
                          width: 120,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage()),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: List.generate(pages.length, (indexDots) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 2),
                        width: 8,
                        height: index == indexDots ? 25 : 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: index == indexDots ? AppColors.mainColor : AppColors.mainColor.withOpacity(0.3),
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
