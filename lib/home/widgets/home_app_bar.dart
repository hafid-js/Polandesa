import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:polandesa/utils/constants/colors.dart';
import 'package:polandesa/utils/constants/helpers/hex_color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:polandesa/common/widgets/images/rounded_image.dart';

class UHomeAppBar extends StatefulWidget {
  const UHomeAppBar({super.key});

  @override
  State<UHomeAppBar> createState() => _UHomeAppBarState();
}

class _UHomeAppBarState extends State<UHomeAppBar> {

  int _currentIndex = 0;

  final List<String> sliderItems = [
    "assets/images/banners/banner-1.png",
    "assets/images/banners/banner-2.jpeg",
    "assets/images/banners/banner-3.png",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: Column(
        children: [
          CarouselSlider(
            items: sliderItems.map(
              (imagePath) => URoundedImage(
                imageUrl: imagePath,
                isNetworkImage: false,
                onTap: () {},
              ),
            ).toList(),
            options: CarouselOptions(
              height: 185,
              viewportFraction: 1.0,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          const SizedBox(height: 10),
          SmoothPageIndicator(
            count: sliderItems.length,
            effect: ExpandingDotsEffect(
              dotHeight: 12,
              dotWidth: 12,
              spacing: 8,
               expansionFactor: 4,
              activeDotColor: HexColor.fromHex("#ff6900"),
              dotColor: UColors.white,
            ),
            controller: PageController(
              initialPage: _currentIndex,
            ),
          ),
        ],
      ),
    );
  }
}