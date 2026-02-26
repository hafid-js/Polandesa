import 'package:flutter/material.dart';
import 'package:polandesa/common/widgets/primary_header_container.dart';
import 'package:polandesa/common/widgets/search_bar.dart';
import 'package:polandesa/features/home/widgets/home_app_bar.dart';
import 'package:polandesa/utils/constants/sizes.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: USizes.homePrimaryHeaderHeight + 10,
      child: Stack(
        children: [
          UPrimaryHeaderContainer(
            height: USizes.homePrimaryHeaderHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                USearchBar(),
                SizedBox(height: 30),
                UHomeAppBar(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}