import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traveller/misc/colors.dart';
import 'package:traveller/widgets/app_buttons.dart';
import 'package:traveller/widgets/app_large_text.dart';
import 'package:traveller/widgets/app_text.dart';
import 'package:traveller/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 370,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("img/ella_train.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 50,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.menu),
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Positioned(
              top: 330,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 800,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(text: "Train Journey", color: Colors.black.withOpacity(0.8)),
                        AppLargeText(text: "\$ 50", color: AppColors.mainColor),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: AppColors.mainColor),
                        SizedBox(width: 5),
                        AppText(text: "Sri Lanka, Ella", color: AppColors.textColor1),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(Icons.star, color: index < gottenStars ? AppColors.starColor : AppColors.textColor2);
                          }),
                        ),
                        SizedBox(width: 10),
                        AppText(text: "(4.0)", color: AppColors.textColor2),
                      ],
                    ),
                    SizedBox(height: 15),
                    AppLargeText(text: "People", color: Colors.black.withOpacity(0.8), size: 20),
                    SizedBox(height: 5),
                    AppText(text: "Number of people in your group", color: AppColors.mainTextColor),
                    SizedBox(height: 10),
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: AppButtons(
                              size: 50,
                              color: selectedIndex == index ? Colors.white : Colors.black,
                              backgroundColor: selectedIndex == index ? Colors.black : AppColors.buttonBackground,
                              borderColor: selectedIndex == index ? Colors.black : AppColors.buttonBackground,
                              text: (index + 1).toString(),
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 15),
                    AppLargeText(text: "Description", color: Colors.black.withOpacity(0.8), size: 20),
                    SizedBox(height: 5),
                    AppText(
                      text: "Journey through the mountains in the brand new Ella Legacy, and witness true scenary. This is your chance to witness more in Sri Lanka!",
                      color: AppColors.mainTextColor,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppButtons(
                    size: 60,
                    color: AppColors.textColor1,
                    backgroundColor: Colors.white,
                    borderColor: AppColors.textColor2,
                    isIcon: true,
                    icon: Icons.favorite_border,
                  ),
                  SizedBox(width: 20),
                  // Updated ResponsiveButton to fit and show text
                  Expanded(
                    child: ResponsiveButton(
                      isResponsive: true,
                      onPressed: () {
                        // Define action here, if any
                      },
                      text: "Find Out More!", // Text is now part of ResponsiveButton
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
