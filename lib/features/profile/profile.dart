import 'package:flutter/material.dart';
import 'package:polandesa/common/widgets/images/circular_image.dart';
import 'package:polandesa/features/profile/data/data_menu_profile.dart';
import 'package:polandesa/features/profile/widgets/menu_profile.dart';
import 'package:polandesa/utils/constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsGeometry.only(left: 16, right: 30, top: 80),
          child: Column(
            children: [
              SizedBox(
                height: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 15),
                    UCircularImage(
                      image: "assets/images/profile.jpeg",
                      isNetworkImage: false,
                      height: 100,
                      width: 100,
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Khafid",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "support@hafidtech.com",
                      style: TextStyle(color: UColors.darkerGrey),
                    ),
                  ],
                ),
              ),

              ...dataMenuProfile.map((category) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category['title'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    SizedBox(height: 30),

                    ...category['items'].map<Widget>((item) {
                      return MenuProfile(item: item);
                    }).toList(),
                  ],
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
