import 'package:flutter/material.dart';
import 'package:polandesa/common/style/shadow.dart';
import 'package:polandesa/common/widgets/images/rounded_image.dart';
import 'package:polandesa/utils/constants/colors.dart';
import 'package:polandesa/utils/constants/helpers/helper_functions.dart';
import 'package:polandesa/utils/constants/sizes.dart';
import 'package:polandesa/utils/constants/texts.dart';

class USearchBar extends StatelessWidget {
  const USearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunctions.isDarkMode(context);
    return Padding(
    padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 0),
    child: Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: USizes.searchBarHeight,
              padding: EdgeInsets.symmetric(horizontal: USizes.md),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(USizes.borderRadiusLg),
                color: dark ? UColors.dark : UColors.light,
                boxShadow: UShadow.searchBarShadow,
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: UColors.dark),
                  SizedBox(width: USizes.spaceBtwItems),
                  Expanded(
                    child: Text(
                      UTexts.searchBarTitle,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        SizedBox(width: 10), 
        
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(right: 0),
            child: URoundedImage(imageUrl: "assets/icons/tanya.jpg", isNetworkImage: false, height: 40, width: 40, borderRadius: 20,)
          ),
        ),
      ],
    )
    );
  }
}
