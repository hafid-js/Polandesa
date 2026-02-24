import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polandesa/common/widgets/images/circular_image.dart';
import 'package:polandesa/profile/edit_profile.dart';
import 'package:polandesa/profile/setting_profile.dart';
import 'package:polandesa/utils/constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuProfile = [
      {
        "title": "Akun",
        "items": [
          {"icon": "assets/icons/user.png", "name": "Informasi Pribadi"},
          {"icon": "assets/icons/setting.png", "name": "Pengaturan Akun"},
        ],
      },
      {
        "title": "Lainnya",
        "items": [
          {"icon": "assets/icons/file.png", "name": "Syarat & Ketentuan"},
          {"icon": "assets/icons/security.png", "name": "Kebijakan Privasi"},
          {"icon": "assets/icons/star.png", "name": "Rating Aplikasi"},
        ],
      },
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsGeometry.only(left: 16, right: 30, top: 80),
          child: Column(
            children: [
              Container(
                height: 250,
                // height: 250,
                // width: MediaQuery.of(context).size.width,
                // decoration: BoxDecoration(
                //   image: DecorationImage(image: AssetImage("assets/images/background.png"),
                //   fit: BoxFit.cover,
                // ),
                // ),
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

              ...menuProfile.map((category) {
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
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (item['name'] == 'Informasi Pribadi') {
                                Get.to(() => EditProfileScreen());
                              } else if (item['name'] == 'Pengaturan Akun') {
                                Get.to(() => SettingProfileScreen());
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      item['icon'],
                                      height: 25,
                                      width: 25,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      item['name'],
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    if (item['name'] == "Rating Aplikasi")
                                      Text("v1.0.0"),
                                    SizedBox(width: 16),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 22,
                                      color: Colors.blue.withAlpha(90),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 18),
                          if (item['name'] != "Rating Aplikasi")
                            Divider(color: Colors.grey[350], thickness: 1),
                          SizedBox(height: 18),
                        ],
                      );
                    }).toList(),
                  ],
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
