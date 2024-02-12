import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traveller/misc/colors.dart';
import 'package:traveller/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  final VoidCallback onPressed;
  final String text;// Add an onPressed parameter

  ResponsiveButton({
    super.key,
    this.width = 120,
    this.isResponsive = false,
    required this.onPressed,
    this.text = "Find Out More!"// Make onPressed required
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // Use GestureDetector to handle taps
      onTap: onPressed, // Assign the onPressed callback here
      child: Flexible(
        child: Container(
          width: isResponsive == true ? double.maxFinite : width,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.mainColor,
          ),
          child: Row(
            mainAxisAlignment: isResponsive == true ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
            children: [
              isResponsive == true
                  ? Container(
                margin: const EdgeInsets.only(left: 20),
                child: AppText(text: "Find Out More!", color: Colors.white),
              )
                  : Container(),
              Image.asset("img/button-one.png"),
            ],
          ),
        ),
      ),
    );
  }
}
